function [tout, xout] = Euler(fun, tspan, x0, h, params)

    t0 = tspan(1);
    tf = tspan(2);

    N = floor( (tf - t0)/h );
    tout = (0:N)*h + t0;
    xout = zeros(length(x0), N+1);

    xout(:,1) = x0;

    for i = 1:N
        t_curr = tout(i);
        x_curr = xout(:,i);

        dx = fun(t_curr, x_curr, params);

        xout(:,i+1) = x_curr + h*dx;
    end
end