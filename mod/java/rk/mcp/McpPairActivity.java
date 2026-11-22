package rk.mcp;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;

/**
 * "Allow devx?": the assistant app asks for the token and the person decides here. The caller must be devx itself
 * (the system tells which app started this screen for a result); anything else is turned away without a word.
 * Allowing switches the MCP server on and hands the token back as the result, so nothing has to be copied.
 */
public final class McpPairActivity extends Activity {
    private static final String CLIENT = "com.apvcode.devx";

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (!CLIENT.equals(getCallingPackage())) {
            setResult(RESULT_CANCELED);
            finish();
            return;
        }
        AlertDialog dialog = new AlertDialog.Builder(this, android.R.style.Theme_Material_Dialog_Alert)
            .setTitle("Разрешить devx?")
            .setMessage("Ассистент devx на этом телефоне сможет читать расписание, ДЗ, оценки, объявления и сообщения из RK Note и записывать ваши заметки по ДЗ.\n\nВключится MCP-сервер: он доступен только на этом телефоне, выключить его можно в настройках RK Note.")
            .setPositiveButton("Разрешить", new DialogInterface.OnClickListener() {
                @Override public void onClick(DialogInterface d, int which) {
                    McpSettings.setEnabled(McpPairActivity.this, true);
                    Intent result = new Intent().putExtra("token", McpSettings.token(McpPairActivity.this)).putExtra("url", "http://127.0.0.1:" + McpSettings.PORT + "/mcp");
                    setResult(RESULT_OK, result);
                    finish();
                }
            })
            .setNegativeButton("Не разрешать", new DialogInterface.OnClickListener() {
                @Override public void onClick(DialogInterface d, int which) { setResult(RESULT_CANCELED); finish(); }
            })
            .setOnCancelListener(new DialogInterface.OnCancelListener() {
                @Override public void onCancel(DialogInterface d) { setResult(RESULT_CANCELED); finish(); }
            })
            .create();
        dialog.show();
    }
}
