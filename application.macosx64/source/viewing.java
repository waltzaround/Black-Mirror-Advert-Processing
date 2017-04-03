import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import gab.opencv.*; 
import processing.video.*; 
import java.awt.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class viewing extends PApplet {







boolean faceFound;

//video stuff
Capture video;
OpenCV opencv;

//sound stuff
Minim minim;
AudioPlayer resumeViewingAudio;
Movie advert;


public void setup() {
  
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

public void draw() {
  
  
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

public void captureEvent(Capture c) {
  c.read();
}

public void movieEvent(Movie m) {
  m.read();
}
  public void settings() {  size(1920, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "viewing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
