% Find the distance traveld by a freely falling object on planets with
% different gravities

% test with 2 planets 
format bank;
accererationDueToGravity = [3.7, 8.87];
time = 0:10:100;

% Mapping accelerationDueToGravity and time into 2D matricies
[g,t] = meshgrid(accererationDueToGravity, time);

distance = 1/2 * g.*t.^2;


% complete planetary data
accel_G = [3.7, 8.87, 9.8, 1.6, 3.7, 23.12 8.96, 8.69, 11.0, 0.58];
[g,t] = meshgrid(accel_G, time);

d = 1/2 * g.*t.^2
