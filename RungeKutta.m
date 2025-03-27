function [tout, xout] = RungeKutta(fun, tspan, x0, h, params)

    t0 = tspan(1);
    tf = tspan(2);

    N = floor((tf - t0)/h);
    tout = (0:N)*h + t0;
    xout = zeros(length(x0), N+1);
    xout(:,1) = x0;

    for i = 1:N
        t_curr = tout(i);
        x_curr = xout(:,i);

        k1 = fun(t_curr, x_curr, params);
        k2 = fun(t_curr + 0.5*h, x_curr + 0.5*h*k1, params);
        k3 = fun(t_curr + 0.5*h, x_curr + 0.5*h*k2, params);
        k4 = fun(t_curr + h,     x_curr + h*k3,     params);

        xout(:,i+1) = x_curr + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
end