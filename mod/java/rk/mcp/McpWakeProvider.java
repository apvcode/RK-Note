package rk.mcp;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;

/**
 * Wakes the MCP server. The server lives inside the RK Note process and shows no notification; when Android has
 * stopped that process, the assistant (devx) asks this provider something, the system starts the process again and
 * the server comes back up (if the switch is on). It holds no data and answers every question with an empty table.
 */
public final class McpWakeProvider extends ContentProvider {
    @Override public boolean onCreate() {
        if (getContext() != null) McpSettings.resume(getContext());
        return true;
    }

    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        return new MatrixCursor(new String[]{"running"});
    }

    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int delete(Uri uri, String selection, String[] selectionArgs) { return 0; }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) { return 0; }
}
