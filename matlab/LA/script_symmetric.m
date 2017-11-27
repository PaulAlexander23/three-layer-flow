
plot_dispersion_relation_overview(0.4,0.6,0.8,1,1,1,1);

figure
plot_dispersion_relation_overview(0.49,0.51,0.8,1,1,1,1);


%%

figure
plot_dispersion_relation_varying_h(0.5,1,1,1,1);
title('Regions of stability for the symmetric case with m_2 = 0.5')

figure
plot_dispersion_relation_varying_h(2,1,1,1,1);
title('Regions of stability for the symmetric case with m_2 = 2')

%%

figure
plot_dispersion_relation_varying_m(0.45,0.55,1,1,1);
title({'Regions of stability for the symmetric case with',...
    'H_1 = 0.45 and H_2 = 0.55'})