%% Control Performance Assessment (CPA)
% This is a template to evaluate controller performance assesment
%% Author
% Gilberto Reynoso Meza (ORCid 0000-0002-8392-6225)
% @gilreyme
% http://www.researchgate.net/profile/Gilberto_Reynoso-Meza
% Version: May/2019

%% Define process to control
global num;
global den;
global Delay;
% P(s) = [ num(s) / den(s) ] 
num = -4.5753;
den = [9.9926 1];

% Delay
Delay = 0.1530;

% Noise var
Noise = 0.0;

%% Controller initial conditions

InitializeController;

%% Experiment conditions

ReferenceProfile = [0 0;
    10 0;
    10 5;
    30 5;
    30 5;
    50 5;
    50 5;
    100 5];

%% Running simulation to collect data from CONTROL LOOP

sim('Model');

%% Ploting time response y(t), u(t), e(t)
subplot(3,1,1);
plot(y(:,1),y(:,2))
hold on
plot(r(:,1),r(:,2))
xlabel('Time (S)')
ylabel('Y(t) e R(t)')

subplot(3,1,2);
plot(u(:,1),u(:,2))
xlabel('Time (S)')
ylabel('U(t)')

subplot(3,1,3);
plot(e(:,1),e(:,2))
xlabel('Time (S)')
ylabel('E(t)')
%% Control performance assessment : stability

% Process transfer function
Ps = tf(num,den,'inputdelay',Delay);
Ps = pade(Ps);
% Controller transfer function
Param = Controller_Parameters;
kc = Param.kc;
ti = Param.ti;
td = Param.td;
ts = Param.ts;
Cs = tf([kc*ti*td kc*ti kc],[ti 0]);

% Sensor
Hs = 1;

% Closed loop
Fs = feedback(Cs*Ps,Hs);

% Pole analysis @ closed loop
Poles=eig(Fs);

%% Control performance assessment : dynamic response

IAE = sum(abs(r(:,2)-y(:,2)));

ISE = sum((r(:,2)-y(:,2)).^2);

ITAE = sum(abs((r(:,2)-y(:,2)).*r(:,1)));

ITSE = sum(r(:,1).*(r(:,2)-y(:,2)).^2);

TV = sum(u(:,2));

