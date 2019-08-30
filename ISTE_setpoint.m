function [ Kc, Ti, Td ] = ISTE_setpoint(K,T,TAU)
%ISE_setpoint Returns controller parameters baseed on the ISE - setpoint
%method
Kc = (1.042/K)*(TAU/T)^(-0.897);
Ti = T/(0.987-0.238*(TAU/T));
Td = 0.385*T*(TAU/T)^(0.906);

end

