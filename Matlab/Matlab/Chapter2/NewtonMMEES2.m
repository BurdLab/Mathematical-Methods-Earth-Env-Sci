function x = NewtonMMEES2(f,fderiv,x_init,max_iter, tolerance)
%% NEWTONMMEES2 Find the solution to a nonlinear equation using Newton's Method
% X = NewtonMMEES(F, FDERIV, X_INIT, MAX_ITER, TOLERANCE) calculates the solution 
% to the equation given by the function F and its first derivative FDERIV starting 
% with the initial guess X_INIT and using a maximum of MAX_ITER iterations. If 
% a a solution is found within the specified TOLERANCE before MAX_ITER iterations 
% have been completed, then the routine returns that value without completing 
% the maximum number of iterations. 
% 
% *Examples*
%%
% 
%   f      = @(x) x^5 - 5.0;
%   fderiv = @(x) 5.0*x^4;
%   x_init = 2.0;
%   
%   max_iter  = 100;
%   tolerance = 1.0e-06;
%   
%   x = NewtonMMEES2(f, fderiv, x_init, max_iter, tolerance);
%
%% 
% 
% The next lines are housekeeping to set up a vector for the value of
% the solution found at each iteration, and we put our initial guess in the
% first element of the vector
x    = zeros(max_iter,1);
x(1) = x_init;
i_iter = 2;    % Note we start on the second iteration, the first being the initial guess
while (i_iter <= max_iter)
    x(i_iter) = x(i_iter-1) - f(x(i_iter-1))/fderiv(x(i_iter-1));
    if abs(x(i_iter) - x(i_iter-1)) <= tolerance
        break;
    end
    
    i_iter = i_iter + 1;
end
if (i_iter > max_iter)
    disp('No solution found within specified tolerance and within Maximum number of iterations')
end
%% 
%