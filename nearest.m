function qn=nearest(nodes,C)
    m=size(nodes);
    %seq=randperm(m(1));
    seq=1:m;
    %d=abs(nodes(seq(1),1)-C(1))+abs(nodes(seq(1),2)-C(2))+abs(nodes(seq(1),3)-C(3));
    d=sqrt((nodes(seq(1),1)-C(1))^2+(nodes(seq(1),2)-C(2))^2+((nodes(seq(1),3)-C(3))*100/pi)^2);
    %d=sqrt((nodes(seq(1),1)-C(1))^2+(nodes(seq(1),2)-C(2))^2);
    qn=nodes(seq(1),:);
    for i=2:length(seq)
        %l=abs(nodes(seq(i),1)-C(1))+abs(nodes(seq(i),2)-C(2))+abs(nodes(seq(i),3)-C(3));
        l=sqrt((nodes(seq(i),1)-C(1))^2+(nodes(seq(i),2)-C(2))^2+((nodes(seq(i),3)-C(3))*100/pi)^2);
        %l=sqrt((nodes(seq(i),1)-C(1))^2+(nodes(seq(i),2)-C(2))^2);
        if l<d
            d=l;
            qn=nodes(seq(i),:);
        end
    end
end
        