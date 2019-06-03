function df = TestFcn2(x, y)
%% TESTFCN2 Test Function 2
% DF = TestFcn2(X, Y) returns the derivatives used for demonstrating the shooting 
% method. The differential equation is 
% 
% $$y(x)\frac{d^2y}{dx^2} + \left(\frac{dy}{dx}\right)^2 = 0, \qquad y(x=0) 
% = 1,\quad y(x=1) = 2$$
% 
% and the routine calculates 
% 
% $$\frac{dy_1}{dx} = y_2, \qquad \frac{dy_2}{dx} = -\frac{y_2^2}{y_1}$$
% 
% 
df = [y(2); -y(2)*y(2)/y(1)];
end