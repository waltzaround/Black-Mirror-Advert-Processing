
import ddf.minim.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

boolean faceFound;

//video stuff
Capture video;
OpenCV opencv;

//sound stuff
Minim minim;
AudioPlayer resumeViewingAudio;
Movie advert;


void setup() {
  size(1920, 1080);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  delay(5000);
  //video stuff
  advert = new Movie(this, "iphone1080.mp4");
  advert.loop();
  
  //audio stuff
  minim = new Minim(this);
  resumeViewingAudio = minim.loadFile("resume.mp3", 2048);
  resumeViewingAudio.loop();
  resumeViewingAudio.unmute();

  video.start();
  
}

void draw() {
  
  
if (faceFound == true) {
// add in mute/unmute code here
  resumeViewingAudio.mute();
  advert.play();
      println("I SEE YOU");
} else {
resumeViewingAudio.unmute();
advert.pause();
    println("I CANT SEE YOU");
}




  opencv.loadImage(video);

  //image(video, 0, 0 );
  image(advert, 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  //println(faces.length);
  //println(faceFound);
   faceFound = false; 
  for (int i = 0; i < faces.length; i++) {
    //println(faces[i].x + "," + faces[i].y);

    faceFound = true;
    //enable the line below to see face detection at work
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);

} 

}

void captureEvent(Capture c) {
  c.read();
}

void movieEvent(Movie m) {
  m.read();
}