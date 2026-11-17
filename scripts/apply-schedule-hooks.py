#!/usr/bin/env python3
"""Apply only the documented RK Note 1.3.0 schedule integration hooks. Idempotent."""
from pathlib import Path
import re, sys
root = Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).resolve().parents[2]/'decoded'

def method(path, signature, body):
    p=root/path
    source=p.read_text()
    pattern=r'(?m)^\.method '+re.escape(signature)+r'\n.*?^\.end method'
    result,count=re.subn(pattern,lambda _:'.method '+signature+'\n'+body+'\n.end method',source,flags=re.S)
    if count!=1: raise RuntimeError(f'{path}: expected method {signature}')
    p.write_text(result)

def insert(path, old, new):
    p=root/path;s=p.read_text()
    if new in s:return
    if '->capture(Ljava/lang/Object;Ljava/util/List;)V' in new and '->capture(Ljava/lang/Object;Ljava/util/List;)V' in s:return
    if s.count(old)!=1:raise RuntimeError(f'{path}: expected one hook anchor, found {s.count(old)}')
    p.write_text(s.replace(old,new))

manager=Path('smali/c7/LessonCountdownManager.smali')
method(manager,'public static updateTick()V','    .locals 0\n    invoke-static {}, Lrk/schedule/ScheduleBridge;->tick()V\n    return-void')
method(manager,'private static requestTick()V','    .locals 0\n    invoke-static {}, Lc7/LessonCountdownManager;->startTicker()V\n    invoke-static {}, Lrk/schedule/ScheduleBridge;->requestTick()V\n    return-void')
insert(manager,'.method public static attachView(Landroid/view/View;)V\n    .locals 2','.method public static attachView(Landroid/view/View;)V\n    .locals 2\n    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->attach(Landroid/view/View;)V')
for sig in ['showMainDialog','showBellProfilePicker','showDowDialog','showTodayDurationPicker']:
    method(Path('smali/c7/ScheduleSettingsHelper.smali'),f'public static {sig}(Landroid/content/Context;)V','    .locals 0\n    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->open(Landroid/content/Context;)V\n    return-void')
method(Path('smali/c7/ScheduleSettingsHelper.smali'),'public static resetAll(Landroid/content/Context;)V','    .locals 0\n    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->reset(Landroid/content/Context;)V\n    return-void')
method(manager,'public static showHomeroomDialog(Landroid/content/Context;)V','    .locals 0\n    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->open(Landroid/content/Context;)V\n    return-void')
for name in ['show','reset']:
    target='open' if name=='show' else 'resetCorrection'
    method(Path('smali/c7/ManualBellCorrection.smali'),f'public static {name}(Landroid/content/Context;)V',f'    .locals 0\n    invoke-static {{p0}}, Lrk/schedule/ScheduleBridge;->{target}(Landroid/content/Context;)V\n    return-void')
# getShift uses a wide local pair for the multiplier, not a parameter beyond the register file.
method(Path('smali/c7/ManualBellCorrection.smali'),'public static getShift(Landroid/content/Context;)J','    .locals 4\n    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J\n    move-result-wide v0\n    invoke-static {p0, v0, v1}, Lrk/schedule/ScheduleBridge;->shift(Landroid/content/Context;J)I\n    move-result v0\n    int-to-long v0, v0\n    const-wide/32 v2, 0xea60\n    mul-long/2addr v0, v2\n    return-wide v0')
for method_name,target in [('getConfiguredLessonStart','start'),('getConfiguredLessonEnd','end')]:
    method(Path('smali/c7/ScheduleSettingsHelper.smali'),f'public static {method_name}(Landroid/content/Context;Ljava/lang/String;JJ)J',f'    .locals 0\n    invoke-static/range {{p0 .. p5}}, Lrk/schedule/ScheduleBridge;->{target}(Landroid/content/Context;Ljava/lang/String;JJ)J\n    move-result-wide p0\n    return-wide p0')
