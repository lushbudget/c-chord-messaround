/*
(
b = Buffer.alloc(s, 44100, 2); // Allocate a 1-second stereo buffer

{
    var modFreq, myOsc, myOscTwo, myOscThree,
        noteOne, noteTwo, noteThree, noteFour, noteFive,
        noteSix, noteSeven, whiteNoise, mix, filteredMix, delayMix,
        kick, snare, hat, drumPattern, finalOutput;

    modFreq = SinOsc.kr(0.2, 0, 5, 10);
    myOsc = SinOsc.kr(0.7, 9.5pi, 0.5, 0.5);
    myOscTwo = SinOsc.kr(0.9, 1.7pi, 0.5, 0.2);
    myOscThree = SinOsc.kr(0.4, 0.4pi, 0.2, 0.9);

    noteOne = SinOsc.ar(130.81 + modFreq, 0, myOsc);
    noteTwo = SinOsc.ar(659.26 + modFreq, 0, myOscTwo);
    noteThree = SinOsc.ar(493.80, 1, myOscThree);
    noteFour = Pan2.ar(SinOsc.ar(65, 0, myOsc), -0.5);
    noteFive = Pan2.ar(VarSaw.ar(82.41, 0, 0.3, 0.5), 0.5);
    noteSix = Pan2.ar(VarSaw.ar(22.81 + modFreq, 0, myOsc), 0.3);
    noteSeven = Pan2.ar(VarSaw.ar(27.77 + modFreq, 1, myOscThree), -0.3);

    whiteNoise = WhiteNoise.ar(0.01);
	//
	// kick = EnvGen.kr(Env.perc(0.01, 0.2), doneAction: 2) * SinOsc.ar(50, 0, 0.8);
	// snare = EnvGen.kr(Env.perc(0.005, 0.1), doneAction: 2)
	// * (WhiteNoise.ar(0.3) * BPF.ar(WhiteNoise.ar(0.3), 1000, 1));
	// hat = EnvGen.kr(Env.perc(0.001, 0.05), doneAction: 2)
	// * HPF.ar(WhiteNoise.ar(0.2), 5000);


/*    drumPattern = Demand.kr(Duty.kr(0.25), 0, Dseq([kick, hat, snare, hat], inf));*/

    mix = (whiteNoise + noteOne + noteTwo + noteThree + noteFour + noteFive + noteSix + noteSeven) * 0.09;
/*    mix = mix + drumPattern;*/

    filteredMix = LPF.ar(mix, SinOsc.kr(0.9, 1, 120, 1200));

    delayMix = DelayN.ar(filteredMix, 0.9, 0.85) * 0.3 + filteredMix;

    RecordBuf.ar(delayMix, b, loop: 1);

    finalOutput = FreeVerb.ar(
        mix,
        mix: 0.8,
        room: SinOsc.kr(0.1, 0, 0.9, 0.5),
        damp: 0.9
    );


    finalOutput;
}.play;
)


ServerOptions.devices;
s.options.device = "Universal Audio Thunderbolt";
s.boot*/

ServerOptions.devices;
s.quit;
s.options.numInputBusChannels = 8; // Match the device's input channels
s.options.numOutputBusChannels = 8; // Match the device's output channels
s.options.device = "Universal Audio Thunderbolt";
s.boot;
{
    Out.ar([5, 6], SinOsc.ar(440, 0, 0.2).dup); // Send stereo sine wave to Virtual 1 and 2
}.play;








// (
// b = Buffer.alloc(s, 44100, 2); // Allocate a 1-second stereo buffer
//
// {
// 	var modFreq, myOsc, myOscTwo, myOscThree,
// 	noteOne, noteTwo, noteThree, noteFour, noteFive,
// 	noteSix, noteSeven, whiteNoise, mix, filteredMix, delayMix,
// 	finalOutput;
//
// 	modFreq = SinOsc.kr(0.2, 0, 5, 10);
// 	myOsc = SinOsc.kr(0.7, 9.5pi, 0.5, 0.5);
// 	myOscTwo = SinOsc.kr(0.9, 1.7pi, 0.5, 0.2);
// 	myOscThree = SinOsc.kr(0.4, 0.4pi, 0.2, 0.9);
//
// 	noteOne = SinOsc.ar(130.81 + modFreq, 0, myOsc);
// 	noteTwo = SinOsc.ar(659.26 + modFreq, 0, myOscTwo);
// 	noteThree = SinOsc.ar(493.80, 1, myOscThree);
// 	noteFour = Pan2.ar(SinOsc.ar(65, 0, myOsc), -0.5);
// 	noteFive = Pan2.ar(VarSaw.ar(82.41, 0, 0.3, 0.5), 0.5);
// 	noteSix = Pan2.ar(VarSaw.ar(22.81 + modFreq, 0, myOsc), 0.3);
// 	noteSeven = Pan2.ar(VarSaw.ar(27.77 + modFreq, 1, myOscThree), -0.3);
//
// 	whiteNoise = WhiteNoise.ar(0.01);
//
// 	mix = (whiteNoise + noteOne + noteTwo + noteThree + noteFour + noteFive + noteSix + noteSeven) * 0.09;
//
// 	filteredMix = LPF.ar(mix, SinOsc.kr(0.9, 1, 120, 1200));
// 	delayMix = DelayN.ar(filteredMix, 0.9, 0.85) * 0.3 + filteredMix;
//
// 	RecordBuf.ar(delayMix, b, loop: 1);
//
// 	finalOutput = FreeVerb.ar(
// 		mix,
// 		mix: 0.8,
// 		room: SinOsc.kr(0.1, 0, 0.9, 0.5),
// 		damp: 0.9
// 	);
//
// 	finalOutput;
// }.play;
// )




