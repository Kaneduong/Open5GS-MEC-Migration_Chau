function cpu = calculateCPU(state,param)

% CPU MEC tăng theo tải truy cập và chất lượng mạng

cpu = param.cpuIdle ...
      + 0.05*state.position ...
      + 0.20*state.loss;

cpu = min(cpu,100);

end