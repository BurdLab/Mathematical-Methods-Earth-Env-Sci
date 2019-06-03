function f_new = FTCSStepDiffMMEES(f_old, alpha)
%% FTCSSTEPDIFFMMEES FTCS for diffusion
% F_NEW = FTCSStepMMEES(F_OLD, ALPHA) calculates a single time step in the solution 
% of an diffusion equation using the Forward Time Centered Space scheme. The solution 
% at the previous step is F_OLD, the new solution is F_NEW and ALPHA is the Courant 
% number. 
% Determine the number of points.
n_x = length(f_old);
% Set up indices for the interior and boundary points
in_pts = 2 : n_x - 1;
bndry_pts = [1 n_x];
% Update the interior points
f_new(in_pts) = alpha*f_old(in_pts-1) + (1.0 - 2.0*alpha)*f_old(in_pts) + alpha*f_old(in_pts+1);
% Now update the boundaries
f_new(bndry_pts) = f_old(bndry_pts);
end