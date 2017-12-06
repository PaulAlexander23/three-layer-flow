function plot_stability_regions_in_time(h, t, x, H1, H2, m2, m3, s1, s2, Q)
    %PLOT_STABILITY_REGIONS_IN_TIME Calculates the different regions of
    %stability and plots them as they evolve in time
    
    F1 = griddedInterpolant({x, t}, h(1:end/2,:));
    F2 = griddedInterpolant({x, t}, h(1+end/2:end,:));
    
    tNew = linspace(0,t(end),400);
    temp = 2;
    xNew = x(temp:temp:end);
    
    hNew = [F1({xNew,tNew}); F2({xNew,tNew})];
    
    k = 1:5;
    
    omegaDR = zeros(length(xNew), length(tNew));
    omegaG = zeros(length(xNew), length(tNew));
    
    for t_i = 1:length(tNew)
        for x_i = 1:length(xNew)
            omegaDR(x_i,t_i) = max(max(real(...
                compute_dispersion_relation(k,H1 + hNew(x_i,t_i),H2 + hNew(x_i+end/2,t_i),m2,m3,s1,s2,Q))));
            omegaG(x_i,t_i) = max(imag(eig(...
                compute_g_linear(H1 + hNew(x_i,t_i),H2 + hNew(x_i+end/2,t_i),m2,m3,Q))));
        end
    end
    
    type = 0.5 * (omegaDR>0);
    type(omegaG>0) = 1;
    
    triMap = [
        1.0   1.0   1.0
        0.5   0.5   0.5
        0.0   0.0   0.0];
    colormap(triMap)
    imagesc(xNew,tNew,type');
    
    set(gca,'YDir','normal');
    colorbar('ticks',[0.125,0.5,0.875],'ticklabels',{'Linearly Stable','M-P Instabilities','Flux Instabilities'})
    caxis([0 1])
    
    xlabel('x')
    ylabel('t')
    title({'Plot of the regions of instability.'})
end