% The distance to the horizon is quite different on the moon than on the
% earth. Find the distance to the horizon on the earth and on the moon, for
% mountains from 0 - 8000m

height = 0:1000:8000;   % height vector
height = height/1000;   % m -> km
radius = [1737, 6378];  % radius of moon, eearth

% Mapping the radii and heights onto a 2d grid
[Radius, Height] = meshgrid(radius, height);

distance = sqrt(Height.^2 + 2*Height.*Radius)