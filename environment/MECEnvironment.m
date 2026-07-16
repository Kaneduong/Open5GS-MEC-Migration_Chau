classdef MECEnvironment < rl.env.MATLABEnvironment

    properties

        State

        Param

        Log

    end

    properties(Access = protected)

        IsDone = false;

    end

    methods

        function this = MECEnvironment()

            ObservationInfo = rlNumericSpec([12 1]);

            ObservationInfo.Name = "State";

            ActionInfo = rlFiniteSetSpec([1 2]);

            ActionInfo.Name = "Action";

            this = this@rl.env.MATLABEnvironment(ObservationInfo,ActionInfo);

            this.Param = initParameters();

            this.State = resetEnvironment(this.Param);
            this.Log = initializeLog(this.Param);

        end

        function InitialObservation = reset(this)

            this.Param = initParameters();

            this.State = resetEnvironment(this.Param);
            this.Log = initializeLog(this.Param);

            this.IsDone = false;

            InitialObservation = this.State.stateVector;

        end

        function [Observation,Reward,IsDone,LoggedSignals] = step(this,Action)

            this.State = stepEnvironment(this.State,this.Param,Action);
            this.Log = updateLog(this.Log,this.State);

            Observation = this.State.stateVector;

            Reward = this.State.reward;

            IsDone = this.State.done;
            fprintf("Step=%3d  Action=%d  Reward=%8.3f\n",...
    this.State.time,Action,Reward);
            LoggedSignals = [];

            this.IsDone = IsDone;

        end

    end

end