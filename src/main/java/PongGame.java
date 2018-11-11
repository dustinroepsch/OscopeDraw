import processing.core.PApplet;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;

public class PongGame extends PApplet {
    Paddle leftPlayer;
    Paddle rightPlayer;
    int lastDrawTime;
    SourceDataLine sdl;

    AudioFormat af;

    @Override
    public void settings() {
        size(500, 500);
    }

    @Override
    public void setup() {
        try {

            af = new AudioFormat((float) 44100, 8, 2, true, false);
            sdl = AudioSystem.getSourceDataLine(af);

            sdl.open();
            sdl.start();

            leftPlayer = new Paddle();
            leftPlayer.x = 0;
            rightPlayer = new Paddle();
            rightPlayer.x = 0.95;

            lastDrawTime = millis();
        } catch (LineUnavailableException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void draw() {

        if (keyPressed) {
            if (key == 'q') {
                leftPlayer.y += (millis() - lastDrawTime) / 1000.0;
                if (leftPlayer.y > 1) {
                    leftPlayer.y = 1;
                }
            }
            if (key == 'a') {
                leftPlayer.y -= (millis() - lastDrawTime) / 1000.0;
                if (leftPlayer.y < 0) {
                    leftPlayer.y = 0;
                }
            }
        }

        Paddle.renderToSound(sdl, leftPlayer.x, leftPlayer.y, 200);

        lastDrawTime = millis();
    }

    public static void main(String[] args) {
        PApplet.main("PongGame");
    }
}
