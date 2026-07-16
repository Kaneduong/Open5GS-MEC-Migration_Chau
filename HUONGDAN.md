- Download: https://github.com/Kaneduong/Open5GS-MEC-Migration_Chau.git
- Giải nén
- Download MATLAB R2026a
- Trong MATLAB:
	Install: Deep learning Toolbox
	Install: Reinforcement learning Toolbox
- Open Open5GS-MEC-Migration_Chau folder
- Chạy theo thứ tự
	1. Main.m
		└──Xử lý static, alway, random
	2. trainPPO.m
		└──Huấn luyện PPO
	3. testPPO.m
		└──Chạy PPO
	4. compareResults.m
		└──So sánh kết quả static, always, random, PPO
	5. plotComparison.m
		└──Xuất biểu đồ

Cấu trúc thư mục và file:
Chau_final/
│
├── .gitattributes
├── baselineLogs.mat
├── compareResults.m
├── log.txt
├── logPPO.mat
├── main.asv
├── main.m
├── plotComparison.m
├── testPPO.asv
├── testPPO.m
├── trainPPO.m
├── trainedPPO.mat
│
├── agent/
│   ├── addTransition.m
│   ├── collectTrajectory.m
│   ├── computeAdvantage.m
│   ├── computeReturn.m
│   ├── createNetworks.m
│   ├── environmentStep.m
│   ├── forwardActor.m
│   ├── forwardCritic.m
│   ├── getActionName.m
│   ├── initReplayMemory.m
│   ├── sampleAction.m
│   └── storeTransition.m
│
├── config/
│   └── initParameters.m
│
├── environment/
│   ├── MECEnvironment.asv
│   ├── MECEnvironment.m
│   ├── resetEnvironment.asv
│   ├── resetEnvironment.m
│   ├── stepEnvironment.m
│   ├── updateVideoStreaming.asv
│   ├── updateVideoStreaming.m
│
├── metrics/
│   ├── calculateCPU.m
│   ├── calculateDelay.m
│   ├── calculateMECResource.m
│   ├── calculateMemory.m
│   ├── calculateMetrics.m
│   ├── calculateMigrationCost.m
│   ├── calculatePacketLoss.m
│   ├── calculateQoE.m
│   ├── calculateRedisSync.m
│   ├── calculateReward.m
│   ├── calculateSINR.m
│   └── createStateVector.m
│
├── policy/
│   ├── alwaysPolicy.m
│   ├── ppoPolicy.m
│   ├── randomPolicy.asv
│   ├── randomPolicy.m
│   └── staticPolicy.m
│
├── results/
│   ├── 11.png
│   ├── 12.png
│   ├── Figure_Buffer.png
│   ├── Figure_CPU.png
│   ├── Figure_Delay.png
│   ├── Figure_Migration.png
│   ├── Figure_QoE.png
│   ├── Figure_Reward.png
│   ├── ResultTable.xlsx
│   ├── exportTable.m
│   ├── initializeLog.m
│   ├── plotBuffer.m
│   ├── plotCPU.m
│   ├── plotDelay.m
│   ├── plotMigration.m
│   ├── plotQoE.m
│   ├── plotReward.m
│   ├── training.png
│   └── updateLog.m
│
├── rl/
│   ├── initializeMemory.m
│   └── saveTransition.m
│
└── simulation/
    └── runSimulation.m