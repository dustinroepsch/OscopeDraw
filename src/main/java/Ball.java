import processing.core.PApplet;

import javax.sound.sampled.SourceDataLine;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Ball {
    public static final float RADIUS = 0.05f;
    static List<Point> drawingBuffer = createBallCenteredAtZero(RADIUS);
    private static final int number_of_samples = 100;

    public static final float BALL_X_PER_SECOND = 0.1f;

    private static List<Point> createBallCenteredAtZero(float radius) {
        ArrayList<Point> buffer = new ArrayList<Point>();

        for (double angle = 0; angle <= 2 * Math.PI; angle += Math.PI * 2.0 / number_of_samples) {
            Point p = new Point((float) (radius * Math.cos(angle)), (float) (radius * Math.sin(angle)));
            buffer.add(new Point(PApplet.map(p.x, -radius, radius, 0, 2 * radius), PApplet.map(p.y, -radius, radius, 0, 2 * radius)));
        }

        return buffer;
    }

    public static void renderToSound(SourceDataLine sdl, double x, double y, double scale) {
        byte[] buf = new byte[2];

        for (Point p : drawingBuffer) {
            buf[0] = (byte) (p.x * scale + x * scale);
            buf[1] = (byte) (p.y * scale + y * scale);
            sdl.write(buf, 0, buf.length);

        }

    }

    public float x = 0;
    public float y = 0;


    public float dx = 0.08f;
    public float dy = 0.08f;

    public void normalize() {
        float mag = (float) Math.sqrt(dx * dx + dy * dy);
        dx = dx / mag;
        dy = dy / mag;

        dx = dx * BALL_X_PER_SECOND;
        dy = dy * BALL_X_PER_SECOND;
    }

    public void move(double seconds) {
        x += dx * seconds;
        y += dy * seconds;
    }

    public void render(PApplet pApplet) {

        pApplet.rect(
                x, y, RADIUS * 2, RADIUS * 2
        );
    }
}
