% Instead of generating a watermark we will use another audio filea sthe
% watermark.

%% import audio files from https://freesound.org/people/MTG/sounds/246666/ and 
% https://freesound.org/people/jmiddlesworth/sounds/364663/
% store signal data and sample rate in separate variables
[flute, fs] = audioread("246666__mtg__overall-quality-of-single-note-flute-c5.wav");

% show flute signal with strip plot
figure(1);
flute = flute(.9*fs:6*fs);
strips(flute,2,fs);
title('Flute Signal');
subplot(3,2,1);

% There are two lines on the spectrum. 
% Some audio files have two channels, for the left and right stereo.
[birds, fsb] = audioread("364663__jmiddlesworth__bird-call-in-spring.mp3");
pspectrum(birds,fsb);
title('Birds Power Spectrum');
subplot(3,2,2);

% modify as a column vector containingthe mean of each row
birds = mean(birds,2);

% resample birds with a matching sample rate. use rat() to find rational
% fraction beween the desired sample rates: rat(fs_desired / fs_current)
[p,q] = rat(fsup/fsb);

% resample birds using p and q
birdsdown = resample(birds,p,q);
pspectrum(birdsdown,fsup)
title('Resampled birds signal using ratio of both sample rates');
subplot(3,2,3);

soundsc(birdsdown,fsup)