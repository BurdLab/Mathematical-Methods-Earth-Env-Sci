function [slope, intercept] = TypeIIRegression(x, y)
%% TYPEIIREGRESSION Type II Regression
% [SLOPE, INTERCEPT] = TypeIIRegression(X, Y) performs a geometric mean type 
% II regression on the set of data (X,Y) and retruns the SLOPE and INTERCEPT of 
% the resulting straight line. 
% First calculate the number of data points
n_data = length(x);
% First we calculate the sums and mean values that we need for calculating
% the slopes and intercepts.
s_x  = sum(x);
s_y  = sum(y);
s_xx = sum(x.*x);
s_yy = sum(y.*y);
s_xy = sum(x.*y);
x_mean = s_x/n_data;
y_mean = s_y/n_data;
%
% First we calculate the slope of the regression of y as a function of x.
%
slope_yx     = (n_data*s_xy - s_x*s_y)/(n_data * s_xx - s_x*s_x);
%
% Now calculate the slope of the regression of x as a function of y
%
slope_xy     = (n_data*s_xy - s_x*s_y)/(n_data*s_yy - s_y*s_y);
slope_xy     = 1.0/slope_xy;
%
% Calculate the geometric mean of the two slopes, note that we need to
% account for the case when both individual slopes are negative
%
slope = sqrt(slope_xy * slope_yx);
if slope_xy < 0 && slope_yx < 0
    slope = -slope;
end
% 
% Calculate the intercept using the requirement that the regression line must pass
% through the mean of the data points
%
intercept = y_mean - slope*x_mean;
end