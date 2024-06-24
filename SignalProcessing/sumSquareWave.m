%%              Signal Processing w/ MATLAB                 %%
%%      Generating Signals and Common Signal Operations     %%
%%                                                          %%
%%                  Project 1/2: Square Wave                %%
%%----------------------------------------------------------%%

fs = 100;
t = (0:1/fs:3)';            % time vector column

A = 1;                      % first harmonic 
y1 = (1/A)*sin(2*pi*A*t);

A = 3;                      % thrid harmonic
y3 = (1/A)*sin(2*pi*A*t);

plot(t,y1+y3)
title('Sum of y1+y3');

A = 5;                      % fifth harmonic
y5 = (1/A)*sin(2*pi*A*t);
plot(t,y1+y3+y5)
title('Sum of y1+y3+y5');

pspectrum(y1+y3+y5,fs);     % spectrum of y1+y3+y5


% sumOddHarmonics(10);        % builtin function
% edit sumOddHarmonics        % to edit builtin function

% % Generating Signals
% t = (0:1/fs:T)' 	        % Create a time vector of a specified duration T
% t = (0:n-1)'/fs 	        % Create a time vector with a specified number of samples
% s = A * sin(2*pi*f*t + phi) % Generate a sine wave at a given frequency f, amplitude A, and phase phi
% y = chirp(t,f0,t1,f1) 	    % Generate a chirp signal from f0 Hz to f1 Hz
% 
% % Common Signal Operations
% y = resample(x,p,q)         % The sample rate of y is p/q times the sample rate of x
% y = modulate(x,fc,fs)       % Shift the frequency content in x by the carrier frequency fc
% y = demod(x,fc,fs)          % Demodulate x using the carrier frequency fc
