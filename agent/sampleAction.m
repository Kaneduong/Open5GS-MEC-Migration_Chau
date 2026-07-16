function action = sampleAction(agent,state)

x = tanh(agent.actor.W1*state + agent.actor.b1);

logit = agent.actor.W2*x + agent.actor.b2;

p = exp(logit);

p = p/sum(p);

r = rand;

if r<p(1)

    action=1;

else

    action=2;

end

end