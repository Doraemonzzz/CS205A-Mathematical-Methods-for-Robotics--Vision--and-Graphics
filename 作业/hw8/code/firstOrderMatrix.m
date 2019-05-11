function matrix = firstOrderMatrix(secondOrderMatrix)
% Given a matrix F such that X''=FX, generates a matrix (of double the
% size) A such that Y'=AY solves the reduced first-order system.

% Write me!

[m, n] = size(secondOrderMatrix);
matrix = zeros(2 * m);
matrix(1: m, m+1: 2*m) = eye(m);
matrix(m+1: 2*m, 1: m) = secondOrderMatrix;