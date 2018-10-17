% EE154 Project 1
% Written by Stephen Kemp
% 

close all;
clear all;
%% Set Constants

S = pi*0.1^2;
A = pi*0.005^2;
g = 9.81;
w = logspace(-6,-3,1000);

%% Set Variables and Functions

Y_star = linspace(0.05,0.15,30);
q_star = sqrt(2*A*g*Y_star); % Relationship from part b)

% From part a)
% df/dY
a = A^2*g./((S^2 - A^2)*sqrt(A^2*q_star./(S^2-A^2)^2 + 2*A*g*Y_star./(S^2-A^2))); 
% df/dq
b = S./(S^2-A^2) - A^2*q_star./((S^2-A^2)^2 .* sqrt(A^2*q_star./(S^2-A^2)^2 + 2*A*g*Y_star/(S^2-A^2)));

%% Generate Bode plots
figure(1)
for k = 1:length(a)
    G = tf([b(k)],[1, -a(k)]);
    bode(G,w);
    hold on;
end