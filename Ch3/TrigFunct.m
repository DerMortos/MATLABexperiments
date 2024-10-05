Force = [100, 200, 50];
theta = [-90, 90, 30];
thetaRad = theta*pi/180;

ForceX_tot = sum(Force.*cos(thetaRad));
ForceY_tot = sum(Force.*sin(thetaRad));

resultAngle = atan(ForceY_tot/ForceX_tot);
resultDegrees = resultAngle*(180/pi)
ForceTotal = ForceX_tot/cos(resultAngle)