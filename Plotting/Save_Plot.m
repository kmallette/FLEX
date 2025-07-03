function [h] = Save_Plot(filesavepath,fignum)

%% Create PDF of figure
figure(fignum)
% samexaxis('xmt','on','ytac','join','yld',1)
h = figure(fignum);
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,filesavepath,'-dpdf','-r0')