# MCP server

An assistant on the same phone (devx for Android) can read the diary through MCP. The server is **off** until the person turns on "MCP-сервер" in the settings dialog (the one with themes and the greeting switch).

## How it is kept private

- It listens on `127.0.0.1:47822` only; nothing outside the phone can reach it.
- Every request needs `Authorization: Bearer <token>`. The token is made once from `SecureRandom` (`rk_` and 48 hex digits), shown in the settings block with "Скопировать токен" and "Новый токен" (the old one stops working at once).
- A request that carries an `Origin` header (a web page) or a host other than `127.0.0.1:47822` / `localhost:47822` is refused.
- The server runs inside the RK Note process and shows no notification. If Android stops that process, devx asks the empty `McpWakeProvider` (`content://ru.eljur.region.rkmcp`), which starts the process and the server again. The server stops when the switch goes off.
- Nothing is sent anywhere by RK Note. What the assistant reads goes to the model the person chose in devx.

## Transport

"Streamable HTTP" as the MCP spec describes it, JSON answers only (`POST /mcp`; `GET` answers 405). Protocol versions `2025-06-18`, `2025-03-26`, `2024-11-05`. No session id is needed.

## Pairing

Either copy the token from the settings block, or let devx ask: its "Получить токен из RK Note" button opens `rk.mcp.McpPairActivity` for a result. The screen answers only when the caller is `com.apvcode.devx` (the system reports it), asks "Разрешить devx?", and on "Разрешить" switches the server on and returns the token. Nothing is copied through the clipboard.

## Where the data comes from

1. **What is open in the app** (the bridge's in-memory diary days, newest).
2. **What the school app saved on the phone**: its Room database `el_jur_db`, opened read-only (`DiaryDb`): `diary` (days, with lessons, homework and marks as Gson JSON), `lessonMarks` (the marks tab), `period`, `finalGrades`, `announcement`, `message`, `student`. So the assistant sees every week the app ever loaded, not only the open one. The JSON is read leniently (dates as Gson wrote them: US text, ISO or numbers); an unreadable row is skipped.

A day on screen wins over the saved one. A day in neither is reported as not known, with what to do.

## Tools

| Tool | Reads / writes | What it gives |
| --- | --- | --- |
| `rk_status` | read | the student, today, how many diary days are known and their range |
| `rk_now` | read | the current lesson or break, minutes left, the next lesson (with the person's bell schedule) |
| `rk_schedule` | read | lessons of 1–14 days: number, subject, start/end, topic, homework, marks, the person's note |
| `rk_homework` | read | homework by lesson for the next 1–31 days, with the person's notes |
| `rk_marks` | read | marks given in lessons of the known days, by subject |
| `rk_grades` | read | the marks tab: per subject the average and the marks of the periods, with the periods |
| `rk_final_grades` | read | final grades as the app saved them |
| `rk_announcements` | read | school announcements, newest first |
| `rk_messages` | read | messages (by folder), newest first |
| `rk_bell_profiles` | read | bell profiles, which weekdays/dates use them, homeroom periods |
| `rk_notes` | read | the person's own homework notes |
| `rk_note_set` | **write** | sets, replaces or (empty text) deletes the note of one lesson; the diary on screen is redrawn; same owner check as the diary editor |

Everything is about the student who is open (else the first the app knows); a change of student or account drops the in-memory days first.

## Code

`mod/java/rk/mcp`: `McpSettings` (switch, token, settings block), `McpWakeProvider` (restarts the server after the process was stopped), `McpPairActivity` ("Allow devx?"), `McpHttpServer` (sockets and JSON-RPC), `McpTools` (the tools), `DiaryDb` (the app's saved data). The only places that touch the app are `ScheduleBridge.init` (restarts the server that was left on), `ScheduleBridge.loadedDays()` and the models `la.h` (lesson: `a` homework, `b` marks, `c` title, `d` number, `e`/`f` times, `g` topic) and `ma.b` (mark), read by reflection like the rest of the bridge.

`scripts/apply-mcp-hooks.py <decoded>` adds the manifest entries, the settings block and the one call in `ThemeManager.showThemeCustomizerDialog`; `scripts/build-schedule.sh` compiles the package; `scripts/test-mcp.sh` starts the real server on the host and sends it real requests (`scripts/test-mcp.sh serve` waits for a client of your own).
