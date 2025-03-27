function [tout, xout] = Trapezoid(fun, tspan, x0, h, params)

    t0 = tspan(1);
    tf = tspan(2);

    N = floor((tf - t0)/h);
    tout = (0:N)*h + t0;
    xout = zeros(length(x0), N+1);
    xout(:,1) = x0;

    for i = 1:N
        t_curr = tout(i);
        x_curr = xout(:,i);

        dx1 = fun(t_curr, x_curr, params);
        x_pred = x_curr + h*dx1;

        t_next = t_curr + h;
        dx2 = fun(t_next, x_pred, params);

        xout(:,i+1) = x_curr + 0.5*h*(dx1 + dx2);
    end
end