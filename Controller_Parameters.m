function Param = Controller_Parameters
global num;
global den;
global Delay;
[ Param.kc, Param.ti, Param.td ] = ISE_setpoint(num,den(1),Delay);
Param.ts = 0.001;
end

