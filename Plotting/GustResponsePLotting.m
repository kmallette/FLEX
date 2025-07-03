clc
clear
% close all

%% Variable Definition
% load('G:\FLEX\Run Logs\2024-05-24\NoGust_RunFromInputFile.mat') %Load File Containing No-Gust Values
% load('C:\Users\korbi\Documents\Thesis Work\FLEX\Run Logs\2024-05-24\NoGust_RunFromInputFile')
load('G:\Thesis Work\FLEX\Run Logs\2024-06-17\BaselineNew4')
t2 = OUTP.sim_time;
[He_baseline] = fcnBASELINEPLOTTING(OUTP);

% load('G:\FLEX\Run Logs\2024-05-24\SineGust_RunFromInputFile.mat') %Load File Containing Gust Response Values
% load('G:\FLEX\Run Logs\2024-04-26\april26th_runfrominputfile.mat')
% load('G:\FLEX\Run Logs\2024-05-27\Cos_LowerJt.mat')
% load('G:\FLEX\Run Logs\2024-06-08\run2verify_optiflex.mat')
% load('C:\Users\korbi\Documents\Thesis Work\FLEX\Run Logs\2024-05-27\Sine_LowerJt')
load('G:\Thesis Work\FLEX\Run Logs\2024-06-17\NewEIGJ4')
[He, TipDef, TipTwist, GustMag] = fcnPLOTTINGVAR(OUTP,VEHI);
t = OUTP.sim_time;

%% Sync Times
He_baseline(length(t2):length(t)) = NaN;%Only works if they have the same timestep, note they should have the same
if length(t2) > length(t)
    He_baseline = He_baseline(1:length(t));
end

%% Graph Properties
AR = 8; %Aspect Ratio, x/y
font = 8;

tx = 3.5; %Time value for dynamic response evaluation section post gust
marg = 1.1; %Multiply the height of the graph by margin %

%% Plotting FLEX Performance Parameters
figure(4)
fig = gcf;
scaleS = 90;
fig.Position(3:4) = [8*scaleS,6*scaleS];

tiles=tiledlayout(4,1);
tiles.TileSpacing = 'compact';
tiles.Padding = 'compact';

ax1 = nexttile;
plot(t,GustMag,'k')
title('Gust Magnitude')
ylabel('% Cruise Speed')
pbaspect([AR 1 1])
if min(GustMag) > 0
    axis([0, max(t), min(GustMag)*(2-marg), max(GustMag)*marg])
else
    axis([0, max(t), min(GustMag)*marg, max(GustMag)*marg])
end
grid on
grid minor
ax = gca;
ax.FontSize = 18;

ax2 = nexttile;
hold on
plot(t,TipTwist,'k')
% xline(t(35),'r--')
% xline(tx,'b--')
% xline(tx+0.02,'b--')
hold off
title('Wingtip Twist')
ylabel('degrees')
pbaspect([AR 1 1])
axis([0, max(t), min(TipTwist)*(2-marg), max(TipTwist)*marg])
grid on
grid minor
ax = gca;
ax.FontSize = 18;

ax3 = nexttile;
hold on
plot(t,TipDef,'k')
% xline(t(35),'r--')
% xline(tx,'b--')
% xline(tx+0.02,'b--')
hold off
title('Wingtip Deflection')
ylabel('mm')
pbaspect([AR 1 1])
axis([0, max(t), min(TipDef)*(2-marg), max(TipDef)*marg])
grid on
grid minor
ax = gca;
ax.FontSize = 18;

% nexttile
% hold on
% plot(t,He,'k')
% plot(t,He_baseline,'k--')
% hold off
% title('Energy Altitude')
% ylabel('m')
% legend('','Cruise Condition')
% legend('Location','northeast')
% pbaspect([AR 1 1])
% axis([0, max(t), min(He)*(2-marg), max(He_baseline)*marg])
% grid on 
% grid minor

ax4 = nexttile;
hold on
plot(t,(He-He_baseline),'k')
plot(tx,(He(round(0.8*length(t)))-He_baseline(round(0.8*length(t)))),'x')
hold off
legend('','Net Energy Altitude Change')
title('Change in Energy Altitude')
ylabel('m')
pbaspect([AR 1 1])
axis([0, max(t), 0, max(He-He_baseline)*marg])
grid on
grid minor
ax = gca;
ax.FontSize = 18;

xlabel('time (s)')

linkaxes([ax1, ax2, ax3, ax4],"x")

Padding = 'compact';
TileSpacing = 'compact';
fontsize(font,"points")
