
% H1 = 0.5;
% H2 = 0.95;
% m2 = 0.06;
% m3 = 0.015;
% s1 = 1;
% s2 = 1;
% Q = 1;


xL = 2*pi;
xN = 256;
xS = xL/xN;

x = linspace(xS, xL, xN)';

%y0 = [1;i_double_rand_fixed(x, 0.01)];
%y0 = [-1.242; h(:,end)];
c = imag(compute_dispersion_relation(1,H1,H2,m2,m3,s1,s2,Q));
y0 = [c(1); h(:,end)];

initialise_finite_differences(xN,xL/xN,4);

func = @(y) [y(2)-y0(2);...
    y(1) * reshape(diff_ps(reshape(y(2:end),xN,2),1),2*xN,1) + rhs_fd(0, x, y(2:end), @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),[1,3,4])];

display(y0(1));

figure;
plot_interfaces(x,y0(2:end),H1,H2);

figure;
plot(func(y0));
    
y = fsolve(func,y0);

display(y(1));

figure;
plot_interfaces(x,y(2:end),H1,H2);

figure;
plot(func(y));

% y2 = fft(reshape(y(2:end),xN,2));
% y2(xN/2-1,:) = 0;
% y2(xN/2+1,:) = 0;
% y2 = reshape(ifft(y2),2*xN,1);
% plot_interfaces(x,y2,H1,H2);

%%

x = linspace(2*pi/512,2*pi,512)';
y4 = [interp(y2(1:end/2),2);interp(y2(1+end/2:end),2)];
y0 = [y0(1);y4];
func2 = @(y) [y(2)-y0(2);...
    y(1) * reshape(diff_ps(reshape(y(2:end),512,2),1),1024,1) + rhs_ps(0, x, y(2:end), @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),[1,3,4])];

y = fsolve(func2,y0);

plot_interfaces(x,y(2:end),H1,H2);

