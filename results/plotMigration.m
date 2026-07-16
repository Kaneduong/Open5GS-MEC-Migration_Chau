figure

stairs(logStatic.migrationCost>0,'b','LineWidth',2)
hold on
stairs(logAlways.migrationCost>0,'r','LineWidth',2)
stairs(logRandom.migrationCost>0,'Color',[0.85 0.55 0],'LineWidth',2)
stairs(logPPO.migrationCost>0,'m','LineWidth',2)

grid on
xlabel('Bước mô phỏng')
ylabel('Sự kiện chuyển dịch')
title('Các lần chuyển dịch dịch vụ')
legend('Tĩnh','Luôn chuyển','Ngẫu nhiên','PPO','Location','best')

saveas(gcf,'Figure_Migration.png')