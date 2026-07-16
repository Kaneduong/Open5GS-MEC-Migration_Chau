clc
clear

%% Environment

env = MECEnvironment;

obsInfo = getObservationInfo(env);
actInfo = getActionInfo(env);

%% ==========================
% Actor Network
%% ==========================

actorNet = [
    featureInputLayer(obsInfo.Dimension(1),"Normalization","none","Name","state")

    fullyConnectedLayer(64,"Name","fc1")
    reluLayer("Name","relu1")

    fullyConnectedLayer(64,"Name","fc2")
    reluLayer("Name","relu2")

    fullyConnectedLayer(numel(actInfo.Elements),"Name","fc3")
    softmaxLayer("Name","actionProb")
];

actorNet = dlnetwork(layerGraph(actorNet));

actor = rlDiscreteCategoricalActor(...
    actorNet,...
    obsInfo,...
    actInfo);

%% ==========================
% Critic Network
%% ==========================

criticNet = [
    featureInputLayer(obsInfo.Dimension(1),"Normalization","none","Name","state")

    fullyConnectedLayer(64,"Name","fc1")
    reluLayer("Name","relu1")

    fullyConnectedLayer(64,"Name","fc2")
    reluLayer("Name","relu2")

    fullyConnectedLayer(1,"Name","value")
];

criticNet = dlnetwork(layerGraph(criticNet));

critic = rlValueFunction(...
    criticNet,...
    obsInfo);

%% ==========================
% PPO Options
%% ==========================

agentOptions = rlPPOAgentOptions(...
    ExperienceHorizon=256,...
    ClipFactor=0.2,...
    EntropyLossWeight=0.02,...
    MiniBatchSize=64,...
    NumEpoch=3,...
    SampleTime=1);

agentOptions.ActorOptimizerOptions.LearnRate = 3e-4;
agentOptions.CriticOptimizerOptions.LearnRate = 1e-3;

%% ==========================
% Agent
%% ==========================

agent = rlPPOAgent(actor,critic,agentOptions);

%% ==========================
% Training
%% ==========================

trainOpts = rlTrainingOptions(...
    MaxEpisodes=500,...
    MaxStepsPerEpisode=100,...
    ScoreAveragingWindowLength=20,...
    StopTrainingCriteria="EpisodeCount",...
    StopTrainingValue=500,...
    Verbose=true,...
    Plots="training-progress");

trainingStats = train(agent,env,trainOpts);

save trainedPPO agent trainingStats