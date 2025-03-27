function xapprox = bisection(a, b, f, epsilon, max_iter)

    if nargin < 5
        max_iter = 1000;
    end

    fa = f(a);
    fb = f(b);

    if fa * fb > 0
        error('Function does not change sign on the interval [a, b].');
    end

    iter = 0;
    while (b - a) / 2 > epsilon && iter < max_iter
        c = (a + b) / 2;
        fc = f(c);

        if fc == 0 || (b - a) / 2 < epsilon
            xapprox = c;
            return;
        end

        if fa * fc < 0
            b = c;
            fb = fc;
        else
            a = c;
            fa = fc;
        end

        iter = iter + 1;
    end

    xapprox = (a + b) / 2;
end
