function [x, y] = ODEFiniteDiffMMEES(n_intervals)
%% ODEFINITEDIFFMMEES ODE Finite Differences
% [X, Y] = ODEFiniteDiffMMEES(N_INTERVALS) solves the boundary value problem
% 
% $$\frac{d^2y}{dx^2} + y(x) = 2, \qquad y(x=0)=1,\quad y(x=1)=0$$
% 
% using a finite difference scheme with N_INTERVALS intervals.
% Set up the  boundaries in x
x_left  = 0.0;
x_right = 1.0;
% Calculate delta_x and set up the x_points
delta_x = (x_right - x_left)/n_intervals;
x       = linspace(x_left, x_right, n_intervals+1);
%
% Create the matrix A. 
% 
% First create the diagonal elements
A      = -(2.0 - delta_x*delta_x) * eye(n_intervals+1);
A(1,1) = 1.0;
A(n_intervals+1, n_intervals+1) = 1.0;
% Now create the off-diagonal elements. Note that there are more efficient
% ways to do this, but we want  to keep things simple here.
for indx = 2 : n_intervals-1
    A(indx,indx-1) = 1.0;
    A(indx,indx+1) = 1.0;
end
%
% Now create the matrx b - i.e. the right hand side of the finite different
% equations
%
b = 2.0*delta_x^2 * ones(n_intervals+1,1);
b(1) = 1.0;
b(n_intervals+1) = 0.0;
% Solve the equations
y = A\b;
end