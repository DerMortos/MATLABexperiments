load handel;
%sound(y,Fs)
noise = randn(length(y),1)*0.10;
sound(y+noise,Fs)

% plot the first 200 data points in each file
t = 1:length(y);
noisy = y + noise;
plot(t(1,1:200), y(1:200,1), t(1,1:200), noisy(1:200,1), ':')
    title('Handel"s Messiah'); ...
    xlabel('Element Number in Music Array');
ylabel('Frequency');
