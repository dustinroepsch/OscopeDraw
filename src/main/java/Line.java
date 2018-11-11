import java.util.ArrayList;

public class Line {
    public final Point start;
    public final Point end;

    public Line(Point start, Point end) {
        this.start = start;
        this.end = end;
    }

    public ArrayList<Point> toBufferPoints(int numSteps) {
        ArrayList<Point> points = new ArrayList<Point>();
        for (double u = 0; u < 1; u += 1.0 / numSteps) {
            double currentX = (end.x - start.x) * u + start.x;
            double currentY = (end.y - start.y) * u + start.y;

            points.add(new Point(currentX, currentY));
        }

        return points;
    }

}
