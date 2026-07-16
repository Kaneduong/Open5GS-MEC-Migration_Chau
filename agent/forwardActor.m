function prob = forwardActor(agent,state)

x = tanh(agent.actor.W1*state + agent.actor.b1);

logit = agent.actor.W2*x + agent.actor.b2;

logit = logit - max(logit);

p = exp(logit);

prob = p/sum(p);

end