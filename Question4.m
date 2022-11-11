clear
fun = @(x)100*(x(2)^2 - x(1))^2 + (1-x(1))^2;


x0 = [5 5];%input("please input a 2D vector");

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

options = optimoptions(@fminunc,'Display','iter');

[xy_opt,fval] = fminunc(fun,x0,options)



%figure,
% plot(xf(:,1),xf(:,2),'-o'); grid;
% 
% fun2 = @(x,y)100*(y^2 - x)^2 + (1-x)^2;
% x = -100:0.1:100;  % define range and mesh of x and y which will be shown in figure
% y = -100:0.1:100;
% [X, Y] = meshgrid(x, y);
% Z = reshape(fun2([X(:)'; Y(:)']), 100, 100);
% surf(X, Y, Z);
% figure;
% contourf(X, Y, fun2(X,Y));

  