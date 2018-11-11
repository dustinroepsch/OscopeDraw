import javax.sound.sampled.SourceDataLine;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Ball {
    public static final double RADIUS = 0.05;
    static List<Point> drawingBuffer = createBallCenteredAtZero(RADIUS);
    private static final int number_of_samples = 40;

    private static List<Point> createBallCenteredAtZero(double radius) {
        ArrayList<Point> buffer = new ArrayList<Point>();

        for (double angle = 0; angle <= 2 * Math.PI; angle += Math.PI * 2.0 / number_of_samples) {
            buffer.add(new Point(radius * Math.cos(angle), radius * Math.sin(angle)));
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

    public double x = 0;
    public double y = 0;


    public double dx = 0.08;
    public double dy = 0.08;

    public void move(double seconds) {
        x += dx * seconds;
        y += dy * seconds;
    }
}
