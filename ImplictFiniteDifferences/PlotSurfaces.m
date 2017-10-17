function PlotSurfaces(h,t,x,x_length,t_final)
% Plotting the solution

y1 = h(1:end/2,:);
y2 = h(end/2+1:end,:);
[X, T] = meshgrid(x,t);

hold on;
surf(X, T, y1', 'EdgeColor', 'none');
%axis([0,x_length,0,t_final,0,1])
xlabel('x');
ylabel('t');
zlabel('h');
title('The evolution of interfaces in time')

%figure;
surf(X, T, y2', 'EdgeColor', 'none');
%axis([0,x_length,0,t_final,0,1])

end