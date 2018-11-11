import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws LineUnavailableException {
        byte[] buf = new byte[2];

        AudioFormat af = new AudioFormat((float) 96000, 8, 2, true, false);
        SourceDataLine sdl = AudioSystem.getSourceDataLine(af);
        sdl.open();
        sdl.start();


        while (true) {
            Paddle.renderToSound(sdl, 0, Math.sin(System.currentTimeMillis() / 3000.0), 80);

            Paddle.renderToSound(sdl, .98, Math.cos(System.currentTimeMillis() / 3000.0), 80);

            Ball.renderToSound(sdl, 0.5, 0, 80);

        }




    }
}