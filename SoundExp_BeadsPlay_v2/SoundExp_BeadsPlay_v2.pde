 import beads.*;

AudioContext ac;
Gain bkdgain, notegain;

Glide bkdGainValue, noteGainValue, pitchValue, panValue;

Panner p;

Sample[] bksound = new Sample[6];
Sample[] ntsound = new Sample[13];

SampleManager notes;

SamplePlayer bksp, ntsp;

String[] samples = {"BellHitOvertones.mp3","BowlHitDamp.mp3","CelloChord.mp3",
"ChordWash.mp3","ChordWash.mp3","ClearBowlHit.mp3","DeepBell.mp3","Ding.mp3",
"LowBowlHit.mp3","MeditationBell.mp3","RevPianoE.mp3","SharpBellHit.mp3","SingingBowlShort.mp3"};
String[] bksnds = {"blackbird.mp3","foreststream.mp3","heartbeat.mp3","nightforest.mp3","seawash.mp3","thunderstorm.mp3"};

String[] groups = {"nts","bkg"};

void setup()
{
  size(512, 200);
  ac= new AudioContext();
  for (int i=0;i<samples.length;i++) {
    ntsound[i]=SampleManager.sample(sketchPath("")+"data/"+samples[i]);
  }
  for (int i=0;i<bksnds.length;i++) {
    bksound[i]=SampleManager.sample(sketchPath("")+"data/"+bksnds[i]);
  }
  notes.group(groups[0],bksound);
  notes.group(groups[1],ntsound);

  bksp = new SamplePlayer(ac, notes.fromGroup(groups[0],0));
  ntsp = new SamplePlayer(ac, notes.fromGroup(groups[1],0));
  bksp.setKillOnEnd(false);
  ntsp.setKillOnEnd(false);
  bksp.setToEnd();
  ntsp.setToEnd();
  
  // set up our master gain
  bkdGainValue = new Glide(ac, 1, 100);
  noteGainValue = new Glide(ac, 1, 100);
  bkdgain = new Gain(ac, 1, bkdGainValue);
  notegain = new Gain(ac, 1, noteGainValue);
  bkdgain.addInput(bksp);
  notegain.addInput(ntsp);
  pitchValue = new Glide(ac,1,20);
  panValue = new Glide(ac,1,20);
  ntsp.setPitch(pitchValue);
  
  p = new Panner(ac, 0);
  p.addInput(notegain);
  
  ac.out.addInput(bkdgain);
  ac.out.addInput(p);
  ac.start();
  bksp.reTrigger();

}

void draw()
{
  background(0);
  stroke(255);
  pitchValue.setValue(map(mouseX,0,width,0.5,3));
  panValue.setValue(map(mouseX,0,width,-1,1));
  p.setPos(panValue);
}

void keyPressed() 
{
  if ( key == '1' ) {
    ntsp.setSample(notes.fromGroup(groups[1],0));
    ntsp.setToEnd();
  }
  if ( key == '2' ) {
    ntsp.setSample(notes.fromGroup(groups[1],1));
    ntsp.setToEnd();
  }
  if ( key == '3' ) {
    ntsp.setSample(notes.fromGroup(groups[1],2));
    ntsp.setToEnd();
  }
  if ( key == '4' ) {
    ntsp.setSample(notes.fromGroup(groups[1],3));
    ntsp.setToEnd();
  }
  if ( key == '5' ) {
    ntsp.setSample(notes.fromGroup(groups[1],4));
    ntsp.setToEnd();
  }
  if ( key == '6' ) {
    ntsp.setSample(notes.fromGroup(groups[1],5));
    ntsp.setToEnd();
  }
  if ( key == '7' ) {
    ntsp.setSample(notes.fromGroup(groups[1],6));
    ntsp.setToEnd();
  }
  if ( key == '8' ) {
    ntsp.setSample(notes.fromGroup(groups[1],7));
    ntsp.setToEnd();
  }
  if ( key == '9' ) {
    ntsp.setSample(notes.fromGroup(groups[1],8));
    ntsp.setToEnd();
  }
  if ( key == '0' ) {
    ntsp.setSample(notes.fromGroup(groups[1],9));
    ntsp.setToEnd();
  }
  if ( key == '-' ) {
    ntsp.setSample(notes.fromGroup(groups[1],10));
    ntsp.setToEnd();
  }
  if ( key == '=' ) {
    ntsp.setSample(notes.fromGroup(groups[1],11));
    ntsp.setToEnd();
  }
  if ( key == ' ' ) {
    ntsp.reTrigger();
  }
  if ( key == '`' ) {
    int rn=floor(random(bksnds.length));
    bksp.setSample(notes.fromGroup(groups[0],rn));
    bksp.setToEnd();
    bksp.reTrigger();
  }
}
