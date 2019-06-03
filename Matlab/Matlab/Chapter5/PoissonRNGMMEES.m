function x = PoissonRNGMMEES(lambda, n)
%% POISSONRNGMMEES Poisson Random Number Generator
% X = PoissonRNGMMEES(LAMBDA, N) calculates N random numbers satisfying a Poisson 
% distribution with mean value of LAMBDA. The algorithm is based on one given 
% by Dirk Kroese (https://people.smp.uq.edu.au/DirkKroese/mccourse.pdf). 
% 
% *Example*
%%
% 
%   lambda   = 2;
%   n_values = 20;
%   
%   x = PpoissonRNGMMEES(lambda, n_values);
%
%% 
% 
% Preallocate the size of the vector for the output
x = zeros(n,1);
% Set the initial values
i_count = 1;    % Initialize counter
% Loop through hte number of required values
for i_value = 1 : n
    
    j_count = 0;     % Initialize counter
    tmp     = rand;  % Initialize the temporary variable
    
    while tmp >= exp(-lambda)
        tmp = tmp*rand;
        j_count = j_count + 1;
    end
    
    x(i_value) = j_count;
end
end