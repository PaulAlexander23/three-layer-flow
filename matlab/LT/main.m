
H1 = 0.5;
H2 = 0.95;
m2 = 0.06;
m3 = 0.015;
s1 = 1;
s2 = 1;
Q = 1;


xL = 2*pi;
xN = 128;
xS = xL/xN;

x = linspace(xS, xL, xN)';

y0 = [1;i_double_rand_fixed(x, 0.01)];

func = @(y) [0;...
    y(1) * y(2:end) + rhs_ps(0, x, y(2:end), ...
    @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
    [1,3,4])];

%func(y0)

y = fsolve(func,y0);
