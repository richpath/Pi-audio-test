import beads.*;

AudioContext ac;
Gain g;

Glide gainValue;

Sample[] bh = new Sample[6];
Sample[] cm = new Sample[6];
Sample[] lb = new Sample[6];
Sample[] rp = new Sample[6];
Sample[] sb = new Sample[6];
Sample[] sc = new Sample[6];
SampleManager notes;

SamplePlayer sp1,sp2,sp3,sp4,sp5,sp6;
String[] bowlhits = {"bowlhitA.mp3","bowlhitB.mp3","bowlhitCsharp.mp3","bowlhitFsharp.mp3",
"bowlhitG.mp3","bowlhitGsharp.mp3"};
String[] cellomix = {"cellomixB.mp3","cellomixC.mp3","cellomixE.mp3",
"cellomixF.mp3","cellomixG.mp3","cellomixB.mp3"};
String[] lowbowls = {"lowbowl.mp3","lowbowlM2.mp3","lowbowlM4.mp3",
"lowbowlP3.mp3","lowbowlP7.mp3","lowbowl.mp3"};
String[] revpiano = {"reversepianoAflat.mp3","reversepianoB.mp3",
"reversepianoDflat.mp3","reversepianoE.mp3","reversepianoEflat.mp3","reversepianoGflat.mp3"};
String[] singbowl = {"singingbowlA.mp3","singingbowlCsharp.mp3","singingbowlDsharp.mp3","singingbowlE.mp3",
"singingbowlFsharp.mp3","singingbowlGsharp.mp3"};
String[] snorecello = {"snoringcelloB.mp3","snoringcelloCsharp.mp3",
"snoringcelloE.mp3","snoringcelloFsharp.mp3","snoringcelloFsharphigh.mp3","snoringcelloGsharp.mp3"};
String[] groups = {"bowlhits","cellomix","lowbowls","reversepiano","singingbowls","snorecellos"};

void setup()
{
  size(512, 200);
  ac= new AudioContext();
  for (int i=0;i<bowlhits.length;i++) {
    bh[i]=SampleManager.sample(sketchPath("")+"data/"+bowlhits[i]);
  }
  for (int i=0;i<cellomix.length;i++) {
    cm[i]=SampleManager.sample(sketchPath("")+"data/"+cellomix[i]);
  }
  for (int i=0;i<lowbowls.length;i++) {
    lb[i]=SampleManager.sample(sketchPath("")+"data/"+lowbowls[i]);
  }
  for (int i=0;i<revpiano.length;i++) {
    rp[i]=SampleManager.sample(sketchPath("")+"data/"+revpiano[i]);
  }
  for (int i=0;i<singbowl.length;i++) {
    sb[i]=SampleManager.sample(sketchPath("")+"data/"+singbowl[i]);
  }
  for (int i=0;i<snorecello.length;i++) {
    sc[i]=SampleManager.sample(sketchPath("")+"data/"+snorecello[i]);
  }
  notes.group(groups[0],bh);
  notes.group(groups[1],cm);
  notes.group(groups[2],lb);
  notes.group(groups[3],rp);
  notes.group(groups[4],sb);
  notes.group(groups[5],sc);

  sp1 = new SamplePlayer(ac, notes.fromGroup(groups[0],0));
  sp2 = new SamplePlayer(ac, notes.fromGroup(groups[0],1));
  sp3 = new SamplePlayer(ac, notes.fromGroup(groups[0],2));
  sp4 = new SamplePlayer(ac, notes.fromGroup(groups[0],3));
  sp5 = new SamplePlayer(ac, notes.fromGroup(groups[0],4));
  sp6 = new SamplePlayer(ac, notes.fromGroup(groups[0],5));
  sp1.setKillOnEnd(false);
  sp2.setKillOnEnd(false);
  sp3.setKillOnEnd(false);
  sp4.setKillOnEnd(false);
  sp5.setKillOnEnd(false);
  sp6.setKillOnEnd(false);
  sp1.setToEnd();
  sp2.setToEnd();
  sp3.setToEnd();
  sp4.setToEnd();
  sp5.setToEnd();
  sp6.setToEnd();
  
  // set up our master gain
  gainValue = new Glide(ac, 0.5, 100);
  g = new Gain(ac, 1, gainValue);
  g.addInput(sp1);
  g.addInput(sp2);
  g.addInput(sp3);
  g.addInput(sp4);
  g.addInput(sp5);
  g.addInput(sp6);
  
  ac.out.addInput(g);
  ac.start();

}

void draw()
{
  background(0);
  stroke(255);
}

void keyPressed() 
{
  if ( key == '1' ) {
    sp1.reTrigger();
    println("Playing sound 1");
  }
  if ( key == '2' ) {
    sp2.reTrigger();
    println("Playing sound 2");
  }
  if ( key == '3' ) {
    sp3.reTrigger();
    println("Playing sound 3");
  }
  if ( key == '4' ) {
    sp4.reTrigger();
    println("Playing sound 4");
  }
  if ( key == '5' ) {
    sp5.reTrigger();
    println("Playing sound 5");
  }
  if ( key == '6' ) {
    sp6.reTrigger();
    println("Playing sound 6");
  }
  if ( key == ' ' ) {
    int rn=floor(random(groups.length));
    sp1.setSample(notes.fromGroup(groups[rn],0));
    sp1.setToEnd();
    sp2.setSample(notes.fromGroup(groups[rn],1));
    sp2.setToEnd();
    sp3.setSample(notes.fromGroup(groups[rn],2));
    sp3.setToEnd();
    sp4.setSample(notes.fromGroup(groups[rn],3));
    sp4.setToEnd();
    sp5.setSample(notes.fromGroup(groups[rn],4));
    sp5.setToEnd();
    sp6.setSample(notes.fromGroup(groups[rn],5));
    sp6.setToEnd();
    println("Loading sounds from group " + groups[rn]);
  }
}
