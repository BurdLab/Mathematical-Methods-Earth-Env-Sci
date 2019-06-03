function area = SimpsonRule(fcn, a, b, N)
%% SIMPSONRULE Simpson's Rule
% AREA = SimpsonRule(FCN, A, B, N) evaluates the integral of the function FCN 
% between the limits A and B using N evenly spaced intervals  using Simpson's 
% rule.
% 
% *Example*
%%
% 
%   fcn = @(x) exp(x);
%   
%   N   = 50;
%   a   = 0;
%   b   = 4;
%   
%   integral_value = SimpsonRule(fcn, a, b, N);
%
%% 
% 
delta_x = (b - a)./N;
indx    = 0 : N;
x = a + indx*delta_x;
y = fcn(x);
area = y(1) + y(end) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2));
area = area * delta_x/3;
end