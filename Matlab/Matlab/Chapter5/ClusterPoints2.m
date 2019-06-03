function [x_point, y_point, n_point] = ClusterPoints2(a, b)
%% CLUSTERPOINTS2 Cluster Points 2
% [X_POINT, Y_POINT, N_POINT] = ClusterPoints2(A, B) generates the (X_POINT, 
% Y_POINT) coordinates of a spatially random distribution set of points on a square 
% grid from A to B that are clumped using an avoidance algorithm. THis is done 
% by defining a finer grid on the square and only placing a point randomly within 
% one of the finer grid cells if a) a randomly geneated number eceeds a preset 
% threshold and b) if there is no occupied cell in any of the 8 surrounding finer 
% grid cells. 
threshold = 0.992;
x_point = [];
y_point = [];
% Split the square into a smaller set of grids
n_grid = 500;
x = linspace(a, b, n_grid);
y = linspace(a, b, n_grid);
n_x = length(x)-1;
n_y = length(y)-1;
[x_grid, y_grid] = meshgrid(x, y);
% Set up a matrix to say whether we have a point in a grid cell or not
occupied_cell = zeros(n_y, n_y);
n_point = 0;
% Loop through the edge cells and randomly put a point in each cell
for i_cell = 1 : n_x
    
    if rand(1,1) > threshold
        n_point = n_point + 1;
        x_point(n_point) = x(i_cell) + (x(i_cell+1) - x(i_cell))*rand(1,1);
        y_point(n_point) = y(1) + (y(2) - y(1))*rand(1,1);
        occupied_cell(n_x,1) = 1;
    end
    
    if rand(1,1) > threshold
        n_point = n_point + 1;
        x_point(n_point) = x(i_cell) + (x(i_cell+1) - x(i_cell))*rand(1,1);
        y_point(n_point) = y(n_y) + (y(n_y+1) - y(n_y))*rand(1,1);
        occupied_cell(n_x,n_y+1) = 1;
    end
    
end
for j_cell = 1 : n_y
    
    if rand(1,1) > threshold
        n_point = n_point + 1;
        x_point(n_point) = x(1) + (x(2) - x(1))*rand(1,1);
        y_point(n_point) = y(j_cell) + (y(j_cell+1) - y(j_cell))*rand(1,1);
        occupied_cell(1,n_y) = 1;
    end
    
    if rand(1,1) > threshold
        n_point = n_point + 1;
        x_point(n_point) = x(n_x) + (x(n_x+1) - x(n_x))*rand(1,1);
        y_point(n_point) = y(j_cell) + (y(j_cell+1+1) - y(j_cell))*rand(1,1);
        occupied_cell(n_x+1,n_y) = 1;
    end
    
end
% Now work through the interior cells and if neighboring cells are
% occupied, leave empty
for i_cell = 2 : n_x-1
    for j_cell = 2 : n_y-1
        
        tmp = occupied_cell(i_cell-1 : i_cell+1, j_cell-1 : j_cell + 1);
        tmp = reshape(tmp, 9, 1);
        
        if (sum(tmp) < 0.1)
            if rand(1,1) > threshold
               n_point = n_point + 1;
               x_point(n_point) = x(i_cell) + (x(i_cell+1) - x(i_cell))*rand(1,1);
               y_point(n_point) = y(j_cell) + (y(j_cell+1) - y(j_cell))*rand(1,1);
               occupied_cell(i_cell, j_cell) = 1;    
            end
        end
    end
end
end