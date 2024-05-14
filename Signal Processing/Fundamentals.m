% Generating signals
startTime = 0;
endTime = 1;
fs = 100; % sample time in hz

t = startTime:1/fs:endTime;

% generating sine wave
% s = sin(2*pi*f*t)
sig = sin(2*pi*5*t);
figure;
plot(t, sig, '-x');
title('Sine Wave');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;
hold on

% create random noise vector
noise = 0.1*randn(size(sig));

% add rand noise vector to signal vector
sigNoisy = noise + t;

% generate square wave
sq = square(2*pi*5*t);
figure;
plot(t, sq, '-o');
title('square wave')

noise2 = 0.1*randn(size(sq));
sqNoisy = noise2  + sq;
plot(t, sqNoisy, '-x');
title('Noisy square wave');