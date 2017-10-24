function PlotSurfaces(y,t,x, H1, H2)
% Plotting the solution

y1 = y(1:end/2,:);
y2 = y(end/2+1:end,:);
[X, T] = meshgrid(x,t);

hold on;
surf(X, T, H1 + y1', 'EdgeColor', 'none');
%axis([0,x_length,0,t_final,0,1])
xlabel('x');
ylabel('t');
zlabel('h');
title('The evolution of interfaces in time')

%figure;
surf(X, T, H2 + y2', 'EdgeColor', 'none');
%axis([0,x_length,0,t_final,0,1])

end