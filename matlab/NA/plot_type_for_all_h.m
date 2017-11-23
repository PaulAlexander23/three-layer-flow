function type = plot_type_for_all_h( H1, H2, m2, m3, Q)
    %PLOT_TYPE_VS_H Summary of this function goes here
    %   Detailed explanation goes here
    
    h = linspace(0,1,201);
    type = nan(length(h));
    
    for i1 = 1:length(h)
        for i2 = i1:length(h)
            type(i1,i2) = max(imag(eig(compute_g_nonlinear(h(i1)-H1, h(i2)-H2, H1, H2, m2, m3, Q))))>0;
        end
    end
    
    triMap = [1.0   1.0   1.0
        0.5   0.5   0.5
        0.0   0.0   0.0];
    colormap(triMap)
    imagesc(h,h,type'>0,'alphadata',type'~=0);
    
    set(gca,'YDir','normal');
    colorbar('ticks',[0.125,0.5,0.875],'ticklabels',{'Linearly Stable','M-P Instabilities','Flux Instabilities'})
    caxis([0 1])
    axis equal;
    axis([0,1,0,1])
    
    xlabel('h_1')
    ylabel('h_2')
    title('Regions where the Jacobian is ellipitic')
end