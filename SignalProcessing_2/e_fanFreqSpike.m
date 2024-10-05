load psdsig
sig = 1e-3*sin(2*pi*fr*t);
n = length(sig);
[p,f] = periodogram(sig,ones(n,1),n*1,fs);
pwr = 10*log10(p);
plot(f,pwr,"o")

% By default, findpeaks returns the peaks in the order in which they occur.
% To return the most prominent peak, you can set the peak sorting to "descend".
[peak, loc] = findpeaks(pwr,f, "NPeaks",n, "SortStr","descend")

%The correct frequency in the signal is the fan's rotating frequency of 
% 4000 rotations per minute (rpm). To convert from rpm to Hz, or cycles per 
% second, divide by 60. This is stored in the variable fr.

% In the periodogram, the peak should be located at fr. You can use the peak 
% found by findpeaks to check if the peak was found precisely.

% There are many ways to calculate error. For this task, you can use abs(a-b).

% calculate the error between fr and loc
e = abs(fr-loc);