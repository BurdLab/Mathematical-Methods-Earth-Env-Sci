%% Numerical Integration
% Most integrals cannot be evaluated analytically, and so we need to resort 
% to numerical methods to evaluate them. We have written Matlab functions to calculate 
% the integral of a given function using the different methods explained in the 
% text; we've used functions because a lot of the code is very similar for all 
% the methods, and so modularizing the code in this way is a good organizational 
% tool. 
%% Left-point, Right-point, and Midpoint Rules
% We came across two different rules in the text, the left-point rule and the 
% right-point rule. These rules basically sum the areas of rectangles, with the 
% only difference being whether we work from the left hand edge of the rectangles 
% or the right hand edge. In addition, we saw that the midpoint rule uses the 
% midrpoint of the upper edge to calculate the function value in the integration. 
% 
% We can look at the relative accuracy of these different methods by evaluating 
% an integral we know, for example,
% 
% $$I = \int_0^4 x^2\, dx = \frac{64}{3}$$

fcn = @(x) x.^2;

a = 0;
b = 4;
N = 100;

exact_value = 64.0/3.0;

lp_value = LeftPointRect(fcn, a, b, N);
rp_value = RightPointRect(fcn, a, b, N);
mp_value = MidpointRule(fcn, a, b, N);

disp(['Exact Value = ' num2str(exact_value)])
disp(['Left-Point Value = ' num2str(lp_value)])
disp(['Right-Point Value = ' num2str(rp_value)])
disp(['MidPoint Value = ' num2str(mp_value)])

%% Trapezium Rule
% The Trapezium Rule approximates the function being integrated by joining successive 
% points on the curve by straight lines and summing the areas of the resulting 
% trapeziums. 

trap_value = TrapezoidRule(fcn, a, b, N);

disp(['Trapezoid Rule Value = ' num2str(trap_value)])
%% Simpson's Rule
% Simpson's Rule uses a qadratic curve to approximate the function; this allows 
% for a more accurate answer with less intervals. 

% Create a vector containing different values of N to try
N = [2 4 8 10];

% Use a loop to loop through the different values of N, calculate the value
% of the integral, and print it out
for i_intervals = 1 : length(N)
    
    simpson_value = SimpsonRule(fcn, a, b, N(i_intervals));
    
    disp(['Using ' num2str(N(i_intervals)) ' intervals, Simpsons Rule Value = ' num2str(simpson_value)])
    
end

%% 
% _*Exercise: *Why does Simpson's Rule for the integral of x squared give an 
% exact answer?_
% 
% _*Exercise:* Compare the values of the integral calculated using these different 
% methods for different functions (e.g. an exponential function, a trigonometric 
% function, or a function involving the multiplication of a polynomial and an 
% exponential). _