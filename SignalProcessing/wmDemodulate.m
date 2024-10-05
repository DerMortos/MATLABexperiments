%%              Signal Processing w/ MATLAB                 %%
%%      Generating Signals and Common Signal Operations     %%
%%                                                          %%
%%                  Part 2/2: Demodulate Audio              %%
%%----------------------------------------------------------%%

[flute,fs] = audioread("MarkedFlute.wav");
fc = 18000;
pspectrum(flute,fs)

[birds, fsb] = audioread("364663__jmiddlesworth__bird-call-in-spring.mp3");
birds = mean(birds,2);
birds = resample(birds,640,441);
birds = birds(1:numel(flute));
birds = bandpass(birds,[1000 6000],fs);

% to prove ownership of the audio file you can get the wm and demodulate it
flutefilt = highpass(flute,fc, fs);

wm = demod(flutefilt,fc,fs);
pspectrum(wm,fs);
title('demodulated signal');

% compare the signals
soundsc(wm,fs);
soundsc(birds,fs)