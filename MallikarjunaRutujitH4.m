% Parameters
m = 0.5;
epsilon = 0.5;
num_iterations = 20;
num_initial_guesses = 50;

% Function g(x) defined by Kepler's equation
g = @(x) m + epsilon * sin(x);

% Initialize storage for results
results = zeros(num_iterations, num_initial_guesses);

% Generate random initial guesses in the interval [0, 1]
initial_guesses = rand(1, num_initial_guesses);

% Perform fixed point recursion for each initial guess
for j = 1:num_initial_guesses
    x = initial_guesses(j);
    for k = 1:num_iterations
        x = g(x);
        results(k, j) = x;
    end
end

% Plotting
figure;
hold on;
for j = 1:num_initial_guesses
    plot(1:num_iterations, results(:, j), '-o');
end
hold off;

% Customize plot
title('Fixed Point Recursion for Kepler''s Equation');
xlabel('Recursion Index (k)');
ylabel('Value of x_k');
grid on;
legend(arrayfun(@(i) sprintf('Initial guess %d', i), 1:num_initial_guesses, 'UniformOutput', false), ...
    'Location', 'bestoutside');