function u_new = LaxWendroffStepMMEES(u_old, alpha)
%% LAXWENDROFFSTEPMMEES Lax-Wendroff Step
% U_NEW = LaxWendroffStepMMEES(U_OLD, ALPHA) calculate the soution of the 1-dimensional 
% advection equation using the Lax-Wendroff scheme. The solution U_NEW at the 
% new time is calculated in terms of the solution U_OLD at the previous time step 
% and the Courant number, ALPHA.
% 
% Detailed explanation of this function.
% Do some book keeping
n_x = length(u_old);
in_pts = 2 : n_x - 1; % These are the indices of the interior points.
% Pre-allocate storage
u_new = zeros(size(u_old));
% Update the interior points
u_new(in_pts) = u_old(in_pts) - 0.5*alpha*(u_old(in_pts+1)-u_old(in_pts-1)) + 0.5*alpha*alpha*(u_old(in_pts+1)- 2.0*u_old(in_pts)+u_old(in_pts-1)); 
% Update the boundary conditions
u_new([1 n_x]) = u_old(1) - 0.5*alpha*(u_old(2)-u_old(end-1)) + 0.5*alpha*alpha*(u_old(2)- 2.0*u_old(1)+u_old(end-1));
end