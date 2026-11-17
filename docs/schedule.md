# Bell Schedule v2

The editor opens from the existing schedule settings. It works on a draft: profiles, assignments, homeroom events and adjustments take effect only after "Apply". Leaving with changes offers to discard the draft.

## Behavior

- A date assignment takes priority over a weekday assignment. Without an assignment, diary hours are used.
- A profile holds eight time pairs bound to lesson numbers. An empty pair inherits the diary time and does not cancel the lesson.
- Profiles are created, copied, renamed and deleted in the "Profile" menu. Deletion first shows the affected assignments.
- Picking a profile in the header switches to editing and previewing it. The scope is set separately with the "Assign" button.
- The generator requires an explicit start, duration, lesson count and break. One long break can be made by changing the next lesson's time and using the shift command.
- Changing an interval does not move the following lessons automatically. "Shift the following ones" applies the end-time difference of the selected lesson, keeping durations and breaks. Inherited later intervals first come from the loaded diary.
- The preview refers to the selected date and the profile being edited. If diary data is not loaded, only explicitly set bells are shown with a notice; missing subjects are not created in the diary.
- Both bounds, format, ordering, overlaps and out-of-day values are validated. On known dates the result is checked together with inherited intervals and events. Future days not yet loaded from the diary cannot be pre-checked: on a conflict the timer suggests checking the schedule, the diary keeps its original rendering and a diagnostic error is logged.
- A manual adjustment is set in whole minutes for a chosen date and applied last to all events. Changing the active assignment resets the adjustment of that date.

## Homeroom period

- **Separate event:** the given interval, no lessons are shifted. Overlaps are forbidden.
- **Instead of a lesson:** the selected lesson is replaced in the local rendering by the homeroom period with the given time. Source data and homework are never rewritten; removing the replacement restores the original lesson.
- **Insert before a lesson:** the start comes from the selected lesson; the duration is the difference of its start/end fields. This and later lessons shift by the inserted duration. Existing breaks are preserved.

An event can be assigned to a date or a weekday. "Remove" clears the setting of the selected scope; deleting a date assignment re-enables the weekday assignment.

## Architecture

Sources live in `mod/java/rk/schedule/`:

- `ScheduleResolver` — pure interval and event calculation, no Android dependencies.
- `ScheduleStore` — a single version-2 JSON document in `rk_schedule_v2/config`, with migration and checked `commit()` writes.
- `ScheduleBridge` — the only adapter to the obfuscated models of the base app: per-day cache, timer and cards.
- `ScheduleEditor` — a compact bottom panel with eight bell rows and ThemeManager colors. One row edits one lesson; extra actions and the full preview live in the menu. Panel height is capped at 72% of the screen and 640 dp. The panel background blurs the activity content with the same BlurView as the dock and respects the `blur_dock` strength setting. Text stays sharp, the glass is clipped to the rounded outline; the light theme uses light tinting.

`capture(presenter, days)` takes the original days without mutating models. `displayLessons(input, date)` returns local lesson copies with calculated times and events; the copy's sort field is its start time. Separate hooks allow showing a standalone homeroom period on an empty day or a day off.

When applied, the bridge rebuilds models from the presenter cache and updates the ViewState without a network request. List positions are saved and restored. Timer updates run on the main thread; an extra refresh request never starts a second periodic loop. Highlighting checks date and lesson number.

Migration runs only when the new document is absent. Old settings are preserved, including raw strings of invalid profiles. Invalid or empty profiles show a setup notice; bells are never generated without an explicit user command. A full reset writes an empty version-2 document, so migration does not run again.

Configuration and adapter errors are logged with the `RKSchedule` tag. A corrupted document is never overwritten automatically.

## Missing data

The previous timer behavior is kept: on a weekday without loaded data the banner hides, on a weekend the stock weekend design is used. A loaded but empty day uses the stock "no lessons today" banner. No extra "no data today" state is shown.

## Menu and animations

The three-dot menu opens a separate compact glass panel: each action has one line-art icon and a short caption. The main list is captioned "Lesson / Start / End / Duration", forms keep permanent field labels.

A shared `ScheduleUi` handles glass, press feedback, panel entrance and sequential item appearance. Windows close with a short animation from `RkScheduleMotion`. The system "disable animations" setting is respected. Stock date, time and text-editing dialogs are also glass-styled; schedule calculations are not affected.

The glass uses flat tinting without white frames, highlights or washed-out item fills. All windows take their background from the activity, so main editor captions never turn into bright spots under the nested menu.

## Build and checks

A compatible working decoded copy of RK Note 1.3.0 with the existing mod components is required. The hook scripts target its exact injection points, not an arbitrary clean APK.

From the `public-repo` directory:

```bash
python3 scripts/apply-schedule-hooks.py ../decoded
./scripts/build-schedule.sh
./scripts/test-schedule.sh
python3 scripts/check-schedule-integration.py ../decoded
./scripts/check-public.sh
```

`build-schedule.sh` compiles Java 8, converts classes with D8 for API 21 and disassembles them through Apktool libraries. It updates only the `rk/schedule` and `rk/diary` packages in the published `mod/smali/` and in the working `decoded/smali_classes3/`. Loading via a third DEX keeps the method table of the first DEX unchanged.

Paths can be overridden via `RK_WORKSPACE`, `RK_JAVA_DIR`, `ANDROID_SDK_ROOT`, `RK_ANDROID_JAR`, `RK_BUILD_TOOLS`, `RK_APKTOOL`.

Host tests need `org.json:json:20240303` via `RK_JSON_JAR` or `../build/schedule/test-libs/json.jar` (SHA-256 `3cf6cd6892e32e2b4c1c39e0f52f5248a2f5b37646fdfbb79a66b46b618414ed`). The dependency and the Android stubs from `tests/support` are used by tests only and never ship in the APK.

Building the APK itself is done separately, keeping existing files:

```bash
java -jar ../tools/apktool.jar b ../decoded -o ../build/RK_Note_schedule_unsigned.apk
java -jar ../tools/uber-apk-signer.jar -a ../build/RK_Note_schedule_unsigned.apk -o ../build/schedule-signed
```

Host tests cover calculation, assignment priority, migration, reset and write errors. The static integration check verifies fields/methods of the base APK and the references of the generated classes.

On Android, separately verify: launch without `VerifyError`, reopening the diary, app restart, keyboard, large font and all themes. A successful build and green host tests do not replace these checks.
