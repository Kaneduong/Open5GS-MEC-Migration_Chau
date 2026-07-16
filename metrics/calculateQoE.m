function qoe = calculateQoE(state)

qoe = 5;

qoe = qoe - state.delay/50;

qoe = qoe - state.loss/20;

qoe = qoe - state.totalFreeze;

qoe = max(1,min(5,qoe));

end