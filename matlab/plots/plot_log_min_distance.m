function plot_log_min_distance(h,t,H1,H2)
    % Plotting the L1 norm of the solution
    
    dh = abs(H1 + h(1:end/2,:) - H2 - h(end/2+1:end,:));
    
    plot(log10(t), log10(min(dh,[],1)),'.k');
    xlabel('log_{10}(t)');
    ylabel('log_{10}(Min. vertical distance)');
end