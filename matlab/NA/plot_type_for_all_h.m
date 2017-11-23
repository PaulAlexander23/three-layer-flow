function plot_type_for_all_h( H1, H2, m2, m3, Q)
    %PLOT_TYPE_VS_H Summary of this function goes here
    %   Detailed explanation goes here
    
    h = linspace(0,1,200);
    type = nan(length(h));
    
    for i1 = 1:length(h)
        for i2 = i1:length(h)
            type(i1,i2) = max(imag(eig(compute_g_nonlinear(h(i1)-H1, h(i2)-H2, H1, H2, m2, m3, Q))))>0;
        end
    end
    
    bin_map = [1   1   1
        0.5 0.5 0.5];
    colormap(bin_map)
    imagesc(h,h,type'>0);
    set(gca,'Ydir','Normal')
    
    xlabel('h_1')
    ylabel('h_2')
    title('Regions where the Jacobian is ellipitic')
end

