import processing.sound.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

boolean faceFound;

Capture video;
OpenCV opencv;
SoundFile resumeViewingAudio;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  resumeViewingAudio = new SoundFile(this, "sample.mp3");
  resumeViewingAudio.loop();

  video.start();
}







void draw() {
  
  
while (faceFound == true) {

}

  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);
  println(faceFound);
   faceFound = false; 
  for (int i = 0; i < faces.length; i++) {
    //println(faces[i].x + "," + faces[i].y);
    println("I SEE YOU");
    faceFound = true;
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    //if (faces.length >= 1) { faceFound = true; } if (faces.length == 0) { faceFound = false; }

  //} else { faceFound = false; 
}
}

void captureEvent(Capture c) {
  c.read();
}