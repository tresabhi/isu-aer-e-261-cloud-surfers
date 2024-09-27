function[Renolds,mach] = AERO_RE_M
%{
  the purpose of this code is to find the renolds number and the mach number
  at a givne altitude and velocity
%}

mew0=1.716*(10^-5);
smew=113;
t0=273.25;
altitude = input("what altitude are you flying at?(meters)");
velo = input("what velocity are you flying at?(meter/second)");
[temp,pressure,density] = standardatm(altitude);
Croot  = input("what is chord at the root of the wing?(meters)");
Ctip =  input("what is chord at the tip of the wing?(meters)");
chord = (Croot+Ctip)/2;
mew=(mew0)*((temp)/(t0))^1.5*((t0+smew)/(temp+smew));
Renolds = (density*velo*chord)/(mew);
sos=(1.4*287*temp)^.5;
mach= velo/sos;

fprintf("the temp is %g k \n",temp)
fprintf("the pressure is %g pa \n",pressure)
fprintf("the density is %g kg/m^3 \n",density)
fprintf("the average chord is %g m \n",chord)
fprintf("the μ is %g \n",mew)
fprintf("the Re is %g \n",Renolds)
fprintf("the speed of sound is %g m/s \n",sos)
fprintf("the mach is %g \n",mach)

end
