function area = RightPointRect(fcn, a, b, N)
%% RIGHTPOINTRECT Right-Point Rule
% AREA = RightPointRect(FCN, A, B, N) evaluates the integral of the function 
% FCN between the limits A and B using N evenly spaced intervals using the right-point 
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
%   integral_value = RightPointRect(fcn, a, b, N);
%
%% 
% 
delta_x = (b - a)./N;
indx    = 1 : N;
% Calculate the function values at the left hand edges of the rectangles
x = a + indx*delta_x;
y = fcn(x);
% Sum the areas. 
area = sum(y*delta_x);
end