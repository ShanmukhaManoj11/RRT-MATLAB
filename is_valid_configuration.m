function t=is_valid_configuration(C,w,h)
    p=update_robot_position(C,w,h);
    t=0;
    % Cfree:
    % (10<x<70 && 140<y<190) + (70<=x<=130 && 150<y<170) + (130<x<190 &&
    % 130<y<190) + (150<x<170 && 70<=y<=130) + (130<x<190 && 10<y<70)
    x=C(1); y=C(2);
    if (10<x && x<70 && 140<y && y<190) || (70<=x && x<=130 && 150<y && y<170) || (130<x && x<190 && 130<y && y<190) || (150<x && x<170 && 70<=y && y<=130) || (130<x && x<190 && 10<y && y<70)
        x=p(1,1); y=p(2,1);
        if (10<x && x<70 && 140<y && y<190) || (70<=x && x<=130 && 150<y && y<170) || (130<x && x<190 && 130<y && y<190) || (150<x && x<170 && 70<=y && y<=130) || (130<x && x<190 && 10<y && y<70)
            x=p(1,2); y=p(2,2);
            if (10<x && x<70 && 140<y && y<190) || (70<=x && x<=130 && 150<y && y<170) || (130<x && x<190 && 130<y && y<190) || (150<x && x<170 && 70<=y && y<=130) || (130<x && x<190 && 10<y && y<70)
                x=p(1,3); y=p(2,3);
                if (10<x && x<70 && 140<y && y<190) || (70<=x && x<=130 && 150<y && y<170) || (130<x && x<190 && 130<y && y<190) || (150<x && x<170 && 70<=y && y<=130) || (130<x && x<190 && 10<y && y<70)
                    x=p(1,4); y=p(2,4);
                    if (10<x && x<70 && 140<y && y<190) || (70<=x && x<=130 && 150<y && y<170) || (130<x && x<190 && 130<y && y<190) || (150<x && x<170 && 70<=y && y<=130) || (130<x && x<190 && 10<y && y<70)
                        if ~(edge_collision(p))
                            t=1;
                        end
                    end
                end
            end
        end
    end
end
                