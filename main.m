clear
clc

restoredefaultpath

projectRoot = fileparts(mfilename('fullpath'));

addpath(genpath(projectRoot));

logStatic = runSimulation('static');

logAlways = runSimulation('always');

logRandom = runSimulation('random');
save baselineLogs ...
    logStatic ...
    logAlways ...
    logRandom