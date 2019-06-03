function t = PhasePlaneMMEES(fcn, x_min, x_max, n_x, y_min, y_max, n_y)
%% PHASEPLANEMMEES Phase Plane 
% T = PhasePlaneMMEES(FCN, X_MIN, X_MAX, N_X, Y_MIN, Y_MAX, N_Y) calculates 
% and plots the phase plane for a two-dimensional system of first order differential 
% equations specified by the function FCN and defined over the range X_MIN to 
% X_MAX and Y_MIN toe Y_MAX with the numbers of points in each range given by 
% N_X and N_Y
% 
% *Example*
% 
% To plot the phase plane for the second order differential equation
% 
% $$\frac{d^2y}{dt^2} = -\sin(y)$$
%%
% 
%   fcn2 = @(t,u) [u(2); -sin(u(1))];
%   
%   x_min = -2;
%   x_max = 8;
%   y_min = -2;
%   y_max = 2;
%   n_x = 20;
%   n_y = 20;
%   
%   t = PhasePlaneMMEES(fcn2, x_min, x_max, n_x, y_min, y_max, n_y);
%
%% 
% 
% Create two linearly spaced vectors
x_vec = linspace(x_min, x_max, n_x);
y_vec = linspace(y_min, y_max, n_y);
% Create a grid
[x_grid, y_grid] = meshgrid(x_vec, y_vec);
% Create a direction field
u = zeros(size(x_grid));
v = zeros(size(x_grid));
% The arrows need to be at the starting point of each tracjectory (i.e.
% at t=0)
t = 0;
for i_point = 1 : numel(x_grid)
    
    dydt = fcn(t, [x_grid(i_point); y_grid(i_point)]);
    u(i_point) = dydt(1);
    v(i_point) = dydt(2);
    
end
figure
quiver(x_grid, y_grid, u, v, 'r')
xlabel('X')
ylabel('Y')
axis tight equal
end