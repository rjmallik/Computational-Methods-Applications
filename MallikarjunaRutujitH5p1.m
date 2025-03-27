clear; clc; close all;

t = [1; 2; 3; 4; 5];
f = [2; 5; 9; -1; -4];

A = [1, t(1), t(1)^2, -f(1)*t(1), -f(1)*t(1)^2;
     1, t(2), t(2)^2, -f(2)*t(2), -f(2)*t(2)^2;
     1, t(3), t(3)^2, -f(3)*t(3), -f(3)*t(3)^2;
     1, t(4), t(4)^2, -f(4)*t(4), -f(4)*t(4)^2;
     1, t(5), t(5)^2, -f(5)*t(5), -f(5)*t(5)^2];

b = f;

x = A\b;
p1 = x(1);
p2 = x(2);
p3 = x(3);
q1 = x(4);
q2 = x(5);

f_t = @(t) (p1 + p2*t + p3*t.^2) ./ (1 + q1*t + q2*t.^2);

t_vals = linspace(-6, 6, 1000);
f_vals = f_t(t_vals);

figure;
plot(t_vals, f_vals, 'b', 'LineWidth', 2); hold on;
scatter(t, f, 'ro', 'filled');
xlabel('t');
ylabel('f(t)');
title('Rational Function Fit');
grid on;
legend('f(t)', 'Given Points');

saveas(gcf, 'MallikarjunaRutujitHW5p1_plot.png');

disp('Solution for the coefficients:');
disp(['p1 = ', num2str(p1)]);
disp(['p2 = ', num2str(p2)]);
disp(['p3 = ', num2str(p3)]);
disp(['q1 = ', num2str(q1)]);
disp(['q2 = ', num2str(q2)]);
