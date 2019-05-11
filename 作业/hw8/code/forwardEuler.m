function forwardEuler(positions, velocities, firstOrder, dt, nSteps, edges)

f = figure;

% Want to solve dx/dt = firstOrder * x
x = [positions ; velocities];
n = size(positions,1);

for i=1:nSteps
    % TODO:  Step x forward in time here! (one-liner)
    x = x + dt * firstOrder * x;
    
    positions = x(1:n,:);
    plotGraph(positions,edges,f);
    title(sprintf('Forward Euler step %d',i));
    drawnow;
end