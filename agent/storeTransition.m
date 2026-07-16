function memory = storeTransition(memory,state,action,reward,nextState,done)

memory.count = memory.count + 1;

k = memory.count;

memory.state{k} = state;

memory.action(k) = action;

memory.reward(k) = reward;

memory.nextState{k} = nextState;

memory.done(k) = done;

if memory.count > memory.maxSize

    memory.state(1) = [];

    memory.action(1) = [];

    memory.reward(1) = [];

    memory.nextState(1) = [];

    memory.done(1) = [];

    memory.count = memory.maxSize;

end

end