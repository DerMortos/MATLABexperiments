%% import audio files from https://freesound.org/people/MBARI_MARS/sounds/498708/ and 
% store signal data and sample rate in separate variables
[whale, fs] = audioread("498708__mbari_mars__mars_20161221h00_hs2p1.wav");

figure;
plot(whale);
title("Time Domain of signal")
hold on;

% view the frequency content of the signal
% calculate the power spectrum 
figure;
pspectrum(whale,fs);


% create spectrogram of signal
figure;
pspectrum(whale,fs,"spectrogram");

% lowpass filter
figure;
lowpass(whale,0.3,fs);

% save results to var for processing
whalefilt = lowpass(whale,0.3,fs);

% listen to the original signal (will play entire file!)
soundsc(whale,fs);
soundsc(whalefilt,fs);

% end