a = 0.1;
b = 2.0;
epsilon = 1e-4;
max_iter = 1000;

f = @func;

r_approx = bisection(a, b, f, epsilon, max_iter);

fprintf('The approximate root r is: %.4f\n', r_approx);
