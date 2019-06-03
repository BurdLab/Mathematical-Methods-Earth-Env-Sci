function u_new = LaxFriedrichsStepMMEES(u_old, alpha)
%% LAXFRIEDRICHSSTEPMMEES Lax-Friedrichs Step
% U_NEW= LaxFriedrichsStepMMEES(U_OLD, ALPHA) calculates a single time step 
% of the 1 dimesional advection equation using the Lax-Friedrich algorithm. The 
% solution at the previous time step is given by U_OLD, and at the new time is 
% U_NEW. ALPHA is the Courant number. 
% Need to allow room for the boundary conditions
n_x = length(u_old);
in_pts = 2 : n_x - 1;
% Set storage
u_new = zeros(size(u_old));
% Update the interior points
u_new(in_pts) = 0.5 * ( u_old(in_pts + 1) + u_old(in_pts-1)) - 0.5*alpha*(u_old(in_pts + 1) - u_old(in_pts-1));
% Update the boundary conditions
u_new([1 n_x]) = 0.5 * ( u_old(2) + u_old(end-1)) - 0.5*alpha*(u_old(2) - u_old(end-1));
end