close all; clear; clc;

set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

x_data = (-1:0.1:1)';
y_data = 1 ./ (1 + 25 * x_data.^2);

figure(1)
plot(x_data, y_data, 'ko', 'LineWidth', 2, 'MarkerFaceColor', 'k')
xlabel('$x$', 'FontSize', 30);
ylabel('$y$', 'FontSize', 30, 'rotation', 0);
set(gca, 'FontSize', 30)
hold on

n = numel(x_data) - 1;
A = zeros(2*n, 2*n);
b = zeros(2*n, 1);

for i = 1:n
    A(2*i-1:2*i, 2*i-1:2*i) = [x_data(i), 1; x_data(i+1), 1];
    b(2*i-1:2*i) = [y_data(i); y_data(i+1)];
end

c = A \ b;

for i = 1:n
    line_idx = 2*i - 1;
    x_segment = linspace(x_data(i), x_data(i+1), 10);
    y_segment = c(line_idx) * x_segment + c(line_idx + 1);
    plot(x_segment, y_segment, '-r', 'LineWidth', 2)
end

title('Linear Spline Interpolation', 'FontSize', 30)
hold off
