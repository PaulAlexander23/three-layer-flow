% Main script for the dispersion relation section

%% Dispersion - Flux regions

% Regions low middle viscosity
figure;
plot_stability_h(1,0.5,1,1,1,1);

% Regions high middle viscosity
figure;
plot_stability_h(1,2,1,1,1,1);

% Regions low top viscosity
figure;
plot_stability_h(1,1,0.5,1,1,1);

% Regions low top viscosity
figure;
plot_stability_h(1,1,2,1,1,1);

% Regions mixed viscosity
figure;
plot_stability_h(1,0.5,0.25,1,1,1);

% Regions mixed viscosity
figure;
plot_stability_h(1,2,0.5,1,1,1);

% Regions mixed viscosity
figure;
plot_stability_h(1,0.5,2,1,1,1);


%% Transition dispersion relation

figure;
hold on;
for H1 = 0.48:0.005:0.52
    nf = 101;
    omega = zeros(2,nf);
    k = linspace(0,3,nf);
    for j = 1: nf
        omega(:,j) = compute_dispersion_relation(k(j),H1,0.6,0.5,1,1,1,1);
    end 
    plot(k,max(real(omega)))
end
xlabel('k')
ylabel('Re(\omega)')
title('The Dispersion Relation')

%% How Q affects things

figure;
i = 1;
for Q = logspace(-2,1,4)
    subplot(2,2,i);
    plot_stability_h(1,0.5,1,1,1,Q);
    colorbar('off')
    title(sprintf('Q = %g',Q))
    i = i + 1;
end

figure;
i = 1;
for Q = logspace(-2,1,4)
    subplot(2,2,i);
    plot_regions_h(1,2,1,1,1,Q);
    colorbar('off')
    title(sprintf('Q = %g',Q))
    i = i + 1;
end

%% M

figure;
plot_stability_m(1,0.5,0.6,1,1,1);

figure;
plot_stability_m(1,0.3,0.85,1,1,1);

figure;
plot_stability_m(1,0.6,0.95,1,1,1);




%% M - Close to wall
figure;
plot_stability_m(1,0.6,0.9,1,1,1);
plot_stability_m(1,0.6,0.95,1,1,1);
plot_stability_m(1,0.5,0.95,1,1,1);
plot_stability_m(1,0.5,0.99,1,1,1);
plot_stability_m(1,0.5,0.999,1,1,1);

%% M - Q

figure;
i = 1;
for Q = logspace(-2,1,4)
    subplot(2,2,i);
    plot_stability_m(1,0.5,0.6,1,1,Q);
    colorbar('off')
    title(sprintf('Q = %g',Q))
    i = i + 1;
end