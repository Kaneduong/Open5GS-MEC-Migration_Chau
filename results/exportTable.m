clear Result

policy = ["Tĩnh";"Luôn chuyển";"Ngẫu nhiên";"PPO"];

Delay = [
    mean(logStatic.delay)
    mean(logAlways.delay)
    mean(logRandom.delay)
    mean(logPPO.delay)
];

QoE = [
    mean(logStatic.qoe)
    mean(logAlways.qoe)
    mean(logRandom.qoe)
    mean(logPPO.qoe)
];

Reward = [
    mean(logStatic.reward)
    mean(logAlways.reward)
    mean(logRandom.reward)
    mean(logPPO.reward)
];

Migration = [
    sum(logStatic.migrationCost>0)
    sum(logAlways.migrationCost>0)
    sum(logRandom.migrationCost>0)
    sum(logPPO.migrationCost>0)
];

% ===== TẠO TABLE =====
Result = table(policy,Delay,QoE,Reward,Migration);

% ===== ĐỔI TÊN CỘT =====
Result.Properties.VariableNames = { ...
    'ChinhSach', ...
    'DoTreTB_ms', ...
    'QoE_TB', ...
    'Reward_TB', ...
    'SoLanChuyenDich'};

disp(Result)

writetable(Result,'ResultTable.xlsx')