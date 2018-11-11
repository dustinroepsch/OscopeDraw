
import java.util.ArrayList;

public class LineUtils {

    public static boolean CanCombine(Line l, Line candidate, double ang_thresh, double dist_thresh) {
        double dist_thresh_squared = dist_thresh * dist_thresh;

        Line gap = new Line(l.end, candidate.start);

        if (gap.lenSquared() < dist_thresh_squared) {
            if (l.angleTo(candidate) < ang_thresh) {
                return true;
            }
        }

        return false;
    }
}
