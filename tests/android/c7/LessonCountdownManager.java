package c7;
import android.view.View;
import java.util.*;
/** Timer host contract for Android runtime tests, isolated from the installed app. */
public final class LessonCountdownManager {
    public static View sContainer;public static List<?> sLessons=Collections.emptyList();public static String sCurrentActiveLessonNum="",title="";
    public static long sPrevAdjustedEnd,sPrevOrigEnd;public static String sLastUiTitle="";
    private static void setUi(String icon,String text,int bg,int fg,String time){title=text;}
    public static void showWeekendOrRelaxUi(){title="Отдых";}
}
