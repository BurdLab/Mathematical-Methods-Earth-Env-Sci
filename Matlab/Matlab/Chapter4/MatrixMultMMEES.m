function c = MatrixMultMMEES(a,b)
%% MATRIXMULTMMEES Matrix Multipllication
% C = MatrixMultMMEES(A,B) multiplies the two matrices A and B to form the product 
% AB which is returned in the variable C. The approach used here is to use a simple 
% loop to calculate the required terms. 
% 
% *Example*
%%
% 
%   a = [1 2 ; 3 4];
%   b = [4 3 ; 2 1];
%   
%   c = MatrixMultMMEES(a,b);
%
%% 
% 
% First we have to find the sizes of the two matrices
[rows_a, cols_a] = size(a);
[rows_b, cols_b] = size(b);
% If the matrices are compatible, then form the product ab. If they are
% not, then give an error message
if cols_a == rows_b
    
    c = zeros(rows_a, cols_b);
    
    for i_row = 1 : rows_a
        for j_col = 1 : cols_b
            tmp_sum = 0.0;
            for k = 1 : cols_a
                tmp_sum = tmp_sum + a(i_row, k) * b(k, j_col);
            end
            c(i_row, j_col) = tmp_sum;
        end
    end
else
    error('The sizes of the two matrices are not conformable')
end