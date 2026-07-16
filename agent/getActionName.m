function actionName = getActionName(action)

switch action

    case 1
        actionName = "Stay";

    case 2
        actionName = "Migrate";

    otherwise
        actionName = "Unknown";

end

end