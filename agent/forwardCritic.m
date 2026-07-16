function value = forwardCritic(agent,state)

x = tanh(agent.critic.W1*state + agent.critic.b1);

value = agent.critic.W2*x + agent.critic.b2;

end