insert(Path('smali/com/eljur/client/feature/main/view/MainActivity.smali'),'    invoke-static {p0}, Lc7/NetworkMonitor;->init(Lcom/eljur/client/feature/main/view/MainActivity;)V','    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->init(Landroid/content/Context;)V\n    invoke-static {p0}, Lc7/NetworkMonitor;->init(Lcom/eljur/client/feature/main/view/MainActivity;)V')
insert(Path('smali/h6/a.smali'),'    invoke-static {v2}, Lc7/LessonCountdownManager;->onDiaryDataLoaded(Ljava/util/List;)V','    invoke-static {v3, v2}, Lrk/schedule/ScheduleBridge;->capture(Ljava/lang/Object;Ljava/util/List;)V\n    invoke-static {v2}, Lc7/LessonCountdownManager;->onDiaryDataLoaded(Ljava/util/List;)V')
insert(Path('smali/h6/a.smali'),'    :cond_23\n    iget-object v2, v2, Lla/f;->e:Ljava/lang/Object;','    :cond_23\n    iget-object v2, v2, Lla/f;->e:Ljava/lang/Object;\n    invoke-static {v2, v10}, Lrk/schedule/ScheduleBridge;->displayLessons(Ljava/lang/Object;Ljava/util/Date;)Ljava/lang/Object;\n    move-result-object v2')
insert(Path('smali/d6/b.smali'),'    invoke-static {p3, v0, v1, p1}, Lc7/LessonCountdownManager;->highlightIfActive(Landroid/widget/TextView;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V','    invoke-static {p3, v0, v1, p1, v4}, Lrk/schedule/ScheduleBridge;->bind(Landroid/widget/TextView;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V')
insert(Path('smali/h6/a.smali'),'    .line 700\n    move-result v7\n\n    .line 701','    .line 700\n    move-result v7\n    invoke-static {v6, v7}, Lrk/schedule/ScheduleBridge;->skipEmpty(Ljava/lang/Object;Z)Z\n    move-result v7\n\n    .line 701')
insert(Path('smali/h6/a.smali'),'    iget-object v6, v2, Lla/f;->c:Ljava/lang/String;','    iget-object v6, v2, Lla/f;->c:Ljava/lang/String;\n    invoke-static {v6, v10}, Lrk/schedule/ScheduleBridge;->dayType(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;\n    move-result-object v6')
insert(manager,'.method private static startTicker()V\n    .locals 2','.method private static startTicker()V\n    .locals 2\n    sget-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;\n    if-nez v0, :schedule_has_container\n    return-void\n    :schedule_has_container')
# Keep the author-owned compatibility classes synchronized with the public source bundle.
public=Path(__file__).resolve().parents[1]/'mod/smali/c7'
for name in ['LessonCountdownManager','ScheduleSettingsHelper','ManualBellCorrection']:
    (public/(name+'.smali')).write_bytes((root/'smali/c7'/(name+'.smali')).read_bytes())

# Owner lifecycle and per-request stamps. No credential is copied into the bridge.
def scoped_insert(path, signature, anchor, addition):
    p=root/path;s=p.read_text();start=s.index('.method '+signature+'\n');end=s.index('.end method',start)
    body=s[start:end]
    if addition in body:return
    if body.count(anchor)!=1:raise RuntimeError(f'{path}: missing scoped anchor {signature}')
    p.write_text(s[:start]+body.replace(anchor,addition)+s[end:])

session=Path('smali/ha/a.smali')
for signature in ['public constructor <init>(Lid/l;Lba/s;)V','public final e(Lcom/eljur/domain/entity/AuthEntity;)V','public final f(Lcom/eljur/domain/entity/AuthPersistEntity;)V']:
    scoped_insert(session,signature,'    return-void','    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->sessionObserved(Ljava/lang/Object;)V\n    return-void')
