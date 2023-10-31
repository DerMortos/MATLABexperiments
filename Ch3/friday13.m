c = zeros(1,7);
for y = 1601:2023
    for m = 1:12
        d = datenum([y,m,13]);
        w = weekday(d);
        c(w) = c(w)+1;
    end
end
c
bar(c)
axis([0 8 720 730])
avg = 5076/7
line([0 8], [avg avg], 'linewidth', 4, 'color', 'black')
set(gca, 'xticklabel', {'Su', 'M', 'T', 'W', 'Th', 'Fri', 'Sat'})