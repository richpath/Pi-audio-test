import ddf.minim.*;

Minim minim;
AudioSample s1,s2,s3,s4,s5,s6;
String[] notesounds = {"bowlhitA.mp3","bowlhitB.mp3","bowlhitCsharp.mp3","bowlhitFsharp.mp3","bowlhitG.mp3","bowlhitGsharp.mp3","cellomixB.mp3","cellomixC.mp3","cellomixE.mp3","cellomixF.mp3","cellomixG.mp3","lowbowl.mp3","lowbowlM2.mp3","lowbowlM4.mp3","lowbowlP3.mp3","lowbowlP7.mp3","reversepianoAflat.mp3","reversepianoB.mp3","reversepianoDflat.mp3","reversepianoE.mp3","reversepianoEflat.mp3","reversepianoGflat.mp3","singingbowlA.mp3","singingbowlCsharp.mp3","singingbowlDsharp.mp3","singingbowlE.mp3","singingbowlFsharp.mp3","singingbowlGsharp.mp3","snoringcelloB.mp3","snoringcelloCsharp.mp3","snoringcelloE.mp3","snoringcelloFsharp.mp3","snoringcelloFsharphigh.mp3","snoringcelloGsharp.mp3"};

void setup()
{
  size(512, 200, P3D);
  minim = new Minim(this);

    s1 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    s2 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    s3 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    s4 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    s5 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    s6 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
}

void draw()
{
  background(0);
  stroke(255);
}

void keyPressed() 
{
  if ( key == '1' ) {
    s1.trigger();
    println("Playing sound 1");
  }
  if ( key == '2' ) {
    s2.trigger();
    println("Playing sound 2");
  }
  if ( key == '3' ) {
    s3.trigger();
    println("Playing sound 3");
  }
  if ( key == '4' ) {
    s4.trigger();
    println("Playing sound 4");
  }
  if ( key == '5' ) {
    s5.trigger();
    println("Playing sound 5");
  }
  if ( key == '6' ) {
    s6.trigger();
    println("Playing sound 6");
  }
  if ( key == ' ' ) {
    s1 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    s2 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    s3 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    s4 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    s5 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    s6 = minim.loadSample(notesounds[floor(random(notesounds.length))]);
    println("Loading new random sounds for each key");
  }
}
