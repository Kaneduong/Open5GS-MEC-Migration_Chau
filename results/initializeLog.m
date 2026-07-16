function log = initializeLog(param)

N = param.simTime;

%% Time
log.time = zeros(N,1);

%% UE
log.position = zeros(N,1);
log.connectedMEC = zeros(N,1);

%% Radio
log.rssi = zeros(N,1);
log.sinr = zeros(N,1);
log.delay = zeros(N,1);
log.loss = zeros(N,1);

%% MEC Resource
log.cpuMEC1 = zeros(N,1);
log.cpuMEC2 = zeros(N,1);

log.memoryMEC1 = zeros(N,1);
log.memoryMEC2 = zeros(N,1);

%% Migration
log.redisSync = zeros(N,1);
log.migrationCost = zeros(N,1);

%% Video
log.videoTime = zeros(N,1);
log.buffer = zeros(N,1);
log.freeze = zeros(N,1);
log.totalFreeze = zeros(N,1);
log.stallCount = zeros(N,1);
log.qoe = zeros(N,1);

log.reward = zeros(param.simTime,1);
end