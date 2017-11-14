function plot_interface_type(interface,Q, H1, H2, m2, m3)
    %PLOT_INTERFACE_TYPE Summary of this function goes here
    %   Detailed explanation goes here
    
    x = linspace(0,2*pi);
    y = interface(x);
    
    type = zeros(length(x),1);
    
    for x_i = 1:length(x)
            type(x_i) = max(imag(eig(compute_g_nonlinear(y(x_i), y(x_i+end/2), Q, H1, H2, m2, m3))))>0;
    end
    
    bin_map = [1   1   1
        0.5 0.5 0.5];
    colormap(bin_map)
    imagesc(x,0,type'>0);
    
    xlabel('x')
    title('Regions where the Jacobian is ellipitic')
end

