figure

plot(logStatic.delay,'b','LineWidth',2)
hold on
plot(logAlways.delay,'r','LineWidth',2)
plot(logRandom.delay,'Color',[0.85 0.55 0],'LineWidth',2)
plot(logPPO.delay,'m','LineWidth',2)

grid on
xlabel('Bước mô phỏng')
ylabel('Độ trễ (ms)')
title('So sánh độ trễ mạng')
legend('Tĩnh','Luôn chuyển','Ngẫu nhiên','PPO','Location','best')

saveas(gcf,'Figure_Delay.png')