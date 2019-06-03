function [t, y] = ForwardEulerMMEES(derivs_fcn, t_init, t_final, y_init, n_steps)
%% FORWARDEULERMMEES Forward Euler Method
% [T, Y] = ForwardEulerMMEES(DERIVS_FC, T_INIT, T_FINAL, Y_INIT, N_STEPS) numerically 
% integrates the ordinary differnetial equation given by DERIVS_FCN from T_INIT 
% to T_FINAL using N_STEPS given the initial condition Y_INIT. The function retuns 
% the solution Y a the time points T
% 
% *Example*
% 
% First, write a Matlab function file containing the derivatives. For example, 
% to integrate the differential equation
% 
% $$\frac{dy}{dt} = t^2$$
% 
% we would write a function
%%
% 
%   function dydt = ODEFunction1(t, y)
%   
%   dydt = t.^2;
%
%% 
% and store it in a file |ODEFuntion1.| Then we can integrate the function using 
% the following commands
%%
% 
%   t_init = 0.0;
%   y_init = 1.0;
%   
%   t_final = 10.0;
%   n_steps = 15;
%   
%   [t1e, y1e]   = ForwardEuler('ODEFunction1', t_init, t_final, y_init, n_steps);
%
%% 
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
% Loop through calculating the Forward Euler solution and storing y and t.
for i_step = 2 : n_steps+1
    dydt = feval(derivs_fcn, t(i_step-1), y(i_step-1, :));
    y(i_step,:) = y(i_step-1,:) + delta_t * dydt;
    t(i_step)   = t(i_step-1) + delta_t;
end
end