close all

figure('Color','w','Position',[100 50 1400 800])

lw = 2;

%% ===============================
% Delay
%% ===============================

subplot(3,2,1)

plot(logStatic.delay,'b','LineWidth',lw)
hold on
plot(logAlways.delay,'r','LineWidth',lw)
plot(logRandom.delay,'Color',[0.85 0.6 0],'LineWidth',lw)
plot(logPPO.delay,'m','LineWidth',lw)

grid on
xlabel('Time Step')
ylabel('Delay (ms)')
title('Network Delay')

legend({'Static','Always','Random','PPO'},...
    'Location','northoutside',...
    'Orientation','horizontal')

%% ===============================
% QoE
%% ===============================

subplot(3,2,2)

plot(logStatic.qoe,'b','LineWidth',lw)
hold on
plot(logAlways.qoe,'r','LineWidth',lw)
plot(logRandom.qoe,'Color',[0.85 0.6 0],'LineWidth',lw)
plot(logPPO.qoe,'m','LineWidth',lw)

grid on
xlabel('Time Step')
ylabel('QoE')
title('Video QoE')

legend({'Static','Always','Random','PPO'},...
'Location','southoutside',...
'Orientation','horizontal')

%% ===============================
% CPU
%% ===============================

subplot(3,2,3)

plot(logStatic.cpuMEC1,'b','LineWidth',lw)
hold on
plot(logAlways.cpuMEC1,'r','LineWidth',lw)
plot(logRandom.cpuMEC1,'Color',[0.85 0.6 0],'LineWidth',lw)
plot(logPPO.cpuMEC1,'m','LineWidth',lw)

grid on
xlabel('Time Step')
ylabel('CPU (%)')
title('CPU Usage MEC1')

legend({'Static','Always','Random','PPO'},...
'Location','northwest')

%% ===============================
% Buffer
%% ===============================

subplot(3,2,4)

plot(logStatic.buffer,'b','LineWidth',lw)
hold on
plot(logAlways.buffer,'r','LineWidth',lw)
plot(logRandom.buffer,'Color',[0.85 0.6 0],'LineWidth',lw)
plot(logPPO.buffer,'m','LineWidth',lw)

grid on
xlabel('Time Step')
ylabel('Buffer (s)')
title('Video Buffer')

legend({'Static','Always','Random','PPO'},...
'Location','southoutside',...
'Orientation','horizontal')

%% ===============================
% Reward
%% ===============================

subplot(3,2,5)

plot(logStatic.reward,'b','LineWidth',lw)
hold on
plot(logAlways.reward,'r','LineWidth',lw)
plot(logRandom.reward,'Color',[0.85 0.6 0],'LineWidth',lw)
plot(logPPO.reward,'m','LineWidth',lw)

grid on
xlabel('Time Step')
ylabel('Reward')
title('Reward')

legend({'Static','Always','Random','PPO'},...
'Location','southoutside',...
'Orientation','horizontal')

%% ===============================
% Migration
%% ===============================

subplot(3,2,6)

stairs(logStatic.migrationCost>0,'b','LineWidth',lw)
hold on
stairs(logAlways.migrationCost>0,'r','LineWidth',lw)
stairs(logRandom.migrationCost>0,'Color',[0.85 0.6 0],'LineWidth',lw)
stairs(logPPO.migrationCost>0,'m','LineWidth',lw)

ylim([-0.1 1.2])

grid on
xlabel('Time Step')
ylabel('Migration')

title('Migration Events')

legend({'Static','Always','Random','PPO'},...
'Location','southoutside',...
'Orientation','horizontal')

sgtitle('Performance Comparison of Service Migration Policies',...
'FontSize',16,...
'FontWeight','bold')