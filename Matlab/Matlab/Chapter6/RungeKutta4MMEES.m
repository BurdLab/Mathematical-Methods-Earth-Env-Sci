function [t, y] = RungeKutta4MMEES(derivs_fcn, t_init, t_final, y_init, n_steps)
%% RUNGEKUTTA4MMEES 4th Order Runge-Kutta Method
% [T, Y] = RungeKutta4MMEES(DERIVS_FCN, T_INIT, T_FINAL, Y_INIT, N_STEPS) uses 
% a 4th order Runge-Kutta routine with a constant step size to solve the system 
% of differnetial equations defined in the function DERIVS_FCN from T_INIT to 
% T_FINAL with initial conditions Y_INIT and using N_STEPS.
% 
% *Example*
% 
% To solve the differential equation 
% 
% $$\frac{dy}{dt} = t^2, \qquad y(t=0) = 1.0$$
% 
% we need a function 
%%
% 
%   function dydt = TestFcn1(t,y)
%   
%   dydt = t.^2;
%   
%   end
%
%% 
% and then we solve the equation in the following way
%%
% 
%   % Set the initial condition
%   t_init = 0.0;
%   y_init = 1.0;
%   
%   % Set the final time and the number of steps.
%   t_final = 10.0;
%   n_steps = 15;
%   
%   % Solve the equations using a 4th order Runge-Kutta routine
%   [t1rk, y1rk] = RungeKutta4MMEES(@TestFcn1, t_init, t_final, y_init, n_steps);
%   
%
%% 
% 
n_equations = size(y_init,2);
% Calculate the step size, the half step size, and step size divided by 6.
% We do this here instead of in the loop to reduce the number of
% computations.
h      = (t_final - t_init)/n_steps;
half_h = 0.5*h;
h_by_6 = h/6.0;
% Store the initial values as the first point
t = zeros(n_steps,1);
y = zeros(n_steps, n_equations);
t(1)   = t_init;
y(1,:) = y_init;
% The main loop
for i_step = 1 : n_steps
    t(i_step+1) = t(i_step) + h;      % Increment the time
    t_half = t(i_step) + half_h; % The half-step
    
    k1 = derivs_fcn(t(i_step), y(i_step,:));
    k2 = derivs_fcn(t_half, y(i_step,:) + half_h * k1);
    k3 = derivs_fcn(t_half, y(i_step,:) + half_h * k2);
    k4 = derivs_fcn(t(i_step+1), y(i_step,:) + h * k3);
    
    y(i_step+1,:) = y(i_step,:) + (k1 + k2 + k2 + k3 + k3 + k4) * h_by_6;
end
end