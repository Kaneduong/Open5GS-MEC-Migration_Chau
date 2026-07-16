function param = initParameters()

%% ==============================
% Simulation
%% ==============================

param.simTime = 100;
param.dt = 1;

%% ==============================
% Network Topology
%% ==============================

param.gNB1 = 0;
param.gNB2 = 1000;

%% ==============================
% UE
%% ==============================

param.speed = 10;

%% ==============================
% Radio
%% ==============================

param.RSSI0 = -20;          % dBm tại 1 m
param.pathLoss = 2.2;       % Path Loss Exponent
param.noise = -100;         % dBm

%% ==============================
% MEC
%% ==============================

%% MEC1

param.cpuMEC1=20;

param.memoryMEC1=25;

%% MEC2

param.cpuMEC2=20;

param.memoryMEC2=25;

%% ==============================
% Delay
%% ==============================

param.coreDelay = 5;        % ms
param.radioDelay = 2;       % ms

%% ==============================
% Redis
%% ==============================

param.stateSize = 5;        % MB
param.bandwidth = 100;      % MB/s

%% ==============================
% Migration
%% ==============================

param.migrationData = 105;  % MB

%% ===============================
% Video Streaming
%% ===============================

param.videoRate = 1;          % giây video phát mỗi bước

param.initialBuffer = 5;      % giây

param.maxBuffer = 10;

param.downloadRate = 1.2;     % giây video tải về mỗi bước

param.redisSyncTime = 0.8;    % giây

%param.freezePenalty = 0.5;
end