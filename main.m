clear all;

tlim = 20;
dt   = 0.001;
iter_num = tlim / dt;
time_history = 0:dt:tlim;

x = [0, 0];
x_result = zeros(length(x), iter_num+1);

yref = 10;
zeta  = 1;
omega = 5;

x_result(:, 1) = x;

for i=1:iter_num

    if i==1
        vel = 0;
    else
        vel = (x(1) - x_result(1, i-1)) / dt;
    end

    u = dynamic_inversion(x, vel, yref, zeta, omega);
    disp(u);

    x = rungekutta(dt, x, u);
    x_result(:, i+1) = x;
end

plot(time_history, x_result(1, :));