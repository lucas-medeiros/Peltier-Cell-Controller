%% PID CONTROLLER
% This is a template to implement a Proportional-Integral-Derivative
% controller 
%% Author
% Gilberto Reynoso Meza (ORCid 0000-0002-8392-6225)
% @gilreyme
% http://www.researchgate.net/profile/Gilberto_Reynoso-Meza
% Version: Mai/2019

function uk=PID_control(ek)

% Introduce global parameters
global ie;
global eka;

% Reading control parameters
Param = Controller_Parameters;
kc = Param.kc;
ti = Param.ti;
td = Param.td;
ts = Param.ts; 


% Proportional term control action
ap = kc*ek;

% Integral term control action
ai = (kc/ti)*(ie+ek*ts);

% Derivative term control action
ad = kc*td*((ek-eka)/ts);

% Computing overall PID control action
uk = ap+ai+ad;

% Updating global parameters
ie = ie+ek*ts;
eka = ek;

end