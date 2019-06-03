function area = LeftPointRect(fcn, a, b, N)
%% LEFTPOINTRECT Left-point Rule 
% AREA = LeftPointRect(FCN, A, B, N) evaluates the integral of the function 
% FCN between the limits A and B using N evenly spaced intervals using the left-point 
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
%   integral_value = LeftPointRect(fcn, a, b, N);
%
%% 
% 
% Calculate the interval delta_x
delta_x = (b - a)./N;
indx = 1 : N;
% Calculate the function values at the left hand edges of the rectangles
x = a + (indx - 1)*delta_x;
y = fcn(x);
% Sum the areas. 
area = sum(y*delta_x);
end