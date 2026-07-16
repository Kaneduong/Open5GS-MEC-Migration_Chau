function G = computeReturn(reward,gamma)

N = length(reward);

G = zeros(N,1);

G(N) = reward(N);

for k = N-1:-1:1

    G(k) = reward(k) + gamma*G(k+1);

end

end