#!/usr/bin/env python3
"""Adds the MCP server switch to a decoded copy of the base APK (and keeps the published mod copies in step).

Usage: apply-mcp-hooks.py <decoded-dir>

It is safe to run again: every step checks whether it was already done.
  1. AndroidManifest.xml: the rk.mcp.McpPairActivity ("Allow devx?") entry and the rk.mcp.McpWakeProvider entry
     (wakes the server after Android stopped the process). Entries of the earlier foreground-service version are removed.
  2. dialog_theme_customizer.xml: the "MCP-сервер" block after the greeting row (found by tags, no new ids).
  3. c7/ThemeManager.smali: one call that wires the block when the dialog is built.
The classes themselves (rk/mcp/*.java) are compiled to Smali by build-schedule.sh.
"""
import pathlib
import re
import sys

decoded = pathlib.Path(sys.argv[1]).resolve()
repo = pathlib.Path(__file__).resolve().parent.parent
mod = repo / "mod"

BLOCK = '''    <!-- MCP server: lets the assistant on this phone (devx) read the schedule, homework and marks -->
    <LinearLayout
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:layout_marginBottom="16.0dip"
        android:orientation="vertical"
        android:paddingStart="14.0dip"
        android:paddingEnd="10.0dip"
        android:background="@drawable/bg_dock_btn_secondary">

        <LinearLayout
            android:layout_width="fill_parent"
            android:layout_height="wrap_content"
            android:minHeight="54.0dip"
            android:orientation="horizontal"
            android:gravity="center_vertical">

            <ImageView
                android:layout_width="28.0dip"
                android:layout_height="28.0dip"
                android:src="@drawable/ic_rk_mcp"
                android:contentDescription="@null" />

            <LinearLayout
                android:layout_width="0.0dip"
                android:layout_height="wrap_content"
                android:layout_weight="1.0"
                android:layout_marginStart="11.0dip"
                android:orientation="vertical">

                <TextView
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:text="MCP-сервер"
                    android:textColor="#FFFFFFFF"
                    android:textSize="13.5sp"
                    android:fontFamily="sans-serif-medium" />

                <TextView
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:layout_marginTop="1.0dip"
                    android:text="Ассистент devx на этом телефоне читает расписание и ДЗ"
                    android:textColor="#8FFFFFFF"
                    android:textSize="10.5sp" />
            </LinearLayout>

            <androidx.appcompat.widget.SwitchCompat
                android:tag="rk_mcp_switch"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:contentDescription="MCP-сервер"
                app:thumbTint="#FFFFFFFF"
                app:trackTint="#800A84FF" />
        </LinearLayout>

        <LinearLayout
            android:tag="rk_mcp_panel"
            android:layout_width="fill_parent"
            android:layout_height="wrap_content"
            android:layout_marginEnd="4.0dip"
            android:layout_marginBottom="12.0dip"
            android:orientation="vertical"
            android:visibility="gone">

            <TextView
                android:tag="rk_mcp_status"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:textColor="#8FFFFFFF"
                android:textSize="10.5sp" />

            <TextView
                android:tag="rk_mcp_token"
                android:layout_width="fill_parent"
                android:layout_height="wrap_content"
                android:layout_marginTop="8.0dip"
                android:textColor="#FFFFFFFF"
                android:textSize="11.0sp"
                android:fontFamily="monospace"
                android:textIsSelectable="true" />

            <LinearLayout
                android:layout_width="fill_parent"
                android:layout_height="wrap_content"
                android:layout_marginTop="10.0dip"
                android:orientation="horizontal">

                <TextView
                    android:tag="rk_mcp_copy"
                    android:layout_width="0.0dip"
                    android:layout_height="40.0dip"
                    android:layout_weight="1.0"
                    android:gravity="center"
                    android:text="Скопировать токен"
                    android:textColor="#FFFFFFFF"
                    android:textSize="12.5sp"
                    android:fontFamily="sans-serif-medium"
                    android:clickable="true"
                    android:background="@drawable/bg_dock_btn_primary" />

                <TextView
                    android:tag="rk_mcp_renew"
                    android:layout_width="0.0dip"
                    android:layout_height="40.0dip"
                    android:layout_weight="0.8"
                    android:layout_marginStart="8.0dip"
                    android:gravity="center"
                    android:text="Новый токен"
                    android:textColor="#FFFFFFFF"
                    android:textSize="12.5sp"
                    android:clickable="true"
                    android:background="@drawable/bg_dock_btn_secondary" />
            </LinearLayout>

            <TextView
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginTop="8.0dip"
                android:text="В devx: MCP-серверы → RK Note → вставьте токен. Сервер слушает только этот телефон."
                android:textColor="#8FFFFFFF"
                android:textSize="10.5sp" />
        </LinearLayout>
    </LinearLayout>

'''

