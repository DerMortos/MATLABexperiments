%%              Signal Processing w/ MATLAB                 %%
%%      Generating Signals and Common Signal Operations     %%
%%                                                          %%
%%                  Part 1/2: Modulate Audio                %%
%%----------------------------------------------------------%%

%% import audio files from https://freesound.org/people/MTG/sounds/246666/ and 
% store signal data and sample rate in separate variables
[flute, fs] = audioread("246666__mtg__overall-quality-of-single-note-flute-c5.wav");
[birds, fsb] = audioread("364663__jmiddlesworth__bird-call-in-spring.mp3");

% show entire duratrion of signal with strip plot
figure(1);
flute = flute(.9*fs:6*fs);
fluteup = resample(flute,4,1);
fsup = fs*4;
n = numel(fluteup);
subplot(2,2,1);
pspectrum(fluteup,fsup)
title('Flute Upsampled Signal');



birds = mean(birds,2);
birdsdown = resample(birds,640,441);
birdsdown = birdsdown(1:n);
subplot(2,2,2);
pspectrum(birdsdown,fsup)
title('Birds Downsampled Signal');

% Modulation varies the amplitude, phase, or frequency oif a message signal
% with a carrier signal.

% resample 1000 < birds < 6000
bfilt = bandpass(birdsdown, [1000 6000], fsup);

% specify the carrier frequency f_c to use while modulating . The frequency
% content will be shifted by f_c. Cecause the flute signal has content up
% to 25 kHz the watermark frequency goes up to 6 kHz . wM should be shifted
% by at least 30kHz
fc = 30000;
wm = modulate(bfilt,fc,fsup);
subplot(2,2,3)
pspectrum(wm,fsup);
title('Modulated Birds Signal');
% the watermark's positive and negative frequencies have been shifted to 
% the right. That is why the watermark appears mirrored about 30 kHz.

marked = wm + fluteup;
subplot(2,2,4);
pspectrum(marked,fsup);
title('power spectrum of watermarked signal');
soundsc(marked,fsup)

% to export watermarked audio
audiowrite("MarkedFlute.wav",marked,fsup);
