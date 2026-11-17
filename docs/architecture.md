# Architecture

## Overview

```text
Original APK
     │
     ▼
   Apktool
     │
     ├── Smali / Dalvik code
     ├── Android XML
     └── graphics resources
            │
            ▼
    RK Note classes & resources
            │
            ▼
   hooks in screens and adapters
            │
            ▼
    APK rebuild and signing
```

The mod never republishes the base app. It ships its own classes and resources plus a documented map of the call sites that must be inserted into a compatible decoded copy of the base APK.

## Components

| Component | Purpose |
| --- | --- |
| `ThemeManager` | Theme, accent color, app icon |
| `DockCustomizer` | Dock order, visibility and behavior |
| `UiCustomizationManager` | Card shape, density, blur and mark styling |
| `BlurHelper` | Blur for header panels, dock and dialogs |
| `LessonCountdownManager` | Current lesson, break and countdown UI |
| `ScheduleSettingsHelper` | Bell profiles, lesson durations, homeroom period |
| `PersonalHomeworkHelper` | Local personal homework notes |
| `GreetingManager` | Time-of-day greeting |
| `TutorialManager` | First-run interface onboarding |
| `AuthUiHelper` | Redesigned authorization screen |
| `AuthFogAnimator` | Fog animation on the authorization screen |
| `SplashAnimator` | Splash screen animation |
| `MarkBadgeHelper` | Mark badges and styling |
| `NetworkMonitor` | UI reaction to connectivity changes |
| `OfflineManager` | Reuse of available local state while offline |

The schedule system is implemented in plain Java in `mod/java/rk/schedule` (`ScheduleResolver`, `ScheduleStore`, `ScheduleBridge`, `ScheduleEditor`, `DiaryContext`) and compiled to Smali by `scripts/build-schedule.sh`. See [bell schedule v2](schedule.md) and [diary owner isolation](diary-isolation.md).

## Settings storage

All user preferences are stored locally via Android `SharedPreferences`: theme, accent color, dock order, card styling, bell profiles, greeting state and personal homework. Personal homework uses a single versioned JSON document (`personal_homework_v2`); the bell schedule uses `rk_schedule_v2/config`. Nothing is sent over the network.

## Injection points

Mod classes are called from a small number of base-app components:

| Base component | Mod call | Purpose |
| --- | --- | --- |
| `MainActivity` | `DockCustomizer.applyDockConfig(...)` | Apply dock configuration |
| `MainActivity` | `BlurHelper.setup(...)` | Set up glass/blur |
| `MainActivity` | `NetworkMonitor.init(...)` | Track network state |
| `AuthorizationActivity` | `AuthUiHelper.setup(...)` | Restyle authorization |
| `AuthorizationActivity` | `AuthFogAnimator.start(...)` | Start fog animation |
| `SplashActivity` | `SplashAnimator.start(...)` | Start new splash |
| `DiaryFragment` | `GreetingManager.attachView(...)` | Attach greeting |
| `DiaryFragment` | `LessonCountdownManager.attachView(...)` | Attach lesson timer |
| Diary adapter | `PersonalHomeworkHelper.bind(...)` | Render personal homework |

Base files are not included in the repository; the table above is the full contract.

## Schedule v2

A single calculation serves the editor, diary cards and the countdown timer. `ScheduleBridge` is the only component that touches obfuscated base-app classes; everything else is pure Java with host-side tests. See [bell schedule v2](schedule.md).
