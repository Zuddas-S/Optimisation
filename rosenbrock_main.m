clc,
clear,

c = 100;                             % define parameter first;
x0=[2;-2];                            % initial value;  
options = optimset('LargeScale','off','GradObj','off'); 
                                     % indicate search mode;
%[x,f,ExitFlag,Infor] = fminunc('myfun01',x0, optimset,c)
[x,f,ExitFlag,Infor] = fminunc(@(x)rosenbrock_function(x,c),x0, options)