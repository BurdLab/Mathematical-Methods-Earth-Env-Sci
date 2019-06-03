function area = MidpointRule(fcn, a, b, N)
%% MIDPOINTRULE Mid-point Rule
% AREA= MidpointRule(FCN, A, B, N) evaluates the integral of the function FCN 
% between the limits A and B using N evenly spaced intervals using the mid-point 
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
%   integral_value = MidPointRule(fcn, a, b, N);
%
%% 
% 
%
% Midpoint rule
delta_x = (b - a)./N;
indx    = 1 : N;
% Calculate the function values at the midpoints of the rectangles
x = a + (2*indx-1)*delta_x/2;
y = fcn(x);
% Sum the areas of the rectangles.
area = sum(y*delta_x);
end