function [x, y] = ShootingMMEES(deriv_fcn, x_left, x_right, y_left, y_right, y_guess1, y_guess2, tolerance)
%% SHOOTINGMMEES Shooting Method
% [X, Y] = ShootingMMEES(DERIV_FCN, X_LEFT, X_RIGHT, Y_LEFT, Y_RIGHT, Y_GUESS1, 
% Y_GUESS2, TOLERANCE) solves the boundary value ordinary differential equation 
% problem where the equation is given in DERIV_FCN, the left and right boundary 
% conditions on the solution are given by X_LEFT, Y_LEFT, X_RIGHT, Y_RIGHT , the 
% initial guesses are Y_GUESS1, Y_GUESS2, and the specified tolerance of the solution 
% is TOLERANCE. This method uses the secant method and Matlab's built in ode solveers. 
% 
% Detailed explanation of this function.
% Specify the maximum count allowed in the iteration. This is to prevent
% cases where a solution takes forever to find
max_count = 1000;
% Start by integrating the odes as an initial value problem. Do this twice
% because we need to solutions for the secant method. We need to know the
% initial and final values of x.
x_span = [x_left x_right];
% Set up the initial values. This assumes we are given the initial y value
% at the left boundary and we guess the value of the first derivative at
% the left boundary
y_init1 = [y_left; y_guess1];
y_init2 = [y_left; y_guess2];
% Use Matlab's built-in ode solvers to find the solution at the right
% boundary for the two initial guesses.
[x1, y1] = ode45(deriv_fcn, x_span, y_init1);
[x2, y2] = ode45(deriv_fcn, x_span, y_init2);
% Set the start of the iteration
i_count = 1;
% Calculate the differences between the solutions using the guesses and the
% actual right boundary condition 
g1 = y1(end,1) - y_right;
g2 = y2(end,1) - y_right;
% Iterate this procedure until a solution is achieved within the required
% tolerance, or until max_count is achieved in which case post an error. 
while (abs(y_guess2 - y_guess1) > tolerance)
    
    % Calculate the new guess2 using the secant method, remembering to save
    % it for use later as the new guess1.
    tmp = y_guess2;
    y_guess2 = y_guess1 - (y_guess1 - y_guess2)/(g1 - g2) * g1;
    y_guess1 = tmp;
    
    y_init1 = [y_left; y_guess1];
    y_init2 = [y_left; y_guess2];
    
    [x1, y1] = ode45(deriv_fcn, x_span, y_init1);
    [x2, y2] = ode45(deriv_fcn, x_span, y_init2);
    
    g1 = y1(end,1) - y_right;
    g2 = y2(end,1) - y_right;
    
    % Increment the iteration counter
    i_count = i_count + 1;
    
    % Make sure that we don't have to wait forever for a solution, we can
    % only drink so many cups of tea whilst waiting.
    if i_count > max_count
        error('Tolerance not achieved')
    end
    
end
% Return the final solution. 
x = x2;
y = y2;
end