function memory = calculateMemory(state,param)

memory = param.memoryIdle ...
       + 0.03*state.position ...
       + 0.10*state.loss;

memory = min(memory,100);

end