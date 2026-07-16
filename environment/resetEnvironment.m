function state = resetEnvironment(param)

state.time = 0;

state.position = 0;

state.connectedMEC = 1;

state.action = 0;

%% MEC1

state.cpuMEC1 = param.cpuMEC1;

state.memoryMEC1 = param.memoryMEC1;

%% MEC2

state.cpuMEC2 = param.cpuMEC2;

state.memoryMEC2 = param.memoryMEC2;

%% Network

state.redisSync = 0;

state.migrationCost = 0;

state.rssi = 0;

state.sinr = 0;

state.delay = 0;

state.loss = 0;

state.qoe = 5;

state.reward = 0;

%% ===============================
% Video Streaming State
%% ===============================

state.videoID = 1;

state.videoLength = 1000;

state.videoTime = 0;

state.buffer = param.initialBuffer;

state.playing = true;

state.videoFinished = false;

state.freeze = 0;

state.freezeTime = 0;

state.totalFreeze = 0;

state.stallCount = 0;

state.qoe = 5;

%% Initial State Vector

state.stateVector = createStateVector(state);
end