scoped_insert(session,'public final e(Lcom/eljur/domain/entity/AuthEntity;)V','    .locals 2','    .locals 2\n    invoke-static {p1}, Lrk/schedule/ScheduleBridge;->authChanging(Ljava/lang/Object;)V')
scoped_insert(session,'public final f(Lcom/eljur/domain/entity/AuthPersistEntity;)V','    .locals 2','    .locals 2\n    invoke-static {p1}, Lrk/schedule/ScheduleBridge;->accountChanged(Ljava/lang/Object;)V')
insert(Path('smali/ga/v.smali'),'    iput-object p1, p0, Lga/v;->a:Ljava/lang/String;','    invoke-static {p1}, Lrk/schedule/ScheduleBridge;->studentChanged(Ljava/lang/String;)V\n    iput-object p1, p0, Lga/v;->a:Ljava/lang/String;')
insert(Path('smali/ia/a.smali'),'    iput-object v2, v1, Lga/v;->a:Ljava/lang/String;','    invoke-static {v2}, Lrk/schedule/ScheduleBridge;->studentChanged(Ljava/lang/String;)V\n    iput-object v2, v1, Lga/v;->a:Ljava/lang/String;')
presenter=Path('smali/com/eljur/client/feature/diaryPage/presenter/DiaryPagePresenter.smali')
scoped_insert(presenter,'public final e()V','    .locals 5','    .locals 5\n    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->beginRequest(Ljava/lang/Object;)V')
scoped_insert(presenter,'public final e()V','    return-void','    invoke-static {}, Lrk/schedule/ScheduleBridge;->endRequest()V\n    return-void')
callback=Path('smali/h6/a.smali')
scoped_insert(callback,'public synthetic constructor <init>(Lcom/eljur/client/feature/diaryPage/presenter/DiaryPagePresenter;I)V','    return-void','    iget-object p1, p0, Lh6/a;->h:Lcom/eljur/client/feature/diaryPage/presenter/DiaryPagePresenter;\n    invoke-static {p0, p1}, Lrk/schedule/ScheduleBridge;->requestCallback(Ljava/lang/Object;Ljava/lang/Object;)V\n    return-void')
scoped_insert(callback,'public final invoke(Ljava/lang/Object;)Ljava/lang/Object;','    move-object/from16 v1, p0','''    move-object/from16 v1, p0
    invoke-static {v1}, Lrk/schedule/ScheduleBridge;->enterCallback(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :rk_current_owner
    iget v0, v1, Lh6/a;->g:I
    if-nez v0, :rk_ignore_result
    new-instance v0, Lla/e;
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    move-result-object v2
    const/4 v3, 0x0
    invoke-direct {v0, v2, v3}, Lla/e;-><init>(Ljava/lang/Object;Ljava/lang/Throwable;)V
    return-object v0
    :rk_ignore_result
    sget-object v0, Lgh/x;->a:Lgh/x;
    return-object v0
    :rk_current_owner''')
# The original countdown intake is superseded by the context-checked bridge cache.
p=root/callback;s=p.read_text();s=s.replace('    invoke-static {v2}, Lc7/LessonCountdownManager;->onDiaryDataLoaded(Ljava/util/List;)V','    # RK: diary intake is owned by ScheduleBridge.');p.write_text(s)
insert(callback,'    invoke-direct/range {v18 .. v24}, Ll9/c;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V','    invoke-direct/range {v18 .. v24}, Ll9/c;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V\n    invoke-static {v12, v7}, Lrk/schedule/ScheduleBridge;->homeworkModel(Ljava/lang/Object;Ljava/lang/Object;)V')
# Carry the complete original lesson identity from the mapper into the recycled card.
p=root/'smali/d6/b.smali';s=p.read_text();old='    invoke-static {v2, v3, v4}, Lc7/PersonalHomeworkHelper;->bind(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V';new='    invoke-static {p1}, Lrk/schedule/ScheduleBridge;->homeworkKey(Ljava/lang/Object;)Ljava/lang/String;\n    move-result-object v5\n    invoke-static {v2, v3, v4, v5}, Lrk/diary/DiaryUi;->bindHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V'
if new not in s:
    if s.count(old)!=1:raise RuntimeError('Missing homework card hook')
    p.write_text(s.replace(old,new))

print('Schedule and owner-context hooks applied.')
