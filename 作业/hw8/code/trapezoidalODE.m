function trapezoidalODE(positions, velocities, firstOrder, dt, nSteps, edges)

f = figure;

% Want to solve dx/dt = firstOrder * x
x = [positions ; velocities];
n = size(positions,1);

for i=1:nSteps
    % TODO:  Step x forward in time here!
    x = inv(eye(2 * n) - dt * firstOrder / 2) * (eye(2 * n) + dt * firstOrder / 2) * x;
    
    positions = x(1:n,:);
    plotGraph(positions,edges,f);
    title(sprintf('Trapezoidal step %d',i));
    drawnow;
end