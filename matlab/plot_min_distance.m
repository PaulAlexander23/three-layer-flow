function plot_min_distance(h,t,H1,H2)
    % Plotting the L1 norm of the solution
    
    dh = abs(H1 + h(1:end/2,:) - H2 - h(end/2+1:end,:));
    
    plot(t, min(dh,[],1),'k');
    xlabel('t');
    ylabel('Min. vertical distance');
end