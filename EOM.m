function xdot = EOM(t, x, params)
    m1 = params.m1;
    m2 = params.m2;
    l1 = params.l1;
    l2 = params.l2;
    g  = params.g;

    theta1 = x(1);
    omega1 = x(2);
    theta2 = x(3);
    omega2 = x(4);

    denom = l1*(2*m1 + m2 - m2*cos(2*theta1 - 2*theta2));

    alpha1_num = -g*(2*m1 + m2)*sin(theta1) ...
                 - m2*g*sin(theta1-2*theta2) ...
                 - 2*m2*sin(theta1 - theta2) .* (l2*(omega2^2) + l1*(omega1^2)*cos(theta1 - theta2));

    alpha1 = alpha1_num / denom;


    denom2 = l2*(2*m1 + m2 - m2*cos(2*theta1 - 2*theta2));

    alpha2_num = 2*sin(theta1 - theta2) .* ...
        (l1*(omega1^2)*(m1+m2) + g*(m1+m2)*cos(theta1) + l2*m2*(omega2^2)*cos(theta1 - theta2));

    alpha2 = alpha2_num / denom2;
    
    xdot = [omega1; alpha1; omega2; alpha2];
end