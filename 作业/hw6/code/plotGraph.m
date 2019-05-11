function plotGraph(vertices, edges, figureRef)

if nargin < 3
    figureRef = figure;
end

cla(figureRef);

figure(figureRef);
plot(vertices(:,1),vertices(:,2),'.');
hold on;

nv = size(vertices,1);
ne = size(edges,1);

v1 = vertices(edges(:,1),:);
v2 = vertices(edges(:,2),:);

vList = ones(ne*3,2);

vList(1:3:ne*3,:) = v1;
vList(2:3:ne*3,:) = v2;
vList(3:3:ne*3,:) = NaN;

plot(vList(:,1),vList(:,2));

% for i=1:size(edges,1)
% %     plot([vertices(edges(i,1),1) vertices(edges(i,2),1)], ...
% %          [vertices(edges(i,1),2) vertices(edges(i,2),2)]);
%      
%     line([vertices(edges(i,1),1) vertices(edges(i,2),1)], ...
%          [vertices(edges(i,1),2) vertices(edges(i,2),2)]);
% end

axis equal;