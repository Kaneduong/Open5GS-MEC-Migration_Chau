function agent = createNetworks(stateDim,actionDim)

agent.stateDim = stateDim;

agent.actionDim = actionDim;

%% Actor

agent.actor.W1 = randn(64,stateDim)*0.05;
agent.actor.b1 = zeros(64,1);

agent.actor.W2 = randn(actionDim,64)*0.05;
agent.actor.b2 = zeros(actionDim,1);

%% Critic

agent.critic.W1 = randn(64,stateDim)*0.05;
agent.critic.b1 = zeros(64,1);

agent.critic.W2 = randn(1,64)*0.05;
agent.critic.b2 = 0;

agent.learningRate = 0.0003;

end