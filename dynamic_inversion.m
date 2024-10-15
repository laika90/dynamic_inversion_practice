function u = dynamic_inversion(x, vel, yref, zeta, omega)

a0 = omega^2;
a1 = 2*zeta*omega;

x1 = x(1);
x2 = x(2);

v = -a0*(x1-yref) - a1*vel;
lglfh = x1^2+1;
lflfh = 3*x1^2*(x1^3+x2) + x1 + (x1^2+1)*x2;

u = (v - lflfh) / lglfh;

end