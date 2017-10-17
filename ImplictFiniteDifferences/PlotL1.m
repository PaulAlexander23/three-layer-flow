%% Plotting the solution
y1 = h(1:end/2,:);
y2 = h(end/2+1:end,:);

[X, T] = meshgrid(x,t);

plot(t, sum(y1,1).*x_step);
xlabel('t');
ylabel('L_1');
title('The evolution of L_1 norm \eta_1 in time')

figure;
plot(t, sum(y2,1).*x_step);
xlabel('t');
ylabel('L_1');
title('The evolution of L_1 norm \eta_2 in time')