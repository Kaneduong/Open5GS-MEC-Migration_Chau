function memory = saveTransition(memory,state,action,reward,nextState)

memory.state{end+1} = state;

memory.action(end+1) = action;

memory.reward(end+1) = reward;

memory.nextState{end+1} = nextState;

end