import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws LineUnavailableException {
        byte[] buf = new byte[2];

        AudioFormat af = new AudioFormat((float) 44100, 8, 2, true, false);
        SourceDataLine sdl = AudioSystem.getSourceDataLine(af);
        sdl.open();
        sdl.start();

        int i = 0;

        int scale = 100;
        int steps = 50;

        ArrayList<Point> lineBuf = new Line(new Point(0, 0), new Point(1, 0)).toBufferPoints(steps);
        lineBuf.addAll(new Line(new Point(1, 0), new Point(.5, 1)).toBufferPoints(steps));
        lineBuf.addAll(new Line(new Point(.5, 1), new Point(0, 0)).toBufferPoints(steps));

        boolean goingUp = true;

        while (true) {
            Point current = lineBuf.get(i);

            buf[0] = (byte) (current.x * scale);
            buf[1] = (byte) (current.y * scale);

            sdl.write(buf, 0, 2);

            if (goingUp && i + 1 == lineBuf.size() || !goingUp && i - 1 == 0) {
                goingUp = !goingUp;
            }

            if (goingUp) {
                i++;
            } else {
                i--;
            }

        }
    }


}
