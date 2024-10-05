load psdsig.mat
whos % lists in alphabetical order the names, sizes, and types of all variables in the currently active workspace

% Estimate the frequencies in sig
Y = fft(sig)

% lenght of sig
n = numel(sig)

% vector that contains the frequency of each element in Y
f = (0:n-1)*(fs/n)

% visualize the magnitude of each frequency
p = abs(Y).^2;  % Power of each frequency component
figure;
plot(f, p);
xlabel('Frequency (Hz)');
ylabel('Power');
title('Power Spectrum');
grid on;

% plot the spectrum in decibels (dB)
p_db = 10*log10(p);
figure;
plot(f, p_db);
xlabel('Frequency (Hz)');
ylabel('Power (dB)');
title('Power Spectrum in dB');
grid on;