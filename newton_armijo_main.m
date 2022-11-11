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
set(gcf, 'position', [0, 0, 1920, 1080]);

n=2;          %  the number of variables;
              %  the initial point x0 = [0;0];

% Armijo stepsize rule parameters
tau  = 0.5; %select tau
epsilon = 1.0e-004; %stopping critereon
beta = 0.4; % select beta

obj = rosenbrock(x0);
g = rosenbrock_grad(x0);

[fcn_out, x, A, Iterate]= newton_armijo(x0, tau, beta, obj, g, epsilon);

xf = [x0';x];


figure;
plot(xf(:,1),xf(:,2),'-o'); grid;
title('FILL IN');
xlabel('x_1'),ylabel('x_2'),

figure;
plot(Iterate, A, '-'); grid;
title('FILL IN');
xlabel(["Iterations k: ", height(Iterate)]),ylabel("Step Size \alpha");


