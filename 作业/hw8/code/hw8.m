%% Randomly generate a configuration of particles

nParticles = 10;

positions = rand(nParticles,2); % initialize with random positions
velocities = zeros(nParticles,2); % intialize with random velocities

nEdges = 20;

edges = zeros(nEdges,2); % randomly generate edges
for i=1:nEdges
    edges(i,:) = randperm(nParticles,2);
end
edges = unique(sort(edges,2),'rows');

plotGraph(positions,edges);
title('Initial positions');

%% Compute force matrix

forces = forceMatrix(edges, nParticles);

%% Reduce to first order

firstOrder = firstOrderMatrix(forces);

%% Simulate using forward Euler
% Matlab hint:  You can type ctrl+enter to just run this block

dt = .005;
nSteps = 1000;
forwardEuler(positions, velocities, firstOrder, dt, nSteps, edges);

%% Simulate using backward Euler

dt = .005;
nSteps = 1000;
backwardEuler(positions, velocities, firstOrder, dt, nSteps, edges);

%% Simulate using the trapezoidal rule

dt = .005;
nSteps = 1000;
trapezoidalODE(positions, velocities, firstOrder, dt, nSteps, edges);

%% Simulate using leapfrog

dt = .005;
nSteps = 1000;
leapfrog(positions, velocities, forces, dt, nSteps, edges);