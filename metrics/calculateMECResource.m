function state = calculateMECResource(state)

if state.connectedMEC==1

    state.cpuMEC1 = min(95,state.cpuMEC1+0.5);

    state.memoryMEC1 = min(95,state.memoryMEC1+0.3);

    state.cpuMEC2 = max(20,state.cpuMEC2-0.2);

    state.memoryMEC2 = max(25,state.memoryMEC2-0.1);

else

    state.cpuMEC2 = min(95,state.cpuMEC2+0.5);

    state.memoryMEC2 = min(95,state.memoryMEC2+0.3);

    state.cpuMEC1 = max(20,state.cpuMEC1-0.2);

    state.memoryMEC1 = max(25,state.memoryMEC1-0.1);

end

end