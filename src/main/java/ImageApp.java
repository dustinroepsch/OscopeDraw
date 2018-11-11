import processing.core.PApplet;
import processing.core.PImage;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;
import java.util.ArrayList;

import java.io.File;


public class ImageApp extends PApplet {
    PImage img;
    PImage edgeImg;
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
        img = null;

        try {
            af = new AudioFormat((float) 44100, 8, 2, true, false);
            sdl = AudioSystem.getSourceDataLine(af);
            sdl.open();
            sdl.start();
        } catch (LineUnavailableException e) {
            e.printStackTrace();
        }

        selectInput("Select a file to process:", "fileSelected");


        background(0);
    }

    public void fileSelected(File selection) {
        if (selection != null) {
            println("User selected " + selection.getAbsolutePath());
            processImage(selection.getAbsolutePath());
        }
    }

    PImage monoImage(PImage img) {
        PImage processedImg = createImage(img.width, img.height, RGB);

        for (int i = 0; i < img.pixels.length; i++) {
            float r = red(img.pixels[i]);
            float g = green(img.pixels[i]);
            float b = blue(img.pixels[i]);

            float c = (r + g + b) / 3.0f;

            processedImg.pixels[i] = color(c);
        }

        return processedImg;
    }


    PImage convolveImage(PImage img, float[][] kernel) {
        PImage processedImg = createImage(img.width, img.height, RGB);

        for (int y = 1; y < img.height-1; y++) { // Skip top and bottom edges
            for (int x = 1; x < img.width-1; x++) { // Skip left and right edges
                float sum = 0; // Kernel sum for this pixel
                for (int ky = -1; ky <= 1; ky++) {
                    for (int kx = -1; kx <= 1; kx++) {
                        // Calculate the adjacent pixel for this kernel point
                        int pos = (y + ky)*img.width + (x + kx);
                        // Image is grayscale, red/green/blue are identical
                        float val = red(img.pixels[pos]);
                        // Multiply adjacent pixels based on the kernel values
                        sum += kernel[ky+1][kx+1] * val;
                    }
                }
                // For this pixel in the new image, set the gray value
                // based on the sum from the kernel
                processedImg.pixels[y*img.width + x] = color(sum, sum, sum);
            }
        }

        return processedImg;
    }

    PImage thresholdImage(PImage img, int threshold) {
        PImage processedImg = createImage(img.width, img.height, RGB);

        for (int i = 0; i < img.pixels.length; i++) {
            if (red(img.pixels[i]) > threshold) {
                processedImg.pixels[i] = color(255);
            }
            else {
                processedImg.pixels[i] = color(0);
            }
        }

        return processedImg;
    }

    void processImage(String absolutePath) {
        img = loadImage(absolutePath);
        img.resize(500, 500);

        float[][] edge_kernel =
                {{ -1, -1, -1},
                { -1,  8, -1},
                { -1, -1, -1}};

//        float[][] blur_kernel =
//                {{ 1.0f/16.0f, 1.0f/8.0f, 1.0f/16.0f},
//                { 1.0f/8.0f, 1.0f/4.0f, 1.0f/8.0f},
//                { 1.0f/16.0f, 1.0f/8.0f, 1.0f/16.0f}};

        float[][] blur_kernel =
                {{ 1.0f/9.0f, 1.0f/9.0f, 1.0f/9.0f},
                { 1.0f/9.0f, 1.0f/9.0f, 1.0f/9.0f},
                { 1.0f/9.0f, 1.0f/9.0f, 1.0f/9.0f}};

        img = monoImage(img);
        img = convolveImage(img, blur_kernel);
        img = convolveImage(img, edge_kernel);
//        img = convolveImage(img, edge_kernel);
        img = thresholdImage(img, 16);

        edgeImg = img;

        lines = generateLines(edgeImg);
        for (Line line : lines) {
            buffer.addAll(line.toBufferPoints(7));
        }
        println("Done Processing");
    }

    boolean IsEdge(PImage eimg, float r, float c) {
        int ri = (int)(r * eimg.height);
        int ci = (int)(c * eimg.width);
        int pos = ri*eimg.width + ci;
        return red(eimg.pixels[pos]) > 0.0f;
    }

    ArrayList<Line> generateLines(PImage edgeImg) {
        ArrayList<Line> lines = new ArrayList<Line>();

        int num_steps = 80;
        int ang_res = 40;

        for (int ri = 0; ri < num_steps; ri++) {
            float radius = ((float)ri + 1) / ((float)num_steps);
            float ang_step = 2.0f * 3.14159f / (ri / 2.0f + 1.0f + ang_res);

            float ang = 0;
            float startx = 0.0f, starty = 0.0f, endx = 0.0f, endy = 0.0f;
            boolean started = false;

            while (ang < 2 * 3.14159) {
                float x = (radius * cos(ang) + 1.0f) / 2.0f;
                float y = (radius * sin(ang) + 1.0f) / 2.0f;

                if (IsEdge(edgeImg, y, x) && !started) {
                    startx = x;
                    starty = y;
                    started = true;
                }

                if (!IsEdge(edgeImg, y, x) && started) {
                    endx = x;
                    endy = y;
                    lines.add(new Line(new Point(startx * 100, starty * 100), new Point(endx * 100, endy * 100)));
                    started = false;
                }

                ang += ang_step;
            }
        }

        return lines;
    }

    @Override
    public void draw() {
//        if (edgeImg != null) {
//            image(edgeImg, 0, 0);
//        }

        stroke(255);
//        line(0, 0, 500, 500);

        for (Line l : lines) {
            line((float)l.start.x * 5.0f, (float)l.start.y * 5.0f, (float)l.end.x * 5.0f, (float)l.end.y * 5.0f);
        }

        byte[] buf = new byte[2];

        for (Point point : buffer) {

            buf[0] = (byte) (map((float) point.x, 0, 100, 0, 100));
            buf[1] = (byte) (100 - map((float) point.y, 0, 100, 0, 100));

            sdl.write(buf, 0, 2);

        }


    }


    public static void main(String[] args) {
        PApplet.main("ImageApp");
    }
}
