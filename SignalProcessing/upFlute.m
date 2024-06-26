% continuation of the chirp watermak flute audio lesson.
% This was effective, but you still need to be careful not to corrupt any
% frequencies in your audio. If you wanted to add the watermark to another signal,
% you'd have to check the spectrum each time and find unused frequencies.
% Instead, if you increased the sample rate of the audio first, there would be
% an unused high-frequency range.

%% import audio files from https://freesound.org/people/MTG/sounds/246666/ and 
% store signal data and sample rate in separate variables
[flute, fs] = audioread("246666__mtg__overall-quality-of-single-note-flute-c5.wav");

% show entire duratrion of signal with strip plot
figure(1);
flute = flute(.9*fs:6*fs);
strips(flute,2,fs);
title('Flute Signal');
subplot(3,2,1);

n = numel(flute);
t = (0:n-1)';
t = t/fs;
pspectrum(flute,fs)
title('Power Spectrum of Flute Signal');
subplot(3,2,2);

% what happens if you dont use anti-imaging filter after sampling?
% upsample the flute signal so there are twice as many samples.
fluteup = upsample(flute,2);

% new sample rate
fsup = fs*2;
pspectrum(fluteup,fsup);
title('Flute Signal w/ Twice as Many Samples');
subplot(3,2,3);

% signal imaging along the old nyquist frequency
% resample funcion includes lowpass filter

% The frequency content after the old Nyquist Frequency isn't 0, but it's much 
% smaller with resample than with upsample
fluteup = resample(flute,2,1);  % p and q are integer resample factors. The output signal y has p/q samples from x.
pspectrum(fluteup,fsup);


tup = (0:1/fsup:(numel(fluteup)-1)*1/fsup)';    % new time vector using new sample rate.
wm = chirp(tup,26000,tup(end),28000);           % chirp signal created in frequency range w/ very little content

marked = fluteup + 0.0001*wm;
pspectrum(marked,tup);
title('Upsampled Signal Using resample()');
subplot(3,2,4);

