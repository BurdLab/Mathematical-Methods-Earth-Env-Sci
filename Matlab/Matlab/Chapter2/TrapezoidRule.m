function area = TrapezoidRule(fcn, a, b, N)
%% TRAPEZOIDRULE Trapezium Rule
% AREA = TrapezoidRule(FCN, A, B, N) evaluates the integral of the function 
% FCN between the limits A and B using N evenly spaced intervals  using the Trapezium 
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
%   integral_value = TrapezoidRule(fcn, a, b, N);
%
%% 
% 
delta_x = (b - a)./N;
indx    = 0 : N;
x = a + indx*delta_x;
y = fcn(x);
area = y(1) + y(end) + 2*sum(y(2:end-1));
area = area * delta_x/2;
end