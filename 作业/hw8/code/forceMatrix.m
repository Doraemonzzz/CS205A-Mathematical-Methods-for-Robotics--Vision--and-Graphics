function M = forceMatrix(edges, nParticles)
% Computes a matrix that takes the positions of a set of particles and
% gives back the force exerted on each particle.  Here, the force on x by a
% spring between x and y is equal to y-x.

% Write me!

M = zeros(nParticles);
[m, n] = size(edges);
for i = 1: m
    x = edges(i, 1);
    y = edges(i, 2);
    M(x, x) = M(x, x) - 1;
    M(x, y) = M(x, y) + 1;
    M(y, x) = M(y, x) + 1;
    M(y, y) = M(y, y) - 1;
end
