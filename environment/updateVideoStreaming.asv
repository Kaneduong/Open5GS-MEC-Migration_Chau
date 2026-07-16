function state = updateVideoStreaming(state,param)

%% ===============================
% Redis Synchronization
%% ===============================

state.freeze = 0;

if state.migrationCost > 0

    state.redisSync = param.redisSyncTime;

else

    state.redisSync = 0;

end

%% ===============================
% Download Video Segment
%% ===============================

download = param.downloadRate - state.redisSync;

download = max(0,download);

%% ===============================
% Update Buffer
%% ===============================

state.buffer = state.buffer + download;

if state.buffer > param.maxBuffer

    state.buffer = param.maxBuffer;

end

%% ===============================
% Playback
%% ===============================

if state.buffer >= param.videoRate

    state.buffer = state.buffer - param.videoRate;

    state.videoTime = state.videoTime + param.videoRate;

    state.playing = true;

else

    %% Buffer không đủ

    state.freeze = param.videoRate - state.buffer;

    state.freezeTime = state.freezeTime + state.freeze;

    state.totalFreeze = state.totalFreeze + state.freeze;

    state.stallCount = state.stallCount + 1;

    state.buffer = 0;

    state.playing = false;

end

%% ===============================
% Video Finish
%% ===============================

if state.videoTime >= state.videoLength

    state.videoFinished = true;

end

%% ===============================
% QoE
%% ===============================

state.qoe = 5 ...
            -0.05*state.delay ...
            -0.40*state.freeze ...
            -0.02*state.totalFreeze ...
            -0.03*state.stallCount;

state.qoe=max(1,min(5,state.qoe));

end