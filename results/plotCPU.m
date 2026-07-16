figure

plot(logStatic.cpuMEC1,'b','LineWidth',2)
hold on
plot(logAlways.cpuMEC1,'r','LineWidth',2)
plot(logRandom.cpuMEC1,'Color',[0.85 0.55 0],'LineWidth',2)
plot(logPPO.cpuMEC1,'m','LineWidth',2)

grid on
xlabel('Bước mô phỏng')
ylabel('CPU MEC1 (%)')
title('Mức sử dụng CPU của MEC1')
legend('Tĩnh','Luôn chuyển','Ngẫu nhiên','PPO','Location','best')

saveas(gcf,'Figure_CPU.png')