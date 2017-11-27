% Driver for the grouping of everything

clear all; close all;

% addpath('DR\','FD\','NS\','IF\')

Q = 1.0;
H1 = 0.70;
H2 = 0.96;
m2 = 0.5;
m3 = 0.25375;
s1 = 1;
s2 = 1;

inter = @(x) i_eigenfunction(x,H1,H2,m2,m3,s1,s2,Q,[0.03,0.03],1,0);

plot_dispersion_relation_varying_h(m2,m3,s1,s2,Q);
hold on;
plot_h_h_space(inter(linspace(0,2*pi)'),H1,H2);

prompt = 'Continue? y/n\n';
str = '-';
while(str~='y')
    str = input(prompt,'s');
    if str=='n'
        close all;
        return
    end
end

%%
close all;

tL = 10;
xL = 2*pi;
xN = 2^6;

[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,inter,...
    tL,xL,xN,1e-9);

figure
plot_overview(h,t,x,H1,H2,m2,m3,s1,s2,Q)

% figure
% plot(t, log10(min(abs(h(1:end/2,:)+H1-h(1+end/2:end,:)-H2))))