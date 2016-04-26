function qs=stopping_configuration(qn,C,w,h,m)
%     d=ceil(abs(qn(1)-C(1))+abs(qn(2)-C(2))+abs(qn(3)-C(3)));
%     d=ceil((qn(1)-C(1))^2+(qn(2)-C(2))^2+((qn(3)-C(3))*200/pi)^2);
    possible_C=C;
    l=sqrt((qn(1)-C(1))^2+(qn(2)-C(2))^2+((qn(3)-C(3))*100/pi)^2);
    %l=sqrt((qn(1)-C(1))^2+(qn(2)-C(2))^2);
    if l>m
        if C(1)>qn(1)
            possible_C(1)=qn(1)+m*(C(1)-qn(1))/l;
        else
            possible_C(1)=qn(1)-m*(C(1)-qn(1))/l;
        end
        possible_C(2)=qn(2)+(possible_C(1)-qn(1))*(C(2)-qn(2))/(C(1)-qn(1));
        possible_C(3)=qn(3)+m*(C(3)-qn(3))/l;
    end
    d=20;
    sample=[linspace(qn(1),possible_C(1),d);linspace(qn(2),possible_C(2),d);linspace(qn(3),possible_C(3),d)]';
    i=2;
    while i<=d && is_valid_configuration(sample(i,:),w,h)
        i=i+1;
    end
    qs=sample(i-1,:);
end