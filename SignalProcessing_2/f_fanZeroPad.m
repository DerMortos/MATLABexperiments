load psdsig.mat
sig = 1e-3*sin(2*pi*fr*t);
n = length(sig)

DFTPoints = 14; % set so that error is less than 0.2

nfft = 2^(DFTPoints)
[p,f] = periodogram(sig,ones(n,1),nfft,fs);

% plot the spectrum and calculate the error
pwr = 10*log10(p);
figure;
plot(f,pwr,".")
[peak,loc] = findpeaks(pwr,f,"NPeaks",1,"SortStr","descend")
e = abs(fr - loc)