function delay = calculateDelay(sinr,param)

radio = param.radioDelay;

core = param.coreDelay;

extra = max(0,15-sinr)*0.8;

delay = radio + core + extra;

end