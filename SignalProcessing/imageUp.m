% we will start with a signal with a signal sith one tone at 1200 Hz. Then
% upsample the signal by a factor of six. When the Nyquist frequency
% increses, you expose the repetitions of the 1200 Hz tone. The repetitons
% are spaced by the sample rate before upsampling (3000 Hz).

fs = 3000;
t = 0:1/fs:0.5;
sig = sin(2*pi*1200*t);
figure(1);
pspectrum(sig,fs);
title('Signal with One Tone at 1200 Hz');
subplot(2,2,1);

% To upsample a signal without an anti-imaging filter, you can use the upsample function
sigbad = upsample(sig,6);
pspectrum(sigbad,fs*6);
title('Bad Upsampled signal');
subplot(2,2,2);         % all tones above 1500 Hz are images

% use anti-imaging filter AFTER upsampling to reduce imaging
sigfilt = lowpass(sigbad, fs/2, fs*6);
pspectrum(sigfilt,fs*6);        % The power of the image at 1.8 kHz decreased by about 2 dB. 
                                % Tones that were located further away decreased by about 100 dB.
title('Lowpass Filtered Upsampled Signal');
subplot(2,2,3);

% resample function to interpolate the signal. Interpolate by a factor of 6
siggood = resample(sig,6,1);    % now q = 1 bc the output will have p/1 samples.
pspectrum(siggood,fs*6);
title('Interpolated signal using resample()')
subplot(2,2,4);

% The images above 1.5 kHz are still there, but the they are even smaller than
% with the anti-imaging filter from the lowpass function.
% After using resample, is are the images small enough? Even though you can still
% see the images in the spectrum, it's difficult to hear them.