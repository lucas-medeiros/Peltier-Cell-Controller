function [ Kc, Ti, Td ] = ISTE_load(K,T,TAU)
%ISE_setpoint Returns controller parameters baseed on the ISE - setpoint
%method
Kc = (1.468/K)*(TAU/T)^(-0.970);
Ti = (T/0.942)*((TAU/T)^(-0.725));
Td = 0.443*T*(TAU/T)^(0.939);

end

