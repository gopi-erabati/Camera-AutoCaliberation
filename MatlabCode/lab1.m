clc, close all, clear all;

format long;

load('data.mat');

%% problem 2 Finding instrinsic parameters using Kruppas methods

%% 2.1 Clasical Method
x0 = [A(1,:) A(2,2:3)]; % initial value

OPTIONS = optimoptions('lsqnonlin', 'Algorithm','levenberg-marquardt','TolFun', 1e-32,'TolX',1e-32); %set optimiser options

% call the optimiser to minimise cost function
solClassical = lsqnonlin(@(x0) costFunctionKClassical(Fs,x0),x0,[],[],OPTIONS);

% store the optimised values to intrinsic parameter matrix
KClassical = [solClassical(1:3); 0 solClassical(4) solClassical(5); 0 0 1];

disp('******************************************************************');
disp('Calculated Intrinsic parameters (using Classical Kruppas method');
disp(KClassical)
disp('******************************************************************');

%% 2.2 Simplified method
% call the optimiser to minimise cost function
solSimp = lsqnonlin(@(x0) costFunctionKSimplified(Fs,x0),x0,[],[],OPTIONS); %set optimiser options

% store the optimised values to intrinsic parameter matrix
KSimp = [solSimp(1:3); 0 solSimp(4) solSimp(5); 0 0 1];

disp('******************************************************************');
disp('Calculated Intrinsic parameters (using Simplified Kruppas method');
disp(KSimp)
disp('******************************************************************');

%% problem 1 
% The Mendonça-Cipolla autocalibration method

% call the optimiser to minimise cost function
solMCipolla = lsqnonlin(@(x0) costFunctionMenCipolla(Fs,x0),x0,[],[],OPTIONS); %set optimiser options

% store the optimised values to intrinsic parameter matrix
KMCipolla = [solMCipolla(1:3); 0 solMCipolla(4) solMCipolla(5); 0 0 1];

disp('******************************************************************');
disp('Calculated Intrinsic parameters (using Mendonça-Cipolla method)');
disp(KMCipolla)
disp('******************************************************************');

%% problem 3
% The Dual Absolute Quadric
%Firstly find plane at infinity from MQM' ~ w (DUAL ABSOLUTE QUADRIC)

%normal to plane at infinty
normal = getNormalToPlaneAtInfinity(PPM,A);
normal = normal(1:3)';
disp('******************************************************************');
disp('Estimated normal to plane at infinity (using DAQ)');
disp(normal)
disp('******************************************************************');

%find HInf = [e21]F+e21*n'
HInf = computeHInf(Fs,normal); 

x0 = [A(1,:) A(2,2:3)]; % initial value
OPTIONS = optimoptions('lsqnonlin', 'Algorithm','levenberg-marquardt','TolFun', 1e-100,'TolX',1e-100, 'MaxIter', 1000); %set optimiser options
wDAQ = lsqnonlin(@(n)  costFunctionW( HInf, x0),x0,[],[],OPTIONS);
KDAC = [wDAQ(1:3); 0 wDAQ(4) wDAQ(5); 0 0 1];

disp('******************************************************************');
disp('Calculated Intrinsic parameters (using DAQ)');
disp(KDAC)
disp('******************************************************************');
