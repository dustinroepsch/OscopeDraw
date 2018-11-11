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
            leftPlayer.y = (float) (.5 - Paddle.PADDLE_HEIGHT / 2.0);
            rightPlayer = new Paddle();
            rightPlayer.y = (float) (.5 - Paddle.PADDLE_HEIGHT / 2.0);
            rightPlayer.x = 0.9f;

            ball = new Ball();


            ball.x = 0.5f;
            ball.y = 0.5f;


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

        ball.normalize();

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

        Paddle.renderToSound(sdl, leftPlayer.x, leftPlayer.y, 250 / 2.0);
        Paddle.renderToSound(sdl, rightPlayer.x, rightPlayer.y, 250 / 2.0);
        Ball.renderToSound(sdl, ball.x, ball.y, 250 / 2.0);

        ball.move((millis() - lastDrawTime) / 1000.0);
//

        if (ball.dx > 0) {
            if (ball.x + 2 * Ball.RADIUS > rightPlayer.x && ball.y + 2 * Ball.RADIUS >= rightPlayer.y && ball.y <= rightPlayer.y + Paddle.PADDLE_HEIGHT) {
                ball.dy = Math.abs(ball.y + Ball.RADIUS - (rightPlayer.y + Paddle.PADDLE_HEIGHT) / 2f);
                ball.dx = -1;
            } else if (ball.x + 2 * Ball.RADIUS > 1) {
                sdl.close();
                System.exit(0);
            }
        } else {
            if (ball.x < leftPlayer.x + Paddle.PADDLE_WIDTH && ball.y + 2 * Ball.RADIUS >= leftPlayer.y && ball.y <= leftPlayer.y + Paddle.PADDLE_HEIGHT) {
                ball.dy = -Math.abs(ball.y + Ball.RADIUS - (leftPlayer.y + Paddle.PADDLE_HEIGHT) / 2f);
                ball.dx = 1;
            } else if (ball.x < 0) {
                sdl.close();
                System.exit(0);
            }
        }
        System.out.println("x: " + ball.x + " y: " + ball.y);
        if (ball.y + 2 * Ball.RADIUS > 1) {
            ball.y = 1 - 2 * Ball.RADIUS;
            ball.dy = -Math.abs(ball.dy);
        }

        if (ball.y < 0) {
            ball.y = 0;
            ball.dy = Math.abs(ball.dy);
        }


        lastDrawTime = millis();

        resetMatrix();

        background(0);
        stroke(255);
        strokeWeight(0.001f);
        scale(width, height);

//        line(0, .5f, 1, .5f);
//
        ball.render(this);
        leftPlayer.render(this);
        rightPlayer.render(this);
    }

    public static void main(String[] args) {
        PApplet.main("PongGame");
    }
}
