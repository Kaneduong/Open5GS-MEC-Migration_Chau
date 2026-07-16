figure

plot(logStatic.buffer,'b','LineWidth',2)
hold on
plot(logAlways.buffer,'r','LineWidth',2)
plot(logRandom.buffer,'Color',[0.85 0.55 0],'LineWidth',2)
plot(logPPO.buffer,'m','LineWidth',2)

grid on
xlabel('Bước mô phỏng')
ylabel('Bộ đệm video (giây)')
title('Mức bộ đệm video')
legend('Tĩnh','Luôn chuyển','Ngẫu nhiên','PPO','Location','best')

saveas(gcf,'Figure_Buffer.png')