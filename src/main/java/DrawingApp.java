import processing.core.PApplet;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;
import java.util.ArrayList;


public class DrawingApp extends PApplet {
    ArrayList<Line> lines;

    AudioFormat af;
    SourceDataLine sdl;

    ArrayList<Point> buffer;


    @Override
    public void settings() {
        size(500, 500);
    }

    @Override
    public void setup() {
        lines = new ArrayList<Line>();
        buffer = new ArrayList<Point>();
        try {
            af = new AudioFormat((float) 44100, 8, 2, true, false);
            sdl = AudioSystem.getSourceDataLine(af);
            sdl.open();
            sdl.start();
        } catch (LineUnavailableException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void draw() {
        background(0);
        for (Line line : lines) {
            line.render(this);
        }

        if (mousePressed) {

            Line line = new Line(new Point(pmouseX, pmouseY), new Point(mouseX, mouseY));

            lines.add(line);
            buffer.addAll(line.toBufferPoints(50));

        }



        byte[] buf = new byte[2];


        for (Point point : buffer) {

            buf[0] = (byte) (map((float) point.x, 0, width, 0, 100));
            buf[1] = (byte) (100 - map((float) point.y, 0, height, 0, 100));

            sdl.write(buf, 0, 2);

        }


    }


    public static void main(String[] args) {
        PApplet.main("DrawingApp");
    }
}
