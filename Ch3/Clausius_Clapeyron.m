% Find the saturation vapor pressure at temperatures from -60F to 120 F
%           using the Clausius-Clapeyron equation
TempF= [-60:10:120];
TempK = (TempF + 459.6)/1.8;
Delta_H = 2.45e6;               % latent heat of vaporization
R_air = 461;                    % ideal gas constant for air

% calculate the vapor presures
Vapor_Pressure = 6.11*exp((Delta_H/R_air)*(1/273 - 1./TempK));
my_results = [TempF', Vapor_Pressure'];
my_results