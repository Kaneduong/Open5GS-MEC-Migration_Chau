function action = alwaysPolicy(state,param)

handoverPoint = (param.gNB1 + param.gNB2)/2;

if state.position >= handoverPoint

    action = 1;

else

    action = 0;

end

end