function [fcn, Solution, A, Iterate] = newton_armijo(x, tau, beta, obj, g, epsilon)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

  a = 1;
  k = 1;          % the index of iterations (search steps)
% Iteration procedure
  while  norm(g) > epsilon   % while||∇(f)|| > stop condition 
         fcn(k) = rosenbrock(x);
         d = -inv(rosenbrock_hessian(x))*rosenbrock_grad(x);% Newtons Direction
         a = 1; 
         newobj = rosenbrock(x + a*d);
         while newobj - (obj + a * beta .* g' .* d) > 0 %Armijo rule
                a = a*tau;  %amend alpha
                newobj = rosenbrock(x + a*d);
         end
         x = x + a*d;
         obj = newobj;
         g =   rosenbrock_grad(x);
         
         A(k) = a; %store values
         Solution(k,:)= x;
         Iterate(k) = k;
         k = k + 1;
         fprintf('Number of iteration is: %u\n ',k); %output values
         fprintf('Value of alpha is: %u\n  ',a);
         fprintf('Function Value f(x1, x2)= %u\n', rosenbrock(x));
  end
% Iteration end  
A = A';
Iterate = Iterate';
x, k    % Display x and k
    
    

