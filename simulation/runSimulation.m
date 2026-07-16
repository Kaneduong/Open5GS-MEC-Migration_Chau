function log = runSimulation(policyName)

param = initParameters();

state = resetEnvironment(param);

log = initializeLog(param);
trajectory = collectTrajectory();

agent = createNetworks(length(state.stateVector),2);
fprintf('\n===== %s =====\n',upper(policyName));

for k = 1:param.simTime

    switch lower(policyName)

        case 'static'

    % Static: luôn giữ MEC ban đầu
    action = 1;

case 'always'

    % Always: nếu UE chưa ở MEC gần nhất thì migrate
    if state.position < (param.gNB1 + param.gNB2)/2

        if state.connectedMEC == 1
            action = 1;      % Stay
        else
            action = 2;      % Migrate
        end

    else

        if state.connectedMEC == 2
            action = 1;      % Stay
        else
            action = 2;      % Migrate
        end

    end

case 'random'

    if rand < 0.5
        action = 1;
    else
        action = 2;
    end

    end
oldState = state.stateVector;
    state = stepEnvironment(state,param,action);
newState = state.stateVector;

reward = state.reward;

done = (k==param.simTime);

trajectory = addTransition( ...
    trajectory,...
    oldState,...
    action,...
    reward,...
    newState,...
    done);
    log = updateLog(log,state);

    fprintf(['T=%3d Pos=%4.0f MEC=%d Video=%3.0f Buffer=%4.1f Freeze=%4.1f QoE=%4.2f Delay=%6.2f Mig=%4.2f\n'],...
state.time,...
state.position,...
state.connectedMEC,...
state.videoTime,...
state.buffer,...
state.freeze,...
state.qoe,...
state.delay,...
state.migrationCost);

end
%% ===============================
% PPO Preparation
%% ===============================

value = zeros(trajectory.length,1);

for k = 1:trajectory.length

    value(k) = forwardCritic(agent,trajectory.state{k});

end

Return = computeReturn(trajectory.reward,0.99);

Advantage = computeAdvantage(Return,value);

disp('First 5 Returns')
disp(Return(1:5))

disp('First 5 Advantages')
disp(Advantage(1:5))


result = calculateMetrics(log,param);
disp('State Vector cuối cùng:')
disp(state.stateVector')
disp(result)
fprintf('\nTrajectory collected : %d\n',trajectory.length);

disp('First Transition')

disp(trajectory.state{1}')

disp(trajectory.action(1))

disp(trajectory.reward(1))

disp(trajectory.nextState{1}')
fprintf('Finished\n');

end