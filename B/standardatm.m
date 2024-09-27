function[temp,pressure,density] = standardatm(altitude)

temp1 = 288.16; %kelvin sea level
density1 = 1.225; %kg/m^3 sea level
pressure1 = 1.01325*(10^5); %n/m^2 sea level
grav1 = 9.81; %m/s^2 sea level
R = 287; %J/(kg*K)
tropo_lapse = -6.5*(10^-3); %k/m
strato_lapse = 2.97*(10^-3); %k/m


if altitude < 11000
  
  temp = temp1 + tropo_lapse*(altitude);%find the temp
  pressure = pressure1*(temp/temp1)^(-grav1/(tropo_lapse*R));%finds the pressure
  density = density1*(temp/temp1)^((-grav1/(tropo_lapse*R)-1));%finds the density
elseif altitude < 25000
  % the initial values at the bottom of the isothermal layer
  temp = 216.66;
  pressure2 = 22700;
  density2 = .3648;
  pressure = pressure2*exp((-grav1/(R*temp))*(altitude - 11000));%finds the pressure
  density = density2*exp((-grav1/(R*temp))*(altitude - 11000));%finds the density
else
  % the initial values at the bottom of the stratosphere gradient layer
  temp3 = 216.365;
  pressure3 = 2449.5;
  density3 = .039333;
  
  temp = temp3 + strato_lapse*(altitude-25200);%finds the temp
  pressure = pressure3*(temp/temp3)^(-grav1/(strato_lapse*R));%finds the pressure
  density = density3*(temp/temp3)^((-grav1/(strato_lapse*R)-1));%finds the density
end
end
