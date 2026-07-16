clear
clc

load baselineLogs
load logPPO

Result = table;

Result.Policy = ["Static";"Always";"Random";"PPO"];

Result.Delay = [ ...
    mean(logStatic.delay);
    mean(logAlways.delay);
    mean(logRandom.delay);
    mean(logPPO.delay)];

Result.QoE = [ ...
    mean(logStatic.qoe);
    mean(logAlways.qoe);
    mean(logRandom.qoe);
    mean(logPPO.qoe)];

Result.Reward = [ ...
    mean(logStatic.reward);
    mean(logAlways.reward);
    mean(logRandom.reward);
    mean(logPPO.reward)];

Result.Migration = [ ...
    sum(logStatic.migrationCost>0);
    sum(logAlways.migrationCost>0);
    sum(logRandom.migrationCost>0);
    sum(logPPO.migrationCost>0)];

disp(Result)

figure

subplot(2,2,1)
bar(Result.Delay)
title('Average Delay')
xticklabels(Result.Policy)

subplot(2,2,2)
bar(Result.QoE)
title('Average QoE')
xticklabels(Result.Policy)

subplot(2,2,3)
bar(Result.Reward)
title('Average Reward')
xticklabels(Result.Policy)

subplot(2,2,4)
bar(Result.Migration)
title('Migration Count')
xticklabels(Result.Policy)