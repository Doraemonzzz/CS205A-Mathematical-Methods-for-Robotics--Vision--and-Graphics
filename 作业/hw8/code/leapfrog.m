function leapfrog(positions, velocities, force, dt, nSteps, edges)

f = figure;

% Want to solve dx/dt = firstOrder * x
n = size(positions,1);

% TODO:  Step velocities a half time step
% Move a half time step in velocity using forward Euler (not great)

for i=1:nSteps
    % TODO:  Step positions and velocities
    % Velocities are at next half time step
    positions = positions + dt * velocities;
    velocities = velocities + dt * force * positions;
    
    plotGraph(positions,edges,f);
    title(sprintf('Leapfrog step %d',i));
    drawnow;
end