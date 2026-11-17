# Diary Owner Isolation

The diary owner is the triple of school, login and selected student id. Passwords and tokens never appear in keys. `DiaryContext` keeps a context generation and the per-day cache. When the owner changes, the cache is cleared and in-flight requests or background recalculations lose the right to update the cache and the UI. Flipping through weeks does not change the generation.

A request captures the generation at the start of `DiaryPagePresenter.e()`. All of its callbacks receive that snapshot when created. The check runs before the presenter is mutated and before the list reaches the view. Lesson mapping and applying a background result additionally re-check that the generation is still current.

## Personal homework storage

Personal homework is stored in `personal_homework_v2`: a single JSON document holds both the notes and the archive-transfer receipts. A record key contains the owner, calendar date, original lesson number and subject. For a lesson without a number, the ordinal occurrence of the subject within the source day is used instead. Bell times are intentionally not part of the key. The binding travels through bell transformation and the card model; model comparison uses object identity, not equality.

## Archive transfer

The editor offers a "Transfer an old record" action. After picking an entry, a confirmation shows the student, date and lesson. Existing text can only be appended to; cancelling writes nothing. The new note and the transfer receipt are committed as a single write. A failure leaves the editor open and the archive entry available. Legacy `personal_homework` records are never modified. Transferred entries stay visible in the archive and their original text can be viewed and copied.

## Bell assignment drafts

When an assignment draft is applied, the mod compares the id of the active profile before and after the operation. The old adjustment is removed only for dates where the profile actually changed. An adjustment created after the assignment is kept; previewing and saving the draft never resets it. The schedule format stays at version 2 and profiles remain shared.

## Automated checks

```bash
bash scripts/test-schedule.sh
python3 scripts/apply-schedule-hooks.py ../decoded
python3 scripts/apply-diary-ui.py ../decoded
bash scripts/build-schedule.sh
python3 scripts/check-schedule-integration.py ../decoded
bash scripts/test-diary-android.sh
./scripts/check-public.sh
```

`test-diary-android.sh` uses an adb-connected device and a separate `app_process` with test models. It exercises the real Android runtime, `SharedPreferences`, rebinding of a recycled card and the timer contract. The APK is not installed, the installed app is not launched and its data is not read. Temporary files live only in a dedicated `/data/local/tmp` directory and are removed afterwards.

## Manual verification after a permitted installation

Automated tests do not replace visual verification of the editor windows in the full app. For a separate test APK, check:

- switching account and student during loading and with the editor open;
- two math lessons on one day, card recycling and return after restart;
- archive picking, student/lesson confirmation, appending to text, cancelling and reading a transferred original;
- "new profile → +7 → save" scenarios, replacing an old assignment, re-assigning and cancelling a draft;
- the timer, lesson highlighting and week flipping.

Installation and publication are out of scope for this stage.
