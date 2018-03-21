function plot_log_l2_norm(y,t,x)
    %plot_log_l2_norm Plotting the logarithm of the l2 norm of the solution
    
    y1 = y(1:end/2,:);
    y2 = y(end/2+1:end,:);
    
    x_step = x(2)-x(1);
    
    e1 = log(sqrt(sum(abs(y1).^2,1).*x_step));
    e2 = log(sqrt(sum(abs(y2).^2,1).*x_step));
    
    fprintf('Gradient 1: %g, Gradient 2: %g\n',(e1(end)-e1(1))/(t(end)-t(1)),(e2(end)-e2(1))/(t(end)-t(1)));
    
    plot(t, e1);
    xlabel('t');
    ylabel('log(E)');
    title('The evolution of log(L_2 norm \eta) of the system in time')
    %title('The evolution of log(L_2 norm \eta_1) of the system in time')
    hold on;
    %figure;
    plot(t, e2);
    %xlabel('t');
    %ylabel('E');
    %title('The evolution of log(L_2 norm \eta_2) of the system in time')
end