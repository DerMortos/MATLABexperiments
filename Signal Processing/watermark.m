%% import audio files from https://freesound.org/people/MTG/sounds/246666/ and 
% store signal data and sample rate in separate variables
[flute, fs] = audioread("246666__mtg__overall-quality-of-single-note-flute-c5.wav");

% show entire duratrion of signal with strip plot
strips(flute,2,fs);

%extract a portion of the signal
flute = flute(.9*fs:6*fs);
figure;
strips(flute,2,fs);


%Power spectrum @ frequencies
pspectrum(flute,fs);


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
figure;
pspectrum(wm,fs);

marked = wm + flute;
figure;
pspectrum(marked,fs);
soundsc(marked,fs);