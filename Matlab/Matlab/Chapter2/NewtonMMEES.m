function x = NewtonMMEES(f,fderiv,x_init,n_iter)
%% NEWTONMMEES Find the solution to a nonlinear equation using Newton's Method
% X = NewtonMMEES(F, FDERIV, X_INIT, N_ITER) calculates the solution to the 
% equation given by the function F and its first derivative FDERIV starting with 
% the initial guess X_INIT and using N_ITER iterations. The function returns a 
% vector of length N_ITER that contains the estimate of the solution at each iteration. 
% 
% *Examples*
%%
% 
%   f      = @(x) x^5 - 5.0;
%   fderiv = @(x) 5.0*x^4;
%   x_init = 2.0;
%   n_iter = 20;
%   
%   x = NewtonMMEES(f, fderiv, x_init, n_iter);
%
%% 
% 
% The next lines are housekeeping to set up a vector for the value of
% the solution found at each iteration, and we put our initial guess in the
% first element of the vector
x    = zeros(n_iter,1);
x(1) = x_init;
% Now we perform the iterations using a loop, we calculate the next
% approximation to the solution using the previously found value of x.
for i_iter = 2 : n_iter
    x(i_iter) = x(i_iter-1) - f(x(i_iter-1))/fderiv(x(i_iter-1));
end
end