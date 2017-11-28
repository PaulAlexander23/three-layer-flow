function plot_log_l1_norm(h,t,x)
    % Plotting the L1 norm of the solution
    
    y1 = h(1:end/2,:);
    y2 = h(end/2+1:end,:);
    
    xStep = x(2)-x(1);
    
    plot(t, log10(abs(sum(y1,1)).*xStep));
    xlabel('t');
    ylabel('L_1');
    title('The evolution of L_1 norm \eta_i in time')
    %figure;
    hold on;
    plot(t, log10(abs(sum(y2,1)).*xStep));
    %xlabel('t');
    %ylabel('L_1');
    %title('The evolution of L_1 norm \eta_2 in time')
    
end