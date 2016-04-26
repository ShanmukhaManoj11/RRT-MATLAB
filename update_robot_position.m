function p=update_robot_position(C,w,h)
    xi=C(1); yi=C(2); theta=C(3);
    Xi=[xi-w/2 xi-w/2 xi+w/2 xi+w/2];
    Yi=[yi-h/2 yi+h/2 yi+h/2 yi-h/2];
    R=[cos(theta) -sin(theta);sin(theta) cos(theta)];
    X=R*[Xi-xi;Yi-yi];
    p=[X(1,:)+xi;X(2,:)+yi];
end