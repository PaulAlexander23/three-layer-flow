% Testing and examples for the finite difference section

global D

Q = 1;
H1 = 0.4;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;

xN = 2^8;
xL = 2*pi;
xS = xL/xN;

x = linspace(xS, xL, xN)';
initialise_finite_differences(xN,xS,4);
y = cos(x);
dyApprox = D{1}*y;

y2 = rhs_fd(0,x,i_double_cos(x,0.1,1.0),...
    @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
    [1,3,4]);

test_finite_difference_construction

figure
test_finite_difference