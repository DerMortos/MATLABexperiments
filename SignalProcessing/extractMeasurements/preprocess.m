function y = preprocess(x,tx)
%  Preprocess input x
%    This function expects an input vector x and a vector of time values
%    tx. tx is a numeric vector in units of seconds.

% Generated by MATLAB(R) 9.14 and Signal Processing Toolbox 9.2.
% Generated on: 23-Mar-2023 08:04:55

Fs = 1/mean(diff(tx)); % Average sample rate
y = bandpass(x,[2 10],Fs,'Steepness',0.85,'StopbandAttenuation',60);