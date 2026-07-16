function trajectory = addTransition(trajectory,state,action,reward,nextState,done)

trajectory.length = trajectory.length+1;

k=trajectory.length;

trajectory.state{k}=state;

trajectory.action(k)=action;

trajectory.reward(k)=reward;

trajectory.nextState{k}=nextState;

trajectory.done(k)=done;

end