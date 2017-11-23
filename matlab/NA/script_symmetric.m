
addpath('../IF')

H1 = 0.45;
H2 = 0.55;
m2 = 0.8;
m3 = 1;
Q = 1;

x = linspace(0,2*pi)';
h = i_double_cos(x,0.05,pi);
plot_interfaces(x,h,H1,H2);

figure('position',[0,660,560,420])
plot_type_for_all_h(H1,H2,m2,m3,Q)
hold on
plot(H1+h(1:end/2),H2+h(1+end/2:end));

%%
figure
h = i_double_cos(x,0.06,pi/2);
plot_interfaces(x,h,H1,H2);

figure('position',[0,660,560,420])
plot_type_for_all_h(H1,H2,m2,m3,Q)
hold on
plot_h_h_space(h,H1,H2);
