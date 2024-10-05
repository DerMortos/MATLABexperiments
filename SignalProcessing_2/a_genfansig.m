fs = 2400;
n = 2400;
t = (0:n-1)/fs;
t = t';

fr = 4000/60;

% signal with fundamental frequency and 2 harmanics
sig = 1e-3*(sin(2*pi*fr*t) + 0.5*sin(2*pi*3*fr*t) + 2*sin(2*pi*4*fr*t));
plot(t,sig);