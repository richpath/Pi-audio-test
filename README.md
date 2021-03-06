# Pi-audio-test
A collection of Processing sketches created to test audio file playback and functionality on a Raspberry Pi use various sound libraries.

The "MinimSample" sketch uses the AudioSample feature of the Minim Library: http://code.compartmental.net/minim/ Six random sounds are loaded into memory and can each be triggered by pressing keys 1-6 on a keyboard. Pressing the spacebar reloads a new set of random sounds. There are no accompanying visuals, but interaction is acknowledged in output text. Using AudioSample, each sound can each be triggered multiple times simultaneously, verses AudioPlayer which streams the file from disk and does not (easily) allow for multiple triggering.

The "SoundPlay" sketch uses the standard Processing Sound library: https://github.com/processing/processing-sound (as of 5/15/18, this library is no longer in active development). Control works the same way - six random sounds are loaded and triggered with keys 1-6; the spacebar loads a new random set of samples. Each sample can be triggered multiple times with simultaneous playback.

The "BeadsPlay" sketch uses the Beads Audio Library: http://www.beadsproject.net/  Same control, using keys 1-6 for triggering and spacebar for creating another random set. However, each number key will now play one note of the same sample family, and the spacebar randomizes the sample family for all of the note keys. Multiple/simultaneous triggering of the same note is not possible in this sketch.

The "BeadsPlay_v2" sketch expands on the functionality of the Beads Library. An ambient nature background sample is played automatically - pressing the ` key (to the left of "1") will change this sound. Use keys 1 through 0, and also - and =, to select the foreground audio sample. Then use the spacebar to trigger the note playback. The pitch of the note is based on the X position of the cursor over the sketch window. The pitch can be manipulated in real time, eliminating the need for multiple versions of note samples with different pitches.

For more details about results of running these sketches on a Raspberry Pi, see ...
