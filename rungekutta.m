function xn = rungekutta(dt, xp, u)

f1 = @(x1, x2, u) x1^3 + x2;
f2 = @(x1, x2, u) x1 + (x1^2+1)*x2 + (x1^2+1)*u;

x1 = xp(1);
x2 = xp(2);

ka1 = f1(x1, x2, u);
ka2 = f2(x1, x2, u);

kb1 = f1(x1+ka1/2*dt, x2+ka2/2*dt, u);
kb2 = f2(x1+ka1/2*dt, x2+ka2/2*dt, u);

kc1 = f1(x1+kb1/2*dt, x2+kb2/2*dt, u);
kc2 = f2(x1+kb1/2*dt, x2+kb2/2*dt, u);

kd1 = f1(x1+kc1*dt, x2+kc2*dt, u);
kd2 = f2(x1+kc1*dt, x2+kc2*dt, u);

x1n = x1 + (ka1 + 2*kb1 + 2*kc1 + kd1)/6 * dt;
x2n = x2 + (ka2 + 2*kb2 + 2*kc2 + kd2)/6 * dt;

xn = [x1n; x2n];

end


