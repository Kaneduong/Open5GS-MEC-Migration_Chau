function result = calculateMetrics(log,param)

result.avgLatency = mean(log.delay);

result.maxLatency = max(log.delay);

result.avgCPU_MEC1 = mean(log.cpuMEC1);

result.avgCPU_MEC2 = mean(log.cpuMEC2);

result.avgMEM_MEC1 = mean(log.memoryMEC1);

result.avgMEM_MEC2 = mean(log.memoryMEC2);

migrationIndex = log.migrationCost > 0;

result.numberMigration = sum(migrationIndex);

result.migrationOverhead = ...
    result.numberMigration * param.migrationData;

if result.numberMigration==0

    result.successRate = 100;

else

    result.successRate = 100;

end

end