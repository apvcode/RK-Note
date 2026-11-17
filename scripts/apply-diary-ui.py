#!/usr/bin/env python3
"""Author-owned diary presentation changes for the compatible RK Note base."""
from pathlib import Path
import re,sys,xml.etree.ElementTree as ET
root=Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).resolve().parents[2]/'decoded'
A='http://schemas.android.com/apk/res/android';P='http://schemas.android.com/apk/res-auto'
ET.register_namespace('android',A);ET.register_namespace('app',P)
def a(n):return '{'+A+'}'+n
def p(n):return '{'+P+'}'+n
def attrs(node,values):
    for name,value in values.items():node.set(p(name[4:]) if name.startswith('app:') else a(name),value)
def by_id(tree,name):return next(node for node in tree.iter() if node.get(a('id')) in ['@id/'+name,'@+id/'+name])
path=root/'res/layout/item_diary_lesson_info.xml';tree=ET.parse(path);base=tree.getroot();base.set(a('foreground'),'@null')
container=next(node for node in base if node.tag.endswith('ConstraintLayout'))
num=by_id(tree,'textNum');attrs(num,{'layout_width':'30dp','layout_height':'30dp','textSize':'12sp'})
name=by_id(tree,'textName');attrs(name,{'textSize':'17sp','layout_marginStart':'12dp','layout_marginEnd':'0dp','app:layout_constraintEnd_toEndOf':'parent'})
name.attrib.pop(p('layout_constraintEnd_toStartOf'),None)
time=by_id(tree,'textTime');attrs(time,{'textSize':'11.5sp','layout_marginStart':'12dp','layout_marginEnd':'8dp','maxWidth':'230dp','maxLines':'1','ellipsize':'end','app:layout_constraintStart_toEndOf':'@id/textNum','app:layout_constraintTop_toTopOf':'@id/rk_diary_add_homework','app:layout_constraintBottom_toBottomOf':'@id/rk_diary_add_homework'})
time.attrib.pop(p('layout_constraintEnd_toEndOf'),None)
button=next((node for node in container if node.get(a('tag'))=='rk_diary_add_homework'),None)
if button is None:button=ET.SubElement(container,'TextView')
attrs(button,{'id':'@+id/rk_diary_add_homework','tag':'rk_diary_add_homework','layout_width':'44dp','layout_height':'44dp','paddingStart':'0dp','paddingEnd':'0dp','gravity':'center','text':'✎','textSize':'22sp','fontFamily':'sans-serif-medium','clickable':'true','focusable':'true','app:layout_constraintEnd_toEndOf':'parent','app:layout_constraintTop_toBottomOf':'@id/textName'})
# Reserve the action's width without squeezing long lesson titles.
time.set(p('layout_constraintEnd_toStartOf'),'@id/rk_diary_add_homework');time.set(a('layout_width'),'wrap_content');time.set(p('layout_constrainedWidth'),'true');time.set(p('layout_constraintHorizontal_bias'),'0')
note=next(node for node in tree.iter() if node.get(a('tag'))=='rk_personal_homework_blur')
attrs(note,{'layout_marginStart':'36dp','layout_marginEnd':'0dp','layout_marginTop':'2dp','layout_marginBottom':'8dp','background':'@android:color/transparent','app:layout_constraintTop_toBottomOf':'@id/rk_diary_add_homework'})
for node in list(note):
    if node.tag=='View':note.remove(node)
