% Main script for the dispersion relation section

addpath('../IF/')

% Stable
plot_dispersion_relation_overview(0.4,0.7,0.8,0.7,1,1,1);

% Unstable: M-P
figure
plot_dispersion_relation_overview(0.47,0.65,1.05,0.45,1,1,1);

% Unstable: Flux 
figure
plot_dispersion_relation_overview(0.45,0.6,0.8,0.65,1,1,1);


