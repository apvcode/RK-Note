#!/usr/bin/env python3
"""Verify the version-specific reflection contract and generated schedule references."""
from pathlib import Path
import re,sys,subprocess,os
root=Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).resolve().parents[2]/'decoded'
expected={
 'smali/ha/a.smali':['.method public final a()Lcom/eljur/domain/entity/AuthEntity;','.method public final c()Lcom/eljur/domain/entity/AuthPersistEntity;','Lrk/schedule/ScheduleBridge;->sessionObserved(Ljava/lang/Object;)V','Lrk/schedule/ScheduleBridge;->accountChanged(Ljava/lang/Object;)V','Lrk/schedule/ScheduleBridge;->authChanging(Ljava/lang/Object;)V'],
 'smali/wa/b.smali':['.field public final b:Lga/v;'],
 'smali/ga/v.smali':['.field public a:Ljava/lang/String;','Lrk/schedule/ScheduleBridge;->studentChanged(Ljava/lang/String;)V'],
 'smali/ia/a.smali':['Lrk/schedule/ScheduleBridge;->studentChanged(Ljava/lang/String;)V'],
 'smali/com/eljur/domain/entity/AuthPersistEntity.smali':['.method public final a()Ljava/lang/String;','.method public final b()Ljava/lang/String;'],
 'smali/la/h.smali':['.field public final a:Ljava/lang/Object;','.field public final b:Ljava/util/List;','.field public final c:Ljava/lang/String;','.field public final d:Ljava/lang/String;','.field public final e:Ljava/util/Date;','.field public final f:Ljava/util/Date;','.field public final g:Ljava/lang/String;','.field public final h:I','.field public final i:Lla/j;','.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;ILla/j;)V'],
 'smali/la/f.smali':['.field public final a:Ljava/util/Date;','.field public final e:Ljava/lang/Object;'],
 'smali/la/e.smali':['.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Throwable;)V'],
 'smali/h6/a.smali':['.method public synthetic constructor <init>(Lcom/eljur/client/feature/diaryPage/presenter/DiaryPagePresenter;I)V','.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;','Lrk/schedule/ScheduleBridge;->capture','Lrk/schedule/ScheduleBridge;->displayLessons','Lrk/schedule/ScheduleBridge;->skipEmpty','Lrk/schedule/ScheduleBridge;->dayType','Lrk/schedule/ScheduleBridge;->enterCallback','Lrk/schedule/ScheduleBridge;->requestCallback','Lrk/schedule/ScheduleBridge;->homeworkModel'],
 'smali/com/eljur/client/feature/diaryPage/presenter/DiaryPagePresenter.smali':['.field public h:Ljava/util/List;','.field public final e:Lwa/b;','Lrk/schedule/ScheduleBridge;->beginRequest','Lrk/schedule/ScheduleBridge;->endRequest'],
 'smali/com/eljur/client/feature/diaryPage/view/DiaryPageFragment.smali':['.method public final U(ILjava/util/List;)V'],
 'smali/androidx/recyclerview/widget/LinearLayoutManager.smali':['.method public final onRestoreInstanceState(Landroid/os/Parcelable;)V','.method public final onSaveInstanceState()Landroid/os/Parcelable;'],
 'smali/eightbitlab/com/blurview/BlurView.smali':['.method public constructor <init>(Landroid/content/Context;)V','.method public setOverlayColor(I)Leightbitlab/com/blurview/BlurViewFacade;','.method public setBlurRadius(F)Leightbitlab/com/blurview/BlurViewFacade;'],
 'smali/c7/LiquidGlassDialogHelper.smali':['.method public static setupFromContext(Landroid/app/Dialog;Landroid/content/Context;I)V'],
 'smali/c7/UiCustomizationManager.smali':['.method public static getBlurRadius(Landroid/content/Context;Ljava/lang/String;)F'],
 'smali/eightbitlab/com/blurview/BlurViewFacade.smali':['.method public abstract setFrameClearDrawable(Landroid/graphics/drawable/Drawable;)Leightbitlab/com/blurview/BlurViewFacade;'],
 'smali/d6/b.smali':['Lrk/schedule/ScheduleBridge;->bind','Lrk/schedule/ScheduleBridge;->homeworkKey','Lrk/diary/DiaryUi;->bindHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V'],
}
checks=0
for name,anchors in expected.items():
    text=(root/name).read_text()
    for anchor in anchors:
        if anchor not in text:raise SystemExit(f'Missing contract: {name}: {anchor}')
        checks+=1
