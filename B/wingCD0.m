clear, clc

% The purpose of this code is to find the CD0 of wings

Q=1;
Swing = input("what is the planform area of the wing(meters^2)");
xc = input("what is the chordwise location of the max thickness(x/c)");
tc = input("what is the thickness ratio (t/c)");
sweep = input("what is the the sweep back angle of the wing(radians)");

% xc=.428   tc=.121  for roncz

[Renolds,mach] = AERO_RE_M;
if Renolds > 1000000
  A = (log10(Renolds))^2.58;
  B = (1+0.144*(mach^2))^.65;
  cf = (.455)/A*B;
else
  cf = 1.328/((Renolds)^.5);
end

fprintf("Skin friction Coeffienct %g \n",cf)

FF = ( 1+ ((.6*tc)/xc) + 100*tc^4)*( (1.34*(mach)^.18)*(cos(sweep)^.28) );

fprintf("The form factor drag is %g \n",(FF))

if tc >= .05
  Swetwing = (1.977+(.52*tc))*Swing;
else
  Swetwing = 2.003*Swing;
end

fprintf("the Wetted area of the wing is %g \n",(Swetwing))

CD0 = cf*FF*Q*(Swetwing/Swing);
fprintf("the CD0 of the wing is %g",CD0)