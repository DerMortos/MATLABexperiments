%% import audio files from https://freesound.org/people/MTG/sounds/246666/ and 
% store signal data and sample rate in separate variables
[flute, fs] = audioread("246666__mtg__overall-quality-of-single-note-flute-c5.wav");

% show entire duratrion of signal with strip plot
figure(1);
subplot(3,2,1);
strips(flute,2,fs);
title('raw flute wavform');

%extract a portion of the signal
flute = flute(.9*fs:6*fs);
subplot(3,2,2);
strips(flute,2,fs);
title('trimmed signal');


%Power spectrum @ frequencies
subplot(3,2,3)
pspectrum(flute,fs);
title('Power Spectrum of flute waveform');

%%%%
%%%%
% Generating a tone

%create a time vector of flute recording
n = numel(flute);   % number of elements
t = (0:n-1)';       % transpose column vector

% converting from sample index to time value in seconds
t = t/fs;

% bc power above ~5kHz is around -90 dB, the frequency content is not
% audible. any location above 5kHz would work for the watermark.
f = 6000;
wm = sin(2*pi*f*t)*.0001;
subplot(3,2,4);
pspectrum(wm,fs);
title('6kHz signal for watermark');

marked = wm + flute;
subplot(3,2,5);
pspectrum(marked,fs);
title('spectrogram of watermaked flute waveform')
soundsc(marked,fs);

% generate chirp insetead of a spike
wm2 = chirp(t,6000,t(end),7000)*.001;
figure(2);
subplot(2,2,1);
pspectrum(wm,fs);
title('Generated 6-7 kHz Chirp');

%Plot the spectrogram of the chirp signal
subplot(2,2,2);
pspectrum(wm2,fs,"spectrogram");
title('spectrograph of chirp');

% combined chirp and flute signals
marked2 = wm2 + flute;
subplot(2,2,3);
pspectrum(marked2,fs);
title('spectrograph of watermarkd chirped flute wavform');
soundsc(marked2,fs);
