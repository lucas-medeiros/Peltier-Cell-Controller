function [ Kc, Ti, Td ] = ISE_setpoint(K,T,TAU)
%ISE_setpoint Returns controller parameters baseed on the ISE - setpoint
%method
Kc = (1.048/K)*(TAU/T)^(-0.897);
Ti = T/(1.195-0.368*(TAU/T));
Td = 0.489*T*(TAU/T)^(0.888);

end

