clc; clear all,

% Maximise    Z = 3*x1 + 5*x2
% Subject to
%               x1         <= 4
%                     2*x2 <= 12
%             3*x1 +  2*x2 <= 18
%               x1 >=0, x2 >= 0
%

c=[-3, -5];

A=[1, 0
   0, 2
   3, 2
   ];
   
b=[4, 12, 18]';

Aeq = [];
beq =[];
lb =[0,0];
x0=[1,30];

[x,fval,exitflag,output] = linprog(c,A,b,Aeq,beq,lb,[],[],optimset('Display','iter'));

x