# Diary UI Update

## Interface

- The subject name takes the full available width; the time sits below it and no longer squeezes long names.
- Each card has a compact pencil button (44 dp, with a spoken action label). The personal homework note is shown as a separate block and edited by tapping; the long-press on the subject keeps working.
- School homework keeps a permanent caption and readable text. Attachments and the original ViewBinding ids are preserved.
- The current lesson is marked with a thin accent stripe and a progress bar until the bell. Date and lesson number are checked; progress uses the same calculation as the timer. Yesterday's and tomorrow's cards are never highlighted.
- Marks share consistent sizes and follow the shape/color settings. Details open in a small dialog with the same clean blur and animations as the bell settings.
- No light highlights or white gradients; no permanent per-card BlurView. Blur is used in dialogs only.

The top banner keeps its previous captions: current lesson and room, next lesson, or break. Waits over an hour are shown as hours and minutes; a lesson or a short break counts down as mm:ss. Timetable entries without times stay in the list but do not affect other lessons; assigned bells can give them a time by number. The stock mapper is re-run off the UI thread because it reads Room.

Status icons of the banner are drawn by `rk.schedule.BannerGlyph`: book, bell, cup, school, completion and day off. A shared 20 dp size and uniform stroke width; colors match the timer badge. Banner captions, times and background are unchanged.

## Data and integration

`mod/java/rk/diary/DiaryUi.java` is presentation-only. Personal homework lives in the `personal_homework_v2` store; record keys are owner-scoped JSON arrays produced by `PersonalHomeworkStore.Id` (owner, date, lesson number, subject). School assignments and lesson models are never rewritten. Saving verifies the write result; on failure the dialog stays open.

Hooks go through the mod's `PersonalHomeworkHelper`, `MarkBadgeHelper`, `MarkDetailsPopup` and `UiCustomizationManager`. Progress stripes are updated by the existing ticker without a second periodic handler. Weak references do not keep recycled cards alive.

`scripts/apply-diary-ui.py` changes only the required attributes and adds mod elements into compatible XML layouts. Full base-app layouts are never copied into the public repository.

```bash
python3 scripts/apply-diary-ui.py ../decoded
./scripts/build-schedule.sh
python3 scripts/check-schedule-integration.py ../decoded
./scripts/test-schedule.sh
./scripts/check-public.sh
```

The build compiles both `rk.schedule` and `rk.diary` into a third DEX. The integration check verifies their references, inherited Android methods and the integrity of required layout ids.

Owner isolation (accounts, students, archive transfer) is described in [diary-isolation.md](diary-isolation.md).

## On-device verification

Builds and host tests do not replace visual checks. Verify: opening and cancelling the personal homework editor, saving and clearing notes, scrolling with card recycling, long subjects, attachments, mark details and theme switching.
