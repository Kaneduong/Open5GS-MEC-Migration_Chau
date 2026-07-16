figure

plot(logStatic.qoe,'b','LineWidth',2)
hold on
plot(logAlways.qoe,'r','LineWidth',2)
plot(logRandom.qoe,'Color',[0.85 0.55 0],'LineWidth',2)
plot(logPPO.qoe,'m','LineWidth',2)

grid on
xlabel('Bước mô phỏng')
ylabel('QoE')
title('So sánh chất lượng trải nghiệm (QoE)')
legend('Tĩnh','Luôn chuyển','Ngẫu nhiên','PPO','Location','best')

saveas(gcf,'Figure_QoE.png')