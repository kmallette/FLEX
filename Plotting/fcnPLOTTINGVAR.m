function [He, TipDef, TipTwist, GustMag] = fcnPLOTTINGVAR(OUTP,VEHI)

pitch = atand(OUTP.matGLOBUVW(:,3)./OUTP.matGLOBUVW(:,1)); %Pitch angle
density = OUTP.valDENSITY; %Air density
GustMag = OUTP.matGUSTVEL(27,:)/norm(VEHI.matVEHUVW)*100; %Percent Vertical magnitude of gust with respect to cruise speed

loc = OUTP.vecCGLOC; %Aircraft CG location with respect to origin

D = OUTP.vecCDI .* 0.5 .* density .* (OUTP.vecVEHVINF).^2*0.4*5.45; %Drag calculation, unused currently
L = OUTP.vecCLI .* 0.5 .* density .* (OUTP.vecVEHVINF).^2*0.4*5.45; %Lift calculation, unused currently
D_net = trapz(OUTP.sim_time,D)-median(OUTP.vecCD); %newtons second of drag cost total across simulation, unused currently

He = OUTP.vecVEHVINF.^2/(2*9.81) + loc(:,3); %Energy altitude

TipDef = OUTP.matDEFGLOB(:,11)*1000; %Multiple of 10e3 converts m to mm
TipTwist = rad2deg(OUTP.matTWISTGLOB(:,width(OUTP.matTWISTGLOB))); %Wing tip twist in degrees with respect to root

end