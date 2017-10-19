function PlotAverage(h,t,x)
% Plotting the solution

y1 = h(1:end/2,:);
y2 = h(end/2+1:end,:);

plot(t, mean(y1,1));
xlabel('t');
ylabel('L_1');
title('The evolution of L_1 norm \eta_1 in time')

hold on;
plot(t, mean(y2,1));
xlabel('t');
ylabel('L_1');
title('The evolution of L_1 norm \eta_2 in time')
end