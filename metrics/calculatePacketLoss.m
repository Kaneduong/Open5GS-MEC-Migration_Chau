function loss = calculatePacketLoss(sinr)

loss = 100 ./ (1 + exp((sinr-5)/3));

end