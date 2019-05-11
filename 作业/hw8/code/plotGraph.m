function plotGraph(vertices, edges, figureRef)

if nargin < 3
    figureRef = figure;
end

cla(figureRef);

figure(figureRef);
plot(vertices(:,1),vertices(:,2),'rx');
hold on;

nv = size(vertices,1);
ne = size(edges,1);

v1 = vertices(edges(:,1),:);
v2 = vertices(edges(:,2),:);

vList = ones(ne*3,2);

vList(1:3:ne*3,:) = v1;
vList(2:3:ne*3,:) = v2;
vList(3:3:ne*3,:) = NaN;

plot(vList(:,1),vList(:,2),'b-');

axis equal;
xlim([0 1]);
ylim([0 1]);