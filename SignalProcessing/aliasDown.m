% generate a signal with two tones one at 300 Hz  and 3000 Hz.
% explore how downsampling affects aliasing

fs = 24000;
t = 0:1/fs:0.5;
sig = sin(2*pi*300*t)+sin(2*pi*3000*t);
figure(1);
subplot(2,2,1);
pspectrum(sig,fs);
title('Two Tone Signal');
xline(2,"r--","New Nyquist Frequency");

% downsampling signal w/ aliasing
sigbad = downsample(sig,6);

subplot(2,2,2);
pspectrum(sigbad,fs/6);     % 3kHz  tone is aliased to 1kHz
title('Bad Downsampled Signal');

% use anialiasing filter before downsampling. 
fsNew = 4000;               % fsNew/2 is Nyquist frequency after downsampling
sigfilt= lowpass(sig,fsNew/2,fs);
sigfilt = downsample(sigfilt,6);
subplot(2,2,3);
pspectrum(sigfilt,fs/6)     % power of aliased tone decreased by 10dB (filter)
title('Lowpass Filterd Downsampled Signal');

% resampling to decimate the signal by a factor of 6
sigGood = resample(sig,1,6);    % decimated: p=1 bc output will have 1/q samples
subplot(2,2,4);
pspectrum(sigGood,fs/6);
title('Decimated Signal');

% The incorrect tone at 1 kHz is still there, but it's even smaller than with the
% antialiasing filter from the lowpass function.
% After using resample, is the aliased tone small enough? This depends on your application.
% Even though you can still see the aliased tone in the spectrum, if this was
% an audio file, the important thing is whether or not you can hear the aliased
% tone. It's difficult to hear a tone that's about at about -70 dB.