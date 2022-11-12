%% Format
clc 
clear

format long


%% User Input

x0 = input("Input column/row vector: ");

% Error handling
if width(x0)==2 && height(x0)==1
    x0 = x0';
elseif width(x0)==1 && height(x0)==1
    fprintf('You have inputted a smaller vector than expected, rerun the program');
    return;
elseif width(x0)>2 || height(x0)>2
    fprintf('You have inputted a larger vector than expected, rerun the program');
    return;
end

%% Backtracking Line Search With Armijo Rule

set(0,'defaultAxesFontSize', 24);
%set(gcf, 'position', [0, 0, 1920, 1080]);

n=2;          %  the number of variables;
              %  the initial point x0 = [0;0];

% Armijo stepsize rule parameters
tau  = 0.5; %select tau
epsilon = 1.0e-004; %stopping critereon
beta = 0.4; % select beta

obj = rosenbrock(x0);
g = rosenbrock_grad(x0);



%% Backtracking-Armijo

% [fcn_out, x, A, Iterate]= backtrack_armijo(x0, tau, beta, obj, g, epsilon);
% xf = [x0';x];
% figure;
% plot(xf(:,1),xf(:,2),'-o'); grid;
% title('x_1, x_2 values During Optimisation');
% xlabel('x_1'),ylabel('x_2'),
% 
% figure;
% plot(Iterate, A, '-'); grid;
% title('Changes in \alpha During Optimisation');
% xlabel(["Iterations k: ", height(Iterate)]),ylabel("Step Size \alpha");

%% Newton-Armijo
% 
[fcn_out2, x2, A2, Iterate2]= newton_armijo(x0, tau, beta, obj, g, epsilon);
xf2 = [x0';x2];

figure;
plot(xf2(:,1),xf2(:,2),'-o'); grid;
title('x_1, x_2 values During Optimisation');
xlabel('x_1'),ylabel('x_2'),

figure;
plot(Iterate2, A2, '-'); grid;
title('Changes in \alpha During Optimisation');
xlabel(["Iterations k: ", height(Iterate2)]),ylabel("Step Size \alpha");