import processing.core.PApplet;

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
            points.add(new Point(currentX, y(currentX)));
        }

        return points;
    }

    private double y(double x) {
        //y = m(x -x1) + y1

        double m = (end.y - start.y) / (end.x - start.x);

        return m * (x - start.x) + start.y;
    }

    public void render(PApplet pApplet) {
        pApplet.stroke(255);

        pApplet.line((float) start.x, (float) start.y, (float) end.x, (float) end.y);
    }
}
