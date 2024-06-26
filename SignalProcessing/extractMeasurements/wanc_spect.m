% Compute spectrogram

% Generated by MATLAB(R) 9.14 and Signal Processing Toolbox 9.2.
% Generated on: 23-Mar-2023 08:03:05

% Parameters
timeLimits = [0 902.12]; % seconds
frequencyLimits = [0 25]; % Hz
overlapPercent = 50;

%%
% Index into signal time region of interest
wanc_bandpass_ROI = wanc_bandpass(:);
sampleRate = 50; % Hz
startTime = 0; % seconds
timeValues = startTime + (0:length(wanc_bandpass_ROI)-1).'/sampleRate;
minIdx = timeValues >= timeLimits(1);
maxIdx = timeValues <= timeLimits(2);
wanc_bandpass_ROI = wanc_bandpass_ROI(minIdx&maxIdx);
timeValues = timeValues(minIdx&maxIdx);

% Compute spectral estimate
% Run the function call below without output arguments to plot the results
[P,F,T] = pspectrum(wanc_bandpass_ROI,timeValues, ...
    'spectrogram', ...
    'FrequencyLimits',frequencyLimits, ...
    'OverlapPercent',overlapPercent);
