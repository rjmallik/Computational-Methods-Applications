close all; clear; clc;

set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaulttextinterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

% Domain
x = -5:0.01:5;

% True function
f_true = (1/3) * (exp(x) + 2 * exp(-x / 2) .* cos(sqrt(3) * x / 2));

figure(1)
plot(x, f_true, '-k', 'LineWidth', 3) 
hold on
color_cell = {'--r', '--g', '--b'};

% Preallocate f_approx array
f_approx = zeros(length(x), 3); % 3 columns for k = 2, 3, 4

for k = 2:4
    n = (0:k-1)';
    % Approximate function
    f_approx(:, k-1) = sum((x'.^(3 * n)) ./ factorial(3 * n), 2);
    plot(x, f_approx(:, k-1), color_cell{k-1}, 'LineWidth', 3)
    hold on
end

set(gca, 'FontSize', 30)
legend('$f_{\rm{true}}(x)$', '$f_{\rm{approx}}(x,2)$', ...
       '$f_{\rm{approx}}(x,3)$', '$f_{\rm{approx}}(x,4)$', ...
       'FontSize', 30, 'Interpreter', 'latex')
