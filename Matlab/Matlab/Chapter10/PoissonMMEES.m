function [x, y, u] = PoissonMMEES(rhs_func, a, b, n_grid)
%% POISSONMMEES The Poisson Equation Solver
% [X, Y, U] = PoissonMMEES(RHS_FUNC, A, B, N_GRID) solves the 2-dimensional 
% Poisson equation on a square grid with Dirichlet boundary conditions where the 
% solution on all boundaries equals 1. The solution on the grid (X,Y) is returned 
% in the matrix U. The right hand side of the Poisson Equation is given by the 
% function RHS_FUNC, and A and B are the minimum and maximum coordinates of the 
% grid and N_GRID is the required number of grid points in each direction. 
%
% Set up the grid:
%
% Here we define a grid that will include the boundary points, though we
% could have defined the grid in different ways.
% Determing the grid spacing
grid_spacing = (b -a)/(n_grid + 1);
% Set up a grid that includes the boundary points
[x,y]        = meshgrid(a : grid_spacing : b);
% 
% Set up the boundary points using Dirichlet boundary conditions
%
% Preallocate storage
u_boundary = zeros(n_grid, n_grid);
% Define the left and right boundaries
u_boundary(:,1)      = ones(n_grid,1);
u_boundary(:,n_grid) = ones(n_grid,1);
% Define the bottom and top boundaries
u_boundary(1,1:n_grid)      = u_boundary(1, 1:n_grid) + ones(1,n_grid);
u_boundary(n_grid,1:n_grid) = u_boundary(n_grid, 1:n_grid) + ones(1,n_grid);
% Now, according to Equation (10.84) we need to re-order these into a
% single column vector
u_boundary = (1.0/grid_spacing^2) * reshape(u_boundary, n_grid*n_grid, 1);
%
% Evaluate the right hand side of the Poisson Equation
%
f_rhs = rhs_func(x(2:n_grid+1, 2:n_grid+1), y(2:n_grid+1,2:n_grid+1));
f_rhs = reshape(f_rhs, n_grid*n_grid, 1);
% 
% Now create the matrices of the partial derivatives. Here, we've spilt the
% matrix from equation (10.84) into its separate parts for the two
% derivatives because it makes it more efficient to calculate for large
% matrices - we can use some efficient built-in routines for calculating
% matrices of specific shapes rather than create the matrices from scrratch
% ourselves. THe end result when we come to solve the matrix equations will
% be the same because we will add these matrices together.
%
indx = [-2;1;zeros(n_grid-2,1)];
d_2_x = (1/grid_spacing^2)*kron(toeplitz(indx,indx), eye(n_grid));
d_2_y = (1/grid_spacing^2)*kron(eye(n_grid), toeplitz(indx,indx));
%
% Now we can solve the matrix equations using the backslash operator, and
% then reshape the resulting column vector into a grid
%
u = (d_2_x + d_2_y)\(f_rhs - u_boundary);
u = reshape(u, n_grid, n_grid);
% Now we need to add back in the boundary points
u = [[ones(1,n_grid+2)]; ones(n_grid,1) u ones(n_grid,1); ones(1,n_grid+2)];
%u = [[bv_func(x(1,1:n_grid+2), y(1,1:n_grid+2))]; ...
%     [bv_func(x(2:n_grid+1,1), y(2:n_grid+1,1))] u [bv_func(x(2:n_grid+1,n_grid+2), y(2:n_grid+1,n_grid+2))]; ...
%     [bv_func(x(n_grid+2,1:n_grid+2), y(n_grid+2,1:n_grid+2))]];
end