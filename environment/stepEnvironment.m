function state = stepEnvironment(state,param,action)

%% Action

state.action = action;

%% Time

state.time = state.time + param.dt;

%% Position

state.position = state.position + param.speed*param.dt;

if state.position > param.gNB2
    state.position = param.gNB2;
end

%% Migration

%% Service Migration

previousMEC = state.connectedMEC;

% Action = 1 : Stay
% Action = 2 : Migrate

if action == 2

    if state.connectedMEC == 1
        state.connectedMEC = 2;
    else
        state.connectedMEC = 1;
    end

end

if previousMEC ~= state.connectedMEC

    state.redisSync = calculateRedisSync(param);

    state.migrationCost = calculateMigrationCost(param);

else

    state.redisSync = 0;

    state.migrationCost = 0;

end

%% Distance

if state.connectedMEC==1

    distance=abs(state.position-param.gNB1);

else

    distance=abs(state.position-param.gNB2);

end

if distance<1

    distance=1;

end

%% RSSI

state.rssi=param.RSSI0-10*param.pathLoss*log10(distance);

%% SINR

state.sinr=calculateSINR(state.rssi,param.noise);

%% Delay

state.delay=calculateDelay(state.sinr,param);

%% Loss

state.loss=calculatePacketLoss(state.sinr);

%% CPU
%% Memory

state = calculateMECResource(state);

%% Update Video

state = updateVideoStreaming(state,param);

%% Reward

state.reward = calculateReward(state,param);

%% State Vector

state.stateVector = createStateVector(state);

%% Terminal State

state.done = false;

if state.time >= param.simTime
    state.done = true;
end

if state.videoFinished
    state.done = true;
end

end