import processing.core.PApplet;

import java.util.ArrayList;

import static java.lang.Math.*;

public class Line {
    public final Point start;
    public final Point end;

    public Line(Point start, Point end) {
        this.start = start;
        this.end = end;
    }

    public Point dir() {
        return new Point(this.end.x - this.start.x, this.end.y - this.start.y);
    }

    public double dot(Line other) {
        Point v1 = this.dir();
        Point v2 = other.dir();
        return v1.x * v2.x + v2.y * v1.y;
    }

    public double lenSquared() {
        Point v = this.dir();
        return v.x * v.x +  v.y * v.y;
    }

    public double angleTo(Line other) {
        double cos_angle = this.dot(other) / (sqrt(this.lenSquared()) * sqrt(other.lenSquared()));
        return acos(cos_angle);
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

    public void render(PApplet pApplet) {
        pApplet.stroke(255);

        pApplet.line((float) start.x, (float) start.y, (float) end.x, (float) end.y);
    }
}
