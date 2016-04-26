function [G,iterations]=RRT_new(Ci,Cg,w,h,max_step)
    qs=Ci;
    G.node=qs;
    G.parent=[nan nan nan];
    %while abs(qs(1)-Cg(1))+abs(qs(2)-Cg(2))+abs(qs(3)-Cg(3))>10
    iterations=0;
    while sqrt((qs(1)-Cg(1))^2+(qs(2)-Cg(2))^2+((qs(3)-Cg(3))*100/pi)^2)>max_step
    %while sqrt((qs(1)-Cg(1))^2+(qs(2)-Cg(2))^2)>30
        if mod(iterations,5)==4
            C=Cg;
        else
            C=[randi(200,[1,2]) -pi+2*pi*rand()];
        end
%         while ~is_valid_configuration(C,w,h)
%             C=[randi(200,[1,2]) pi*rand()];
%         end
        qn=nearest(G.node,C);
        qs=stopping_configuration(qn,C,w,h,max_step);
        if qs~=qn
            G.node=[G.node;qs];
            G.parent=[G.parent;qn];
        end
        iterations=iterations+1;
    end
end
    