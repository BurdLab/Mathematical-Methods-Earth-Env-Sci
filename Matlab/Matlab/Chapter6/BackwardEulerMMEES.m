function [t, y] = BackwardEulerMMEES(derivs_fcn, t_init, t_final, y_init, n_steps)
%% BACKWARDEULERMMEES Backwards Euler Method
% [T, Y] = BackwardEulerMMEES(DERIV_FCN,  T_INIT, T_FINAL, Y_INIT, N_STEPS) 
% numerically integrates the ordinary differnetial equation given by DERIVS_FCN 
% from T_INIT to T_FINAL using N_STEPS given the initial condition Y_INIT. The 
% function retuns the solution Y a the time points T. 
% 
% *NOTE: This function uses the Matlab Optimization Toolbox function |fsolve| 
% to solve the implicit equations. *
% 
% Example
% 
% 
delta_t = (t_final - t_init) / n_steps;
n_eqns  = length(y_init);
% Set up storage for solution: note we add the one because we fill the
% first row with the initial conditions.
t = zeros(n_steps+1, 1);
y = zeros(n_steps+1, n_eqns);
% Fill the first row of the output variables with the initial conditions.
t(1)   = t_init;
y(1,:) = y_init';
% Set options for the optimization solver
options = optimoptions('fsolve', 'Display', 'none', 'FiniteDifferenceType', 'central');
for i_step = 2 : n_steps+1
    t_new = t(i_step-1) + delta_t;
    y_old = y(i_step-1, :);
    y_new = fsolve(@(y) y - delta_t * derivs_fcn(t_new,y) - y_old, y_old, options);
    t(i_step)   = t_new;
    y(i_step,:) = y_new;
end
end