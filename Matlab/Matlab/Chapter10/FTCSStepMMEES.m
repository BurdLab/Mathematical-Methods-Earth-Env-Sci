function f_new = FTCSStepMMEES(f_old, alpha)
%% FTCSSTEPMMEES FTCS for the Advection Equation
% F_NEW = FTCSStepMMEES(F_OLD, ALPHA) calculates a singlel time step in the 
% solution of an advection equation using the Forward Time Centered Space scheme. 
% The solution at the previous step is F_OLD, the new solution is F_NEW and ALPHA 
% is the Courant number. 
% Need to allow room for the boundary conditions
n_x = length(f_old);
in_pts = 2 : n_x - 1;
% Update the interior points
f_new(in_pts) = f_old(in_pts) - 0.5 * alpha * (f_old(in_pts+1) - f_old(in_pts-1));
% Update the boundary conditions using periodic boundary conditions
f_new([1 n_x]) = f_old(1) - 0.5 * alpha * (f_old(2) - f_old(end-1));
end