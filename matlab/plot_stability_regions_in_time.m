function plot_stability_regions_in_time(h, t, x, H1, H2, m2, m3, s1, s2, Q, trange)
    %PLOT_STABILITY_REGIONS_IN_TIME Calculates the different regions of
    %stability and plots them as they evolve in time
    if nargin<11
       trange = [min(t),max(t)];
    end
    
    F1 = griddedInterpolant({x, t}, h(1:end/2,:));
    F2 = griddedInterpolant({x, t}, h(1+end/2:end,:));
    
    tNew = linspace(trange(1),trange(2),4000);
    temp = 1;
    xNew = x(temp:temp:end);
    
    hNew = [F1({xNew,tNew}); F2({xNew,tNew})];
    
    k = 0.001;
    
    omegaDR = zeros(length(xNew), length(tNew));
    omegaG = zeros(length(xNew), length(tNew));
    
    for t_i = 1:length(tNew)
        v1 = zeros(1,length(xNew));
        v2 = zeros(1,length(xNew));
        for x_i = 1:length(xNew)
            v1(x_i) = max(real(...
                compute_dispersion_relation(k,H1 + hNew(x_i,t_i),H2 + hNew(x_i+end/2,t_i),m2,m3,s1,s2,Q)));
            v2(x_i) = max(real(...
                compute_dispersion_relation(k,H1 + hNew(x_i,t_i),H2 + hNew(x_i+end/2,t_i),m2,m3,0,0,Q)));
        end
        omegaDR(:,t_i) = v1;
        omegaG(:,t_i) = v2;
    end
    
    type = 0.5 * (omegaDR>0);
    type(omegaG>1e-13) = 1;
    
    triMap = [
        1.0   1.0   1.0
        0.5   0.5   0.5
        0.0   0.0   0.0];
    colormap(triMap)
    imagesc(xNew,tNew,type');
    
    set(gca,'YDir','normal');
    %colorbar('ticks',[0.125,0.5,0.875],'ticklabels',{'Linearly Stable','M-P Instabilities','Flux Instabilities'})
    caxis([0 1])
    
    xlabel('$x$')
    ylabel('$t$')
    %title({'Plot of the regions of instability.'})
end