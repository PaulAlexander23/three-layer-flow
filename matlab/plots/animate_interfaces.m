function animate_interfaces( h, t, x, H1, H2, c )
    %animate_interfaces Animation of the interfaces
    if nargin < 6
        c = 1;
    end
    
    
    F1 = griddedInterpolant({x, t}, h(1:end/2,:));
    F2 = griddedInterpolant({x, t}, h(1+end/2:end,:));
    
    fr = 10;
    tNew = 0:1/fr/c:t(end);
    %tNew = t;
    temp = 1;
    xNew = x(temp:temp:end);
    
    hNew = [F1({xNew,tNew}); F2({xNew,tNew})];
    
    plot_interfaces(xNew,hNew(:,1),H1,H2);
    
    set(gcs,'nextplot','replaceshildren');
    
    pause(1)
    
    for tI = 2:1:length(tNew)
        tic
        plot_interfaces(xNew,hNew(:,tI),H1,H2);
        pause(max(0,1/fr-toc))
        %pause(1/fr);
    end
end