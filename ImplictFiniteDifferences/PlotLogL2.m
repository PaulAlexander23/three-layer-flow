%% Plotting the solution
y1 = h(:,1:end/2);
y2 = h(:,end/2+1:end);
[X, T] = meshgrid(x,t);

e1 = log(sqrt(sum(abs(y1-H_1).^2,2).*x_step));
e2 = log(sqrt(sum(abs(y2-H_2).^2,2).*x_step));

fprintf('Gradient 1: %g, Gradient 2: %g\n',e1(end)-e1(1),e2(end)-e2(1));

hold on;
plot(t, e1);
xlabel('t');
ylabel('E');
title('The evolution of log(L_2 norm \eta) of the system in time')
%title('The evolution of log(L_2 norm \eta_1) of the system in time')

%figure;
plot(t, e2);
%xlabel('t');
%ylabel('E');
%title('The evolution of log(L_2 norm \eta_2) of the system in time')