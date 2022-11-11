function [fcn, Solution, A, Iterate] = newton_armijo(x, tau, beta, obj, g, epsilon)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    
  k=1;          % the index of iterations (search steps)
  axes('FontSize',20);
% Iteration procedure
  while  norm(g) > epsilon   % while||∇(f)|| > stop condition 
         fcn(k) = rosenbrock(x);
         d = -g;          % steepest descent direction
         a = 1;
         newobj = rosenbrock(x + a*d);
         %while (newobj-obj) > 0
         while newobj - (obj + a * beta .* g' .* d) > 0 %Armijo rule
                a = a*tau;  %amend alpha
                newobj = rosenbrock(x + a*d);
         end
   
         if (mod(k,100)==1)
               
               
               plot(x(1), x(2), 'ro', 'LineWidth', 15); grid,
               title(['Iteration = ',num2str(k)]);
               xlabel(['x_1 = ', num2str(x(1)), " \alpha = ", num2str(a)]);
               ylabel(['x_2 = ', num2str(x(2))]);
               
               pause(0.001);
         end
         x = x + a*d;
         obj = newobj;
         g =   rosenbrock_grad(x);
    
         A(k) = a;
         Solution(k,:)= x;
         Iterate(k) = k;
         k = k + 1;
         fprintf('Number of iteration is: %u\n ',k);
         fprintf('Value of alpha is: %u\n  ',a);
         fprintf('Function Value f(x1, x2)= %u\n', rosenbrock(x));
  end
% Iteration end  
A = A';
Iterate = Iterate';
x, k    % Display x and k
    
    

