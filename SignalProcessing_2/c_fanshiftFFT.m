load psdsig
Y = fft(sig);
f = (0:n-1)*(fs/n);
n = length(sig);
p = abs(Y).^2;
plot(f,10*log10(p))
xlabel("Frequency (Hz)")
ylabel("Power (dB)")

% Center the power spectrum stored in the variable p
pshift = fftshift(p);

% Shift f to match the frequencies in pshift
fshift = f-fs/2;
plot(fshift, 10*log10(pshift))

% For real-valued signals, the power spectrum is symmetric around zero, 
% you only need to plot the one-sided spectrum.
fhalf = f(1:n/2);
phalf = p(1:n/2);
plot(fhalf, 10*log10(phalf))