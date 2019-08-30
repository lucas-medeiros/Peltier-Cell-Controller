%% Control system for a Peltier cell model
% This script implements a test in a Peltier cell device. It requires the 
% following scripts:
%
% PM_dX_Peltier : ODE system (encrypted) describing Peltier cell dynamics.
% Peltier_Block : Script to create a simulink block using PM_dX_Peltier.
% Peltier_OpenLoop_Simulink : Simulink file to simulate a Peltier cell.
%
% PM_dX_Peltier implements a Peltier cell model as detailed in:
%
% Huilcapi, V., Herrero, J. M., Blasco, X., & Martínez-Iranzo, M. (2017). 
% Non-linear identification of a peltier cell model using evolutionary 
% multi-objective optimization. IFAC-PapersOnLine, 50(1), 4448-4453.
%
%% Author
% Gilberto Reynoso Meza (ORCid 0000-0002-8392-6225)
% @gilreyme
% http://www.researchgate.net/profile/Gilberto_Reynoso-Meza
% Version: 30/05/2019
%
%% Plot features

close all;
clear all;
% Change default axes fonts.
set(0,'DefaultAxesFontName', 'Arial')
set(0,'DefaultAxesFontSize', 16)
% Change default text fonts.
set(0,'DefaultAxesFontName', 'Arial')
set(0, 'DefaultAxesFontWeight','Bold')
set(0,'DefaultTextFontSize', 16)


%% Running OPEN LOOP simulation

InputProfile=[0 0;
    10 0;
    10 5;
    30 5;
    30 5;
    50 5;
    50 5;
    100 5];

sim('Peltier_OpenLoop_Simulink');
figure(1);

%% Plotting time response

subplot(211);
plot(OutputRead(:,1),OutputRead(:,2),'b','linewidth',4);
ylabel('Output: Temperature [^oC]');
ylim([-15 30]);
grid on;

subplot(212);
plot(Input(:,1),Input(:,2),'color',[0, 0.5, 0],'linewidth',4);
xlabel('Time [s]');
ylabel('Input : Voltage [V]');
ylim([-0.1 6.1]);
grid on;