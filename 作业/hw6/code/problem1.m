%% A simple example

% The graph has 6 vertices numbered 1,2,3,4,5,6
totalVertices = 6; 

% The edges of the graph are listed below
edges = [2 3; 1 3; 3 4; 4 6; 4 5]; 

% The artist specifies the positions of vertices 1,2,5,6
constrainedVertices = [1 2 5 6];

% The positions of the constrained vertices are listed here, one per row
constraints = [0 0; 0 1; 2.15 0; 2 1.5];

% The positions of vertices 3,4 are to be computed using our algorithm
unconstrainedVertices = [3 4];

%% A more complex example -- uncomment to run a larger test

load unitCircleFEM.mat
edges = [T(:,1) T(:,2) ; T(:,2) T(:,3) ; T(:,3) T(:,1)];
edges = unique(sort(edges,2),'rows');
constrainedVertices = boundary';
constraints = X(constrainedVertices,:);
totalVertices = size(X,1);
unconstrainedVertices = setdiff(1:totalVertices,constrainedVertices);

%% (i) Make the linear system

% A should be length(unconstrainedVertices) x length(unconstrainedVertices)
% rhs should be length(unconstrainedVertices) x 2

% You should make A a sparse matrix.

% TODO:  Replace this code
B = zeros(totalVertices);
[m, n] = size(edges);
for i = 1:m
    x = edges(i, 1);
    y = edges(i, 2);
    B(x, y) = 1;
    B(y, x) = 1;
end

B1 = B(unconstrainedVertices, unconstrainedVertices);
B2 = B(unconstrainedVertices, constrainedVertices);
B3 = B2';
B4 = B(constrainedVertices, constrainedVertices);

A = sparse(diag(([B1, B2] + [B1; B3]') * ones(totalVertices, 1)) - B1 - B1');
rhs = (B2 + B3') * constraints;

%% Plot the output we expect using Matlab's built-in linear solver

% Solve A*x = rhs 
unknownVertexPositions = A\rhs; % Notice that Matlab's solver is really fast!

% Put the results into a vector of positions and show the graph
% This should generate a nice-looking layout!

result = zeros(totalVertices,2);
result(constrainedVertices,:) = constraints;
result(unconstrainedVertices,:) = unknownVertexPositions;
plotGraph(result, edges);
title('Expected output');

%% (ii) Implement gradient descent

maxIters = 1000; % Give up after 1000 iterations -- not a good halting condition

curX = zeros(length(unconstrainedVertices),2); % Current guess of x in A*x = rhs
f = figure; % Will be used to display the graph

% For display
curResult = zeros(totalVertices,2);
curResult(constrainedVertices,:) = constraints;

for i=1:maxIters
    % TODO:  Update curX
    d = rhs - A * curX;
    a1 = sum(d .* d, 1);
    a2 = diag(d' * A * d)';
    
    alpha = a1 / a2;
    curX = curX + alpha * d;
    
    
    % Display the current iterate
    curResult(unconstrainedVertices,:) = curX;
    plotGraph(curResult, edges, f);
    title(sprintf('Gradient descent iteration %d',i));
    drawnow;
    pause(.1);
end

%% (iii) Implement conjugate gradients

maxIters = 1000;

curX = zeros(length(unconstrainedVertices),2);
f = figure;

curResult = zeros(totalVertices,2);
curResult(constrainedVertices,:) = constraints;

%≥ı ºªØ
r = rhs - A * curX;
v = zeros(size(r)) + 1e-3;

for i=1:maxIters
    % TODO:  Update curX
    r1 = diag(r' * A * v)';
    v1 = diag(v' * A * v)';
    v = r - r1 ./ v1 .* v;
    alpha = diag(v' * r) ./ diag(v' * A * v);
    curX = curX + alpha' .* v;
    r = r - alpha' .* (A * v);

    % Display the current iterate
    curResult(unconstrainedVertices,:) = curX;
    plotGraph(curResult, edges, f);
    title(sprintf('Conjugate gradients iteration %d',i));
    drawnow;
    pause(.1);
end