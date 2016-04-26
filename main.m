clc

% map_size=200;
% % occupancy grid
% I=zeros(map_size);
% I(:,1:10)=1;
% I(1:10,:)=1;
% I(10:130,10:130)=1;
% I(70:130,130:150)=1;
% I(70:130,170:190)=1;
% I(:,190:200)=1;
% I(190:200,:)=1;
% I(170:190,70:130)=1;
% I(130:150,70:130)=1;

% map
figure
hold on
patch([0 10 10 0],[0 0 200 200],'blue','edgecolor','none')
patch([0 200 200 0],[0 0 10 10],'blue','edgecolor','none')
patch([190 200 200 190],[0 0 200 200],'blue','edgecolor','none')
patch([0 200 200 0],[190 190 200 200],'blue','edgecolor','none')
patch([10 130 130 10],[10 10 140 140],'blue','edgecolor','none')
patch([70 130 130 70],[130 130 150 150],'blue','edgecolor','none')
patch([70 130 130 70],[170 170 190 190],'blue','edgecolor','none')
patch([130 130 150 150],[130 70 70 130],'blue','edgecolor','none')
patch([170 170 190 190],[130 70 70 130],'blue','edgecolor','none')
axis off

robot.width=30; robot.height=10;
robot.max_step=30;
xi=30; yi=160; thetai=pi/2;
Ci=[xi yi thetai];
p=update_robot_position(Ci,robot.width,robot.height);
h=patch(p(1,:),p(2,:),'yellow');
% plot(xi,yi,'.k','markersize',10)
drawnow

Cg=[160 30 0];
[G,iterations]=RRT_new(Ci,Cg,robot.width,robot.height,robot.max_step);
m=size(G.node);
for i=2:m(1)-1
%     p=update_robot_position(G.node(i,:),robot.width,robot.height);
%     patch(p(1,:),p(2,:),'yellow')
%     plot(G.node(i,1),G.node(i,2),'.r','markersize',10)
    p=G.parent(i,:);
    plot([G.node(i,1) p(1)],[G.node(i,2) p(2)],'-k')
    %drawnow
    %pause(0.1)
end
% p=update_robot_position(G.node(m(1),:),robot.width,robot.height);
% plot(sum(p(1,:))/4,sum(p(2,:))/4,'.g','markersize',10)
% plot(G.node(m(1),1),G.node(m(1),2),'.g','markersize',10)
p=G.parent(m(1),:);
plot([G.node(m(1),1) p(1)],[G.node(m(1),2) p(2)],'-k')

q=G.node(m(1),:);
path=q;
while ~isnan(q)
    i=find(G.node(:,1)==q(1) & G.node(:,2)==q(2) & G.node(:,3)==q(3));
    q=G.parent(i,:);
    path=[path;q];
end
path=flipud(path);
l=size(path);
for i=2:l(1)
    delete(h)
    p=update_robot_position(path(i,:),robot.width,robot.height);
    h=patch(p(1,:),p(2,:),'yellow');
    plot([path(i-1,1) path(i,1)],[path(i-1,2) path(i,2)],'-g','linewidth',3)
    drawnow
    pause(0.1)
end
delete(h)
p=update_robot_position(Cg,robot.width,robot.height);
h=patch(p(1,:),p(2,:),'yellow');
plot([path(l(1),1) Cg(1)],[path(l(1),2) Cg(2)],'-g','linewidth',3)