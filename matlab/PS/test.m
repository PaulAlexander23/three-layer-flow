% Testing and examples for the pseudo spectral section

xL = 2*pi;
xN = 2^8;
xS = xL/xN;

x = linspace(xS, xL, xN)';
y = cos(x);
dy = -sin(x);
dyApprox = diff_ps(y,1);
max(abs(dy-dyApprox))

fApprox = rhs_ps(0,x,i_double_cos(x,1,0.1),...
    @(t, x, y, dy) compute_evolution(y, dy, 0.4, 0.7, 1, 1, 1, 1, 1),...
    [1,3,4]);
size(fApprox)

test_pseudo_spectral


