function [slope, del_slope, intercept, del_intercept] = LeastSquMMEES(x, y, var_y)
%% LEASTSQUMMEES Least Squares Regression
% [SLOPE, DEL_SLOPE, INTERCEPT, DEL_INTERCEPT] = LeastSquMMEES(X, Y, VAR_Y) 
% calculates the SLOPE and INTERCEPT of the weighted least squares estimate best 
% fit straight line to a set of data points (X,Y) with variances on the Y values 
% of VAR_Y. The function also returns DEL_SLOPE and DEL_INTERCEPT, variances of 
% the estimates for the slope and intercept.
% 
% *Example:*
% 
% In the example below, the data points are x and y with v being the variance 
% in the y values. 
%%
% 
%   x = [0.1, 0.5, 1.2, 2.0, 3.2, 5.0]';
%   y = [1.409, 1.517, 2.228, 2.642, 3.512, 4.640]';
%   v = [0.054, 0.005, 0.019, 0.0232, 0.0248, 0.0450]';
%   
%   [slope, del_slope, intercept, del_intercept] = LeastSquMMEES(x, y, v)
%
%% 
% 
% Calculate the summed variables
s = sum(1./var_y.^2);
sx = sum(x./var_y.^2);
sxx = sum(x.^2./var_y.^2);
sy = sum(y./var_y.^2);
sxy = sum(x.*y./var_y.^2);
del = s*sxx - sx*sx;
% Calculate the slope and intercept
intercept = (sy*sxx - sxy*sx)/del;
slope     = (s*sxy - sx*sy)/del;
% Calculate the variances in the slope and intercept
del_intercept = sxx/del;
del_slope     = s/del;
end