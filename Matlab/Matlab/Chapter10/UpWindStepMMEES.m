function f_new = UpWindStepMMEES(f_old, alpha)
%% UPWINDSTEPMMEES The Upwind Scheme
% F_NEW = UpWindStepMMEES(F_OLD, ALPHA) takes a single upwind step in the numerical 
% solution of an advective partial differential equation with F_OLD being the 
% solution from the previous step and ALPHA being the desired Courant number. 
% Need to allow room for the boundary conditions. Define the indices for
% the interior points of the grid
n_x = length(f_old);
in_pts = 2 : n_x - 1;
% Set storage
f_new = zeros(size(f_old));
% Update the interior points
f_new(in_pts) = (1-alpha) * f_old(in_pts) + alpha * f_old(in_pts-1);
% Update the boundary conditions
f_new([1 n_x]) = f_old(1) - alpha * (f_old(2) - f_old(end-1));
end