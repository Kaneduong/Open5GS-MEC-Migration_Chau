function log = updateLog(log,state)

k = state.time;

%% Time
log.time(k) = state.time;

%% UE
log.position(k) = state.position;
log.connectedMEC(k) = state.connectedMEC;

%% Radio
log.rssi(k) = state.rssi;
log.sinr(k) = state.sinr;
log.delay(k) = state.delay;
log.loss(k) = state.loss;

%% MEC Resource
log.cpuMEC1(k) = state.cpuMEC1;
log.cpuMEC2(k) = state.cpuMEC2;

log.memoryMEC1(k) = state.memoryMEC1;
log.memoryMEC2(k) = state.memoryMEC2;

%% Migration
log.redisSync(k) = state.redisSync;
log.migrationCost(k) = state.migrationCost;

%% Video Streaming
log.videoTime(k) = state.videoTime;
log.buffer(k) = state.buffer;
log.freeze(k) = state.freeze;
log.totalFreeze(k) = state.totalFreeze;
log.stallCount(k) = state.stallCount;
log.qoe(k) = state.qoe;

log.reward(k) = state.reward;
end