text=next(node for node in note if node.get(a('tag'))=='rk_personal_homework');attrs(text,{'textSize':'14sp','drawableStart':'@null','layout_marginTop':'10dp','layout_marginBottom':'10dp'})
ET.indent(tree,space='    ');tree.write(path,encoding='utf-8',xml_declaration=True)
path=root/'res/layout/item_diary_homework.xml';tree=ET.parse(path);card=next(n for n in tree.iter() if n.get(a('tag'))=='rk_homework_card');heading=next((n for n in card if n.get(a('tag'))=='rk_diary_school_label'),None)
if heading is None:heading=ET.SubElement(card,'TextView')
attrs(heading,{'id':'@+id/rk_diary_school_label','tag':'rk_diary_school_label','layout_width':'0dp','layout_height':'wrap_content','layout_marginStart':'8dp','text':'Домашнее задание','textSize':'11sp','fontFamily':'sans-serif-medium','app:layout_constraintStart_toEndOf':'@id/imageHomework','app:layout_constraintEnd_toEndOf':'parent','app:layout_constraintTop_toTopOf':'parent'})
body=by_id(tree,'textHomework');body.attrib.pop(p('layout_constraintTop_toTopOf'),None);attrs(body,{'textSize':'14sp','lineSpacingExtra':'2dp','layout_marginTop':'4dp','app:layout_constraintTop_toBottomOf':'@id/rk_diary_school_label'})
ET.indent(tree,space='    ');tree.write(path,encoding='utf-8',xml_declaration=True)

def method(name,signature,body):
    path=root/'smali/c7'/(name+'.smali');source=path.read_text();pattern=r'(?m)^\.method '+re.escape(signature)+r'\n.*?^\.end method'
    source,count=re.subn(pattern,lambda _:'.method '+signature+'\n'+body+'\n.end method',source,flags=re.S)
    if count!=1:raise RuntimeError('Unknown method: '+name+' '+signature)
    if path.read_text()!=source:path.write_text(source)
for old,new,signature in [
 ('bind','bindHomework','(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V'),
 ('render','renderHomework','(Landroid/view/View;Landroid/content/Context;Ljava/lang/String;)V'),
 ('showEditor','editHomework','(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V')]:
    method('PersonalHomeworkHelper','public static '+old+signature,'    .locals 0\n    invoke-static {p0, p1, p2}, Lrk/diary/DiaryUi;->'+new+signature+'\n    return-void')
method('MarkDetailsPopup','public static show(Landroid/view/View;Ljava/lang/CharSequence;I)V','    .locals 0\n    invoke-static {p0, p1, p2}, Lrk/diary/DiaryUi;->showMarkDetails(Landroid/view/View;Ljava/lang/CharSequence;I)V\n    return-void')
method('MarkBadgeHelper','public static styleBadge(Landroid/widget/TextView;I)V','    .locals 0\n    invoke-static {p0, p1}, Lrk/diary/DiaryUi;->styleMark(Landroid/widget/TextView;I)V\n    return-void')
method('MarkBadgeHelper','public static styleSpecialBadge(Landroid/widget/TextView;I)V','    .locals 0\n    invoke-static {p0, p1}, Lrk/diary/DiaryUi;->styleMark(Landroid/widget/TextView;I)V\n    return-void')
method('UiCustomizationManager','public static applyAgain(Landroid/view/View;II)V','    .locals 0\n    invoke-static {p0, p1, p2}, Lc7/UiCustomizationManager;->applyToTreeInternal(Landroid/view/View;II)V\n    invoke-static {p0}, Lrk/diary/DiaryUi;->styleTree(Landroid/view/View;)V\n    return-void')
# Every banner status, including weekends, uses the same vector-style glyphs.
manager=root/'smali/c7/LessonCountdownManager.smali'
source=manager.read_text()
old='    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V'
new='    invoke-static {v0, p0, p3}, Lrk/schedule/BannerGlyph;->apply(Landroid/widget/TextView;Ljava/lang/String;I)V'
start=source.index('.method private static setUi(');end=source.index('.end method',start)
body=source[start:end]
if new not in body:
    if body.count(old)!=1:raise RuntimeError('Unknown banner icon hook')
    source=source[:start]+body.replace(old,new)+source[end:]
    manager.write_text(source)
public=Path(__file__).resolve().parents[1]/'mod/smali/c7'
for name in ['PersonalHomeworkHelper','MarkDetailsPopup','MarkBadgeHelper','UiCustomizationManager','LessonCountdownManager']:(public/(name+'.smali')).write_bytes((root/'smali/c7'/(name+'.smali')).read_bytes())
print('Diary UI layout and hooks applied.')
