clear
clc
% To describe the lateral vehicle dynamics, this example uses a _bicycle
% model_ with the following parameters:
%
% * |m| is the total vehicle mass (kg).
% * |Iz| is the yaw moment of inertia of the vehicle (mNs^2).
% * |Lf| is the longitudinal distance from the center of gravity to the
% front tires (m).
% * |Lr| is the longitudinal distance from center of gravity to the rear
% tires (m).
% * |Cf| is the cornering stiffness of the front tires (N/rad).
% * |Cr| is the cornering stiffness of the rear tires (N/rad).
%
m = 1575;
Iz = 2875;
Lf = 1.2;
Lr = 1.6;
Cf = 19000;
Cr = 33000;
% Specify the longitudinal velocity in m/s.
Vx = 10;

%%
% Specify a state-space model, |G(s)|, of the lateral vehicle dynamics.
A = [   0               1             0           0
        0    -(2*Cf+2*Cr)/m/Vx        0    -Vx-(2*Cf*Lf-2*Cr*Lr)/m/Vx;...
        0               0             0           1; ...
        0   -(2*Cf*Lf-2*Cr*Lr)/Iz/Vx  0    -(2*Cf*Lf^2+2*Cr*Lr^2)/Iz/Vx];
B = [0  2*Cf/m 0 2*Cf*Lf/Iz]';
C = eye(4);
D = zeros(4,1);
x_0 = [0 0 0 0]';
%CreaCurvatura;
load('BusSignals2.mat')
% load('qw.mat');
