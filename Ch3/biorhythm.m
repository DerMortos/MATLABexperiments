t0 = datenum('Aug. 17, 1939')
t1 = fix(now);
t = (t1 - 28):1:(t1+28);
y = 100*[sin(2*pi*(t-t0)/23)
        sin(2*pi*(t-t0)/28)
        sin(2*pi*(t-t0)/33)];
plot(t,y)