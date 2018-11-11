import processing.core.PApplet;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;

public class PongGame extends PApplet {
    Paddle leftPlayer;
    Paddle rightPlayer;
    Ball ball;
    int lastDrawTime;
    SourceDataLine sdl;

    AudioFormat af;


    boolean leftPlayerMovingUp = false;
    boolean leftPlayerMovingDown = false;


    boolean rightPlayerMovingUp = false;
    boolean rightPlayerMovingDown = false;


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
            leftPlayer.y = .5 - Paddle.PADDLE_HEIGHT / 2.0;
            rightPlayer = new Paddle();
            rightPlayer.y = .5 - Paddle.PADDLE_HEIGHT / 2.0;
            rightPlayer.x = 0.9;

            ball = new Ball();


            ball.x = 0.5;
            ball.y = 0.5;


            lastDrawTime = millis();
        } catch (LineUnavailableException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void keyPressed() {
        if (key == 'q') {
            leftPlayerMovingUp = true;
        }
        if (key == 'a') {
            leftPlayerMovingDown = true;
        }
        if (key == 'o') {
            rightPlayerMovingUp = true;
        }
        if (key == 'l') {
            rightPlayerMovingDown = true;
        }
    }

    @Override
    public void keyReleased() {
        if (key == 'q') {
            leftPlayerMovingUp = false;
        }
        if (key == 'a') {
            leftPlayerMovingDown = false;
        }
        if (key == 'o') {
            rightPlayerMovingUp = false;
        }
        if (key == 'l') {
            rightPlayerMovingDown = false;
        }
        if (key == 'n') {
            System.out.println("Set breakpoint here for pause key");
        }
    }

    @Override
    public void draw() {

        if (keyPressed) {
            if (leftPlayerMovingUp) {
                leftPlayer.y += (millis() - lastDrawTime) / 1000.0;
                if (leftPlayer.y > 1 - Paddle.PADDLE_HEIGHT) {
                    leftPlayer.y = 1 - Paddle.PADDLE_HEIGHT;
                }
            }
            if (leftPlayerMovingDown) {
                leftPlayer.y -= (millis() - lastDrawTime) / 1000.0;
                if (leftPlayer.y < 0) {
                    leftPlayer.y = 0;
                }
            }
            if (rightPlayerMovingUp) {
                rightPlayer.y += (millis() - lastDrawTime) / 1000.0;
                if (rightPlayer.y > 1 - Paddle.PADDLE_HEIGHT) {
                    rightPlayer.y = 1 - Paddle.PADDLE_HEIGHT;
                }
            }
            if (rightPlayerMovingDown) {
                rightPlayer.y -= (millis() - lastDrawTime) / 1000.0;
                if (rightPlayer.y < 0) {
                    rightPlayer.y = 0;
                }
            }
        }

        Paddle.renderToSound(sdl, leftPlayer.x, leftPlayer.y, 255 / 2.0);
        Paddle.renderToSound(sdl, rightPlayer.x, rightPlayer.y, 255 / 2.0);
        Ball.renderToSound(sdl, ball.x, ball.y, 255 / 2.0);

        ball.move((millis() - lastDrawTime) / 1000.0);
//

        if (ball.dx > 0) {
            if (ball.x > rightPlayer.x - Paddle.PADDLE_WIDTH && Math.abs(ball.y - (rightPlayer.y + Paddle.PADDLE_HEIGHT / 2f)) < Paddle.PADDLE_HEIGHT / 2f) {
                ball.dx = -Math.abs(ball.x - rightPlayer.y + Paddle.PADDLE_HEIGHT / 2f);
            } else if (ball.x > 1) {
                sdl.close();
                System.exit(0);
            }
        } else {
            if (ball.x - Ball.RADIUS < leftPlayer.x + Paddle.PADDLE_WIDTH && Math.abs(ball.y - (leftPlayer.y + Paddle.PADDLE_HEIGHT / 2f)) < Paddle.PADDLE_HEIGHT / 2f) {
                ball.dx = Math.abs(ball.x - leftPlayer.y + Paddle.PADDLE_HEIGHT / 2f);
            } else if (ball.x < 0) {
                sdl.close();
                System.exit(0);
            }
        }

        if (ball.y > 1 - Ball.RADIUS / 2f) {
            ball.y = 1 - Ball.RADIUS / 2f;
            ball.dy = -Math.abs(ball.dy);
        }
        if (ball.y < Ball.RADIUS / 2f) {
            ball.y = Ball.RADIUS / 2f;
            ball.dy = Math.abs(ball.dy);
        }


        lastDrawTime = millis();
    }

    public static void main(String[] args) {
        PApplet.main("PongGame");
    }
}