# Results must be checked before both presenter state assignment and view delivery.
callback=(root/'smali/h6/a.smali').read_text()
if callback.index('->enterCallback')>callback.index('->h:Ljava/util/List;'):raise SystemExit('Context check follows presenter mutation')
if '->onDiaryDataLoaded(Ljava/util/List;)V' in callback:raise SystemExit('Unscoped countdown intake remains')
if callback.count('->requestCallback')!=1 or callback.count('->enterCallback')!=1:raise SystemExit('Repeated request context hooks')
checks+=4
methods={};parents={};external={}
for path in (root/'smali_classes3/rk').rglob('*.smali'):
    source=path.read_text();cls=re.search(r'^\.class [^\n]*?(L[^;]+;)',source,re.M).group(1)
    methods[cls]={line.split()[-1] for line in source.splitlines() if line.startswith('.method ')}
    parent=re.search(r'^\.super (L[^;]+;)',source,re.M);parents[cls]=parent.group(1) if parent else None
android_jar=os.environ.get('RK_ANDROID_JAR','/home/mega/Android/Sdk/platforms/android-37.0/android.jar')
javap=os.environ.get('RK_JAVAP','/home/mega/Applications/android-studio/jbr/bin/javap')
def inherited(cls,signature,seen=None):
    seen=set() if seen is None else seen
    if cls is None or cls in seen:return False
    seen.add(cls)
    if cls in methods:return signature in methods[cls] or inherited(parents.get(cls),signature,seen)
    if cls not in external:
        result=subprocess.run([javap,'-classpath',android_jar,'-s',cls[1:-1].replace('/','.')],capture_output=True,text=True,check=True).stdout
        signatures=set();name=None;parent=None
        for line in result.splitlines():
            if (' class ' in line or ' interface ' in line) and 'extends ' in line:
                match=re.search(r'extends ([\w.$]+)',line)
                if match:parent='L'+match.group(1).replace('.','/')+';'
            if '(' in line:
                match=re.search(r'([\w.$]+)\(',line)
                if match:name=match.group(1)
            if 'descriptor:' in line and name is not None:
                signatures.add(name+line.split('descriptor:',1)[1].strip());name=None
        external[cls]=(signatures,parent)
    signatures,parent=external[cls]
    return signature in signatures or inherited(parent,signature,seen)
for directory in ['smali_classes3/rk','smali/c7','smali/h6','smali/d6','smali/ha','smali/ga','smali/ia','smali/com/eljur/client/feature/diaryPage/presenter']:
    for path in (root/directory).rglob('*.smali'):
        for cls,signature in re.findall(r'\b(Lrk/(?:schedule|diary)/[^;]+;)->([^\s,]+\([^\s]+)',path.read_text()):
            if not inherited(cls,signature):raise SystemExit(f'Unknown generated target: {path}: {cls}->{signature}')
            checks+=1
# Confirm that the added action does not replace the original binding or attachment IDs.
import xml.etree.ElementTree as ET
android='{http://schemas.android.com/apk/res/android}'
for filename,ids,tag in [
    ('item_diary_lesson_info.xml',{'separator','textNum','textName','textTime'},'rk_diary_add_homework'),
    ('item_diary_homework.xml',{'textHomework','imageHomework','recyclerFilesAndResources'},'rk_diary_school_label')]:
    tree=ET.parse(root/'res/layout'/filename)
    actual={n.get(android+'id','').split('/')[-1] for n in tree.iter()}
    if not ids<=actual:raise SystemExit(f'Missing original diary binding IDs: {filename}')
    if sum(n.get(android+'tag')==tag for n in tree.iter())!=1:raise SystemExit(f'Missing or repeated diary action: {filename}')
    checks+=len(ids)+1
print(f'Mod integration: {checks} contract/reference/layout checks passed.')
