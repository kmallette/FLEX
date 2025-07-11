function [WAKE, OUTP, INPU, SURF] = fcnINITIALIZE(COND, INPU, SURF)

% Preallocating for a turbo-boost in performance
OUTP.vecCL = nan(COND.valMAXTIME,INPU.valVEHICLES);
OUTP.vecCLF = nan(COND.valMAXTIME,INPU.valVEHICLES);
OUTP.vecCLI = nan(COND.valMAXTIME,INPU.valVEHICLES);
OUTP.vecCDI = nan(COND.valMAXTIME,INPU.valVEHICLES);
OUTP.vecE = nan(COND.valMAXTIME,INPU.valVEHICLES);
OUTP.vecCT = nan(COND.valMAXTIME,max(INPU.vecPANELROTOR));
OUTP.vecCPI = nan(COND.valMAXTIME,max(INPU.vecPANELROTOR));
OUTP.vecCP = nan(COND.valMAXTIME,max(INPU.vecPANELROTOR));
OUTP.vecCFy = nan(COND.valMAXTIME,max(INPU.vecPANELROTOR));
OUTP.vecCFx = nan(COND.valMAXTIME,max(INPU.vecPANELROTOR));
OUTP.vecCMy = nan(COND.valMAXTIME,max(INPU.vecPANELROTOR));
OUTP.vecCMx = nan(COND.valMAXTIME,max(INPU.vecPANELROTOR));
OUTP.vecCTCONV = nan(COND.valMAXTIME, max(INPU.vecPANELROTOR));

OUTP.vecCLv = nan(COND.valMAXTIME, INPU.valVEHICLES);
OUTP.vecCD = nan(COND.valMAXTIME, INPU.valVEHICLES);
OUTP.vecPREQ = nan(COND.valMAXTIME, INPU.valVEHICLES);
OUTP.vecLD = nan(COND.valMAXTIME, INPU.valVEHICLES);

OUTP.ROTOR.vecTHRUSTDIST = [];
OUTP.ROTOR.vecTORQUEDIST = [];

INPU.vecPANELROTOR = uint16(INPU.vecPANELROTOR);
INPU.vecPANELWING = uint16(INPU.vecPANELWING);

% Initializing wake parameters
WAKE.matWAKEGEOM = [];
WAKE.matNPWAKEGEOM = [];
WAKE.vecWDVEHVSPN = [];
WAKE.vecWDVEHVCRD = [];
WAKE.vecWDVEROLL = [];
WAKE.vecWDVEPITCH = [];
WAKE.vecWDVEYAW = [];
WAKE.vecWDVELESWP = [];
WAKE.vecWDVEMCSWP = [];
WAKE.vecWDVETESWP = [];
WAKE.vecWDVEAREA = [];
WAKE.matWDVENORM = [];
WAKE.matWVLST = [];
WAKE.matWDVE = [];
WAKE.valWNELE = 0;
WAKE.matWCENTER = [];
WAKE.matWCOEFF = [];
WAKE.vecWK = [];
WAKE.matWADJE = [];
WAKE.vecWDVEPANEL = [];
WAKE.valLENWADJE = 0;
WAKE.vecWKGAM = [];
WAKE.vecWDVESYM = [];
WAKE.vecWDVETIP = [];
WAKE.vecWDVESURFACE = [];
WAKE.vecWDVETRI = [];
WAKE.vecWPLOTSURF = [];

% Initializing structure parameters
OUTP.matDEFGLOB = [];
OUTP.matTWISTGLOB = [];
OUTP.vecWRBM = [];
try OUTP.matDEF = zeros(COND.valSTIFFSTEPS,INPU.valNSELE+4); catch; end
try OUTP.matTWIST = zeros(COND.valSTIFFSTEPS,INPU.valNSELE+3); catch; end

% Initiliazing unsteady aero terms
SURF.dGammadt = [];
SURF.gamma_old = [];

end

