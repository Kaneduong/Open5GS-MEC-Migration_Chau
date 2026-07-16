function memory = initReplayMemory(maxSize)

memory.state = [];

memory.action = [];

memory.reward = [];

memory.nextState = [];

memory.done = [];

memory.maxSize = maxSize;

memory.count = 0;

end