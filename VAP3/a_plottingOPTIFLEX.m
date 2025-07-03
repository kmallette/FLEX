close all
% figure Name 'Position vs. Time'
% plot(OUTP.sim_time,(OUTP.matDEFGLOB(:,14)))
% figure(2)
% plot(OUTP.sim_time,OUTP.matGLOBUVW(:,3)) % vertical velocity
% figure(3)
% plot(OUTP.sim_time,OUTP.vecCD) %CD calc --> convert to D and net D
% figure(4)
% plot(OUTP.sim_time,OUTP.vecCGLOC(:,3)) %vertical location
% figure(5)
% plot(OUTP.sim_time,rad2deg(OUTP.matTWISTGLOB(:,14))) %tip twist
%things to plot, OUTP.matGLOBUVW, CG location, Lift, Drag, tip twist,
%bending/deflection
%determine area under the curve --> net drag changes!!!
%combine all the graphs into one plot to visualize

pitch=atand(OUTP.matGLOBUVW(:,3)./OUTP.matGLOBUVW(:,1));
density = OUTP.valDENSITY;

loc = OUTP.vecCGLOC;

D = OUTP.vecCDI .* 0.5 .* density .* (OUTP.vecVEHVINF).^2*0.4*5.45;
L = OUTP.vecCL .* 0.5 .* density .* (OUTP.vecVEHVINF).^2*0.4*5.45;
D_net = trapz(OUTP.sim_time,D)-median(OUTP.vecCD); %newtons second of drag cost total across simulation
D_eq = (trapz(OUTP.sim_time,D)-max(OUTP.sim_time)*D(2,1))/max(OUTP.sim_time); %equivalent drag reduction over simulation time
D_percent_eq = 1-abs(D_eq-D(2))/D(2);

H = OUTP.vecVEHVINF.^2/(2*9.81) + loc(:,3);
% Hi = OUTP2.vecVEHVINF.^2/(2*9.81) + OUTP2.vecCGLOC(:,3);

figure(4)
tiledlayout(4,1)
    ax1 = nexttile;
        plot(OUTP.sim_time,OUTP.matGUSTVEL(27,:)/18*100)
%         plot(OUTP.sim_time,OUTP.matGLOBUVW(:,3))
        xlabel("time (s)",'FontSize', 10)
        title("a) Gust Magnitude",'FontSize', 10)
        ylabel("Airspeed, %",'FontSize', 10)
%         axis([0, max(OUTP.sim_time),min(OUTP.matGUSTVEL(27,:))*1.1/20*100,max(OUTP.matGUSTVEL(27,:))*1.1/20*100])
        grid on

    ax2 = nexttile;
        plot(OUTP.sim_time,rad2deg(OUTP.matTWISTGLOB(:,11)))
        xlabel("time (s)")
        title("b) Tip Twist",'FontSize', 10)
        ylabel("Twist, degrees",'FontSize', 10)
        grid on
    
%     ax3 = nexttile;
%         plot(OUTP.sim_time,OUTP.vecCGLOC(:,3))
%         xlabel("time (s)")
%         ylabel("Height Change (m)")
        
    ax3 = nexttile;
        plot(OUTP.sim_time,100*OUTP.matDEFGLOB(:,11))
        xlabel("time (s)",'FontSize', 10)
        title("c) Tip Deflection",'FontSize', 10)
        ylabel("Deflection, cm",'FontSize', 10)
        grid on
        %     ax3 = nexttile;
%         plot(OUTP.sim_time,OUTP.vecCD)
%         xlabel("time (s)")
%         ylabel("Coefficient of Drag")
%         
%     ax3 = nexttile;
%         plot(OUTP.sim_time,pitch)
%         xlabel("time (s)")
%         ylabel("Pitch")

%     ax4 = nexttile;
%         plot(OUTP.sim_time,OUTP.GlobForce(:,1)/D(2))
%         xlabel("time (s)")
%         ylabel("Coefficient of Lift")
%         xlabel("time (s)",'FontSize', 10)
%         title("d) Percent Drag Variation",'FontSize', 10)
%         ylabel("Cruise Drag, %",'FontSize', 10)
%         grid on
%         axis([0,max(OUTP.sim_time),min(OUTP.GlobForce(:,1))*1.1/D(2),max(OUTP.GlobForce(:,1))*1.1/D(2)])
%         line([0;max(OUTP.sim_time)],[0;0],'Color','red','LineStyle','--')
%         legend("","Cruise Condition")
%         legend boxoff
        
    ax4 = nexttile;
        hold on
        plot(OUTP.sim_time,H)
%         plot(OUTP.sim_time,Hi)
        ylabel("meters")
        xlabel("time (s)",'FontSize', 10)
        title("d) Energy Altitude",'FontSize', 10)
        grid on
        hold off
%         axis([0,max(OUTP.sim_time),min(OUTP.GlobForce(:,1))*1.1/D(2),max(OUTP.GlobForce(:,1))*1.1/D(2)])
        
D(1)=D(2); %just fixes the graphic
%      ax4 = nexttile;
%         hold on
%         plot(OUTP.sim_time,D./D(2)*100)
%         line([0;max(OUTP.sim_time)],[100;100],'Color','red','LineStyle','--')
% %         line([0;max(OUTP.sim_time)],[D(2);D(2)],'Color','red','LineStyle','--')
%         hold off
%         xlabel("time (s)",'FontSize', 10)
%         title("d) Percent Drag Variation",'FontSize', 10)
%         ylabel("Cruise Drag, %",'FontSize', 10)
%         legend('','Cruise Drag','FontSize', 10)
%         legend boxoff
%         grid on

% plot(OUTP.sim_time,D)