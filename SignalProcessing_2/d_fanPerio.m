load psdsig
sig = 1e - 3*sin(2*pi*fr*t);
n = length(sig)

% windowing function to reduce effects from truncating signal
w = ones(n,1);

% input for periodogram is the number of DFT points
nfft = length(sig)

% plot periodogram
periodogram(sig, w, nfft, fs);

% plot periodogram using default inputs
periodogram(sig, [],[],fs);

% If you want the power spectral density (PSD) estimate as a vector, 
% request outputs from periodogram.
[p,f] = periodogram(sig,w,nfft,fs);
plot(f,p)