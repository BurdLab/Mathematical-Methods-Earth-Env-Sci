function x = CauchyRNGMMEES(a, b, n)
%% CAUCHYRNGMMEES Cauchy Random Number Generator.
% X = CauchyRNGMMEES(A, B, N) calculates N random numbers that obey a Cauchy 
% distribution with a half-width of B and median of A. 
% 
% *Example*
%%
% 
%   a = 0.0;
%   b = 1.0;
%   n = 20;
%   
%   x = CauchyRNGMMEES(a, b, n);
%
%% 
% 
x = a + b*tan(pi*rand([n,1])-0.5);
end