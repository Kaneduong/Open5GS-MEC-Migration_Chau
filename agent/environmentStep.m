function [nextState,reward] = environmentStep(state,param,action)

switch action

    case 1
        % Stay
        state = stepEnvironment(state,param,0);

    case 2
        % Migrate
        state = stepEnvironment(state,param,1);

end

reward = state.reward;

nextState = state.stateVector;

end