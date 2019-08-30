function [ Kc, Ti, Td ] = ISE_load(K,T,TAU)
%ISE_setpoint Returns controller parameters baseed on the ISE - setpoint
%method
Kc = (1.473/K)*(TAU/T)^(-0.970);
Ti = (T/1.115)*(TAU/T)^(-0.753);
Td = 0.550*T*(TAU/T)^(0.948);

end
