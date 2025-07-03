function [He] = fcnBASELINEPLOTTING(OUTP)
loc = OUTP.vecCGLOC;
He = OUTP.vecVEHVINF.^2/(2*9.81) + loc(:,3);
end