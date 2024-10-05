% Frequency Resolution versus Spectral Leakage
% There is a tradeoff between mainlobe width and sidelobe heigh when you
% choose a window. In general, you want a narrow mainlobe and a short
% sidelobe.
% Similarly in the power spectrum, there is a tradeoff between freqeuncy
% resolution and spectral leakage. When you have a narrow mainlobe, you get
% good frequency resolution. When you have short sidlobes, you get small
% spectral leakage.

load psdsig
sig = 1e-3*sin(2*pi*fr*t);
n = length(sig);
w = ones(n,1);

plot(t,w)

% Task 2:
w = hamming(n);
%In the time-domain plot, notice that the Hamming window attenuates the 
% beginning and end of your signal. In the frequency-domain plot, compared 
% to the rectangular window, there is better spectral leakage.

% When you made the Hamming window, you only needed to set the window length. 
% The Kaiser window also includes a shape factor called beta.
w = kaiser(n,1);

%Larger beta values provide lower spectral leakage, at the expense of the 
% frequency resolution. In the frequency-domain plot, pay attention to the 
% height of the sidelobes before completing the next task.
w = kaiser(n,6);

w = kaiser(n,20);



% Task 1: display the periodogram of sig using the window w.
periodogram(sig,w,2^12,fs)

%The rectangular window has the best frequency resolution among all windows. 
% This comes at the expense of spectral leakage.
