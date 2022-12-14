clear
fun = @(x)100*(x(2)^2 - x(1))^2 + (1-x(1))^2;


x0 = input("please input a 2D vector");

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
%to include optimality tolerance
%, 'OptimalityTolerance', 1.0e-004
options = optimoptions(@fminunc,'Display','iter', 'PlotFcn', 'optimplotfirstorderopt');

[xy_opt,fval, exitflag, output] = fminunc(fun,x0,options)

% figure,
% plot(output.iterations(:),output.funcCount(:),'-o'); grid;


  