function animate_h_h( y, t, x, H1, H2, m2, m3, s1, s2, Q, c )
    %animate_interfaces Animation of the interfaces
    if nargin < 6
        c = 1;
    end
    
    F1 = griddedInterpolant({x, t}, y(1:end/2,:));
    F2 = griddedInterpolant({x, t}, y(1+end/2:end,:));
    
    fr = 10;
    tNew = 0:1/fr/c:t(end);
    %tNew = t;
    temp = 1;
    xNew = x(temp:temp:end);
    
    y = [F1({xNew,tNew}); F2({xNew,tNew})];
    
    %plot_type_for_all_h(H1,H2,m2,m3,Q)
    [img, h] = plot_stability_h(1,m2,m3,s1,s2,Q);
    hold on
    plot_h_h_space(y(:,1),H1,H2);
    set(gcs,'nextplot','replaceshildren');
    pause(1)
    
    for tI = 2:length(tNew)
        tic
        hold off
        colormap([1   1   1
              0.5 0.5 0.5
              0   0   0])
        
        % Plot
        imagesc(h,h,img')
        set(gca,'YDir','normal');
        caxis([0 1]);
        axis image;
        
        xlabel('H_1')
        ylabel('H_2')
        %title({'Plot of the regions of instability.'})
        hold on
        plot_h_h_space(y(:,tI),H1,H2);
        
        pause(max(0,1/fr-toc))
    end
end