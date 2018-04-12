function plot_phase_plane(y,t,x)
    %plot_log_l2_norm Plotting the logarithm of the l2 norm of the solution
    
    y1 = y(1:end/2,:);
    y2 = y(end/2+1:end,:);
    
    x_step = x(2)-x(1);
    
    e1 = sqrt(sum(abs(y1).^2,1).*x_step);
    e2 = sqrt(sum(abs(y2).^2,1).*x_step);
    
    E = e1 + e2;
    
    Et = (E(2:end)-E(1:end-1))./(t(2:end)'-t(1:end-1)');
    
    comet(E(1:end-1), Et);
    xlabel('E');
    ylabel('E_t');
    
end