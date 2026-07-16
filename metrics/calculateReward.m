function reward = calculateReward(state,param)

reward = 0;

%% QoE

reward = reward + 5*state.qoe;

%% Delay

reward = reward - 0.5*state.delay;

%% Packet loss

reward = reward - 50*state.loss;

%% Freeze

reward = reward - 20*state.freeze;

%% CPU

if state.connectedMEC==1
    cpu = state.cpuMEC1;
else
    cpu = state.cpuMEC2;
end

reward = reward - 0.05*cpu;

%% Migration cost

if state.migrationCost>0
    reward = reward - 2;
end

%% ==========================
%% NEW: thưởng migrate đúng MEC
%% ==========================

midPoint = (param.gNB1 + param.gNB2)/2;

if state.position < midPoint

    if state.connectedMEC==1
        reward = reward + 5;
    else
        reward = reward - 5;
    end

else

    if state.connectedMEC==2
        reward = reward + 5;
    else
        reward = reward - 5;
    end

end

end