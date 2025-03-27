%% Main Script

f = @(x) x^3+x-1;
xc = bisect_complete(f, 0, 2, 1e-5)

figure
fplot(f)
grid on
xlabel('x')
ylabel('f(x)')

xc = bisect(f,1,0,5e-5);


figure
fplot(f)
grid on
xlabel('x')
ylabel('f(x)')