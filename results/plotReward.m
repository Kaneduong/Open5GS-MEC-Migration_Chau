figure

plot(logStatic.reward,'b','LineWidth',2)
hold on
plot(logAlways.reward,'r','LineWidth',2)
plot(logRandom.reward,'Color',[0.85 0.55 0],'LineWidth',2)
plot(logPPO.reward,'m','LineWidth',2)

grid on
xlabel('Bước mô phỏng')
ylabel('Giá trị phần thưởng')
title('So sánh giá trị phần thưởng')
legend('Tĩnh','Luôn chuyển','Ngẫu nhiên','PPO','Location','best')

saveas(gcf,'Figure_Reward.png')