MARK = '    <!-- SECTION 3: ИКОНКА ПРИЛОЖЕНИЯ -->'
CALL = '    invoke-static {v0, p0}, Lrk/mcp/McpSettings;->bind(Landroid/app/Dialog;Landroid/app/Activity;)V\n\n'
AFTER = '    :cond_advanced_done\n'


def patch_layout(path):
    s = path.read_text(encoding="utf-8")
    if "rk_mcp_switch" in s:
        return False
    if MARK not in s:
        sys.exit(f"{path}: the anchor for the MCP block was not found")
    path.write_text(s.replace(MARK, BLOCK + MARK, 1), encoding="utf-8")
    return True


def patch_smali(path):
    s = path.read_text(encoding="utf-8")
    if "Lrk/mcp/McpSettings;->bind" in s:
        return False
    if s.count(AFTER) != 1:
        sys.exit(f"{path}: expected exactly one :cond_advanced_done")
    path.write_text(s.replace(AFTER, AFTER + "\n" + CALL, 1), encoding="utf-8")
    return True


def patch_manifest(path):
    s = path.read_text(encoding="utf-8")
    old = s
    # The first version ran the server in a foreground service with a permanent notification; that is gone.
    s = re.sub(r'\s*<uses-permission android:name="android.permission.FOREGROUND_SERVICE_SPECIAL_USE"\s*/>', "", s)
    s = re.sub(r'\s*<service [^>]*rk\.mcp\.McpService">.*?</service>', "", s, flags=re.S)
    if "rk.mcp.McpPairActivity" not in s:
        activity = ('<activity android:name="rk.mcp.McpPairActivity" android:exported="true" android:excludeFromRecents="true" android:taskAffinity="" '
                    'android:theme="@android:style/Theme.Translucent.NoTitleBar"/>\n        ')
        s = s.replace("</application>", activity + "</application>", 1)
    if "rk.mcp.McpWakeProvider" not in s:
        provider = '<provider android:name="rk.mcp.McpWakeProvider" android:authorities="ru.eljur.region.rkmcp" android:exported="true"/>\n        '
        s = s.replace("</application>", provider + "</application>", 1)
    if s != old:
        path.write_text(s, encoding="utf-8")
    return s != old


done = []
for root in (decoded / "res", mod / "res"):
    done.append(("layout " + str(root), patch_layout(root / "layout" / "dialog_theme_customizer.xml")))
for root in (decoded / "smali", mod / "smali"):
    done.append(("smali " + str(root), patch_smali(root / "c7" / "ThemeManager.smali")))
done.append(("manifest", patch_manifest(decoded / "AndroidManifest.xml")))

icon = mod / "res" / "drawable" / "ic_rk_mcp.xml"
target = decoded / "res" / "drawable" / "ic_rk_mcp.xml"
if icon.exists() and (not target.exists() or target.read_bytes() != icon.read_bytes()):
    target.write_bytes(icon.read_bytes())
    done.append(("icon", True))

for name, changed in done:
    print(("patched  " if changed else "already  ") + name)
