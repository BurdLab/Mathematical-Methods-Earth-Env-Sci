function dydt = LorenzEqns(t, y, s, b, r)
%% LORENZEQNS The Lorenz Equations
% DYDT= LorenzEqns(t\T, Y, S, B, R) returns a vector DYDT containing the right 
% hand sides of the differential equations for the Lorenz System 
% 
% $$\frac{dx}{dt} = \sigma(y-x), \qquad \frac{dy}{dt} = x(r-z) - y, \qquad \frac{dz}{dt} 
% = xy - bz$$
% 
% where the parameters $\sigma,\,b,\,r$ are the repreented by the variables 
% |S, B, R.|
dydt = zeros(size(y));
dydt(1) =  s * (y(2) - y(1));
dydt(2) = r*y(1) - y(2) - y(1)*y(3);
dydt(3) = y(1)*y(2) - b*y(3);
end