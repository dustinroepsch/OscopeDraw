import processing.core.PApplet;

import javax.sound.sampled.SourceDataLine;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Paddle {
    public static final float PADDLE_WIDTH = .05f;
    public static final float PADDLE_HEIGHT = .25f;


    public static final int samples_per_line = 100;
    static List<Line> paddleShape = Arrays.asList(
            new Line(new Point(0, 0), new Point(PADDLE_WIDTH, 0)),
            new Line(new Point(PADDLE_WIDTH, 0), new Point(PADDLE_WIDTH, PADDLE_HEIGHT)),
            new Line(new Point(PADDLE_WIDTH, PADDLE_HEIGHT), new Point(0, PADDLE_HEIGHT)),
            new Line(new Point(0, PADDLE_HEIGHT), new Point(0, 0))


    );

    private static ArrayList<Point> drawingBuffer = calculateBuffer();

    private static ArrayList<Point> calculateBuffer() {
        ArrayList<Point> buffer = new ArrayList<Point>();
        for (Line line : paddleShape) {
            buffer.addAll(line.toBufferPoints(samples_per_line));
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

    public float x, y;

    public void render(PApplet pApplet) {

        pApplet.rect(
                x, y, PADDLE_WIDTH, PADDLE_HEIGHT
        );
    }

}
