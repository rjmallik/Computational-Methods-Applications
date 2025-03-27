function MallikarjunaRutujitEC

close all; clear; clc;

tspan = [0 10];
h = 0.001;
theta1_0 = pi/3;
omega1_0 = pi/3;
theta2_0 = 0;
omega2_0 = 0;

x0 = [theta1_0; omega1_0; theta2_0; omega2_0];

fprintf('--- Running Case 1 ---\n');

paramsCase1.m1 = 1;
paramsCase1.m2 = 1;
paramsCase1.l1 = 0.25;
paramsCase1.l2 = 0.25;
paramsCase1.g = 9.81;

[tE1, xE1] = Euler(@EOM, tspan, x0, h, paramsCase1);
[tT1, xT1] = Trapezoid(@EOM, tspan, x0, h, paramsCase1);
[tR1, xR1] = RungeKutta(@EOM, tspan, x0, h, paramsCase1);
odeFunCase1 = @(t,x) EOM(t,x,paramsCase1);
[t45_1, x45_1] = ode45(odeFunCase1, tspan, x0);

figure('Name','Case 1 Results');
subplot(2,1,1)
plot(tE1, xE1(1,:), 'r-', tT1, xT1(1,:), 'g--', tR1, xR1(1,:), 'b-.', t45_1, x45_1(:,1), 'k', 'LineWidth', 1);
xlabel('Time (s)'); ylabel('\theta_1 (rad)');
legend('Euler','Trapezoid','RK4','ode45','Location','Best');
title('Case 1: \theta_1 vs. time');
grid on;

subplot(2,1,2)
plot(tE1, xE1(3,:), 'r-', tT1, xT1(3,:), 'g--', tR1, xR1(3,:), 'b-.', t45_1, x45_1(:,3), 'k', 'LineWidth', 1);
xlabel('Time (s)'); ylabel('\theta_2 (rad)');
legend('Euler','Trapezoid','RK4','ode45','Location','Best');
title('Case 1: \theta_2 vs. time');
grid on;

fprintf('--- Running Case 2 ---\n');
paramsCase2.m1 = 1;
paramsCase2.m2 = 1;
paramsCase2.l1 = 0.25;
paramsCase2.l2 = 0.50;
paramsCase2.g = 9.81;

[tE2, xE2] = Euler(@EOM, tspan, x0, h, paramsCase2);
[tT2, xT2] = Trapezoid(@EOM, tspan, x0, h, paramsCase2);
[tR2, xR2] = RungeKutta(@EOM, tspan, x0, h, paramsCase2);
odeFunCase2 = @(t,x) EOM(t,x,paramsCase2);
[t45_2, x45_2] = ode45(odeFunCase2, tspan, x0);

figure('Name','Case 2 Results');
subplot(2,1,1)
plot(tE2, xE2(1,:), 'r-', tT2, xT2(1,:), 'g--', tR2, xR2(1,:), 'b-.', t45_2, x45_2(:,1), 'k', 'LineWidth', 1);
xlabel('Time (s)'); ylabel('\theta_1 (rad)');
legend('Euler','Trapezoid','RK4','ode45','Location','Best');
title('Case 2: \theta_1 vs. time');
grid on;

subplot(2,1,2)
plot(tE2, xE2(3,:), 'r-', tT2, xT2(3,:), 'g--', tR2, xR2(3,:), 'b-.', t45_2, x45_2(:,3), 'k', 'LineWidth', 1);
xlabel('Time (s)'); ylabel('\theta_2 (rad)');
legend('Euler','Trapezoid','RK4','ode45','Location','Best');
title('Case 2: \theta_2 vs. time');
grid on;
end