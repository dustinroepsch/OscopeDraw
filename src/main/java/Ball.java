import javax.sound.sampled.SourceDataLine;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Ball {
    static List<Point> drawingBuffer = createBallCenteredAtZero(.05);
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

}
