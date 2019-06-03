function [x_values, y_values, scale_factor, dydx] = DirectionFieldMMMEES(fcn, x_range, del_x, y_range, del_y)
%% DIRECTIONFIELDMMMEES Direction Field 
% [X_VALUES, Y_VALUES, SCALE_FACTOR, DYDX] = DirectionFieldMMMEES(FCN, X_RANGE, 
% DEL_X, Y_RANGE, DEL_Y) calculates and plots the direction field for a first 
% order differential equation specified by the function FCN over the range X_RANGE 
% and Y_RANGE with grid intervals DEL_X and DEL_Y. 
% 
% *Example*
% 
% To calculate the direction field for the differential equation 
% 
% $$\frac{dy}{dx} = x^3 - 3xy$$
%%
% 
%   fcn = @(x,y) x.^3 - 3*x.*y;
%   
%   x_range = [0 2];
%   y_range = [0 2];
%   
%   del_x = 0.1;
%   del_y = 0.1;
%   
%   [x_values, y_values, scale_factor, dydx] = DirectionFieldMMMEES(@(x,y) x.^3 - 3*x.*y, x_range, del_x, y_range, del_y);
%
%% 
% % 
% 
% Generate vectors of x and y values
x_values = x_range(1) : del_x : x_range(2);
y_values = y_range(1) : del_y : y_range(2);
% Generate a set of gridpoints
[x_grid, y_grid] = meshgrid(x_values, y_values);
% Calculate the function at the gridpoints
dydx = fcn(x_grid, y_grid);
% Calculate a nice scaling factor for the arrows
scale_factor = 1./max(1/del_x, abs(dydx)./del_y)*0.35;
% Plot the direction field
figure
quiver(x_values, y_values, scale_factor, scale_factor.*dydx, 0, 'r')
hold on
quiver(x_values, y_values, -scale_factor, -scale_factor.*dydx, 0, 'r')
xlabel('X')
ylabel('Y')
axis tight equal
end