% Main script for the dispersion relation section

% Stable
figure;
plot_dispersion_relation(1/3,2/3,1,1,1,1,1,3);
axis([0,3,-0.5,0]);

figure;
plot_eigenfunctions([0.1;0],1,1/3,2/3,1,1,1,1,1);
title('The most unstable mode 1 Eigenfunction')

% Unstable: Flux
figure;
plot_dispersion_relation(0.35,0.55,1.5,2,1,1,1,3);
axis([0,3,-0.04,0.04])

figure;
plot_eigenfunctions([0.1;0],1,0.35,0.55,1.5,2.0,1,1,1);
title('The least stable mode 1 Eigenfunction')

% Unstable: M-P
figure;
plot_dispersion_relation(0.5,0.6,0.5,1,1,1,1,3);
axis([0,3,-0.04,0.04])

figure;
plot_eigenfunctions([0.06;0],1,0.5,0.6,0.5,1,1,1,1);
title('The least stable mode 1 Eigenfunction')

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

%% Regions - causes of instability

figure;
plot_regions_h(1,0.5,1,1,1,1);


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

figure;
hold on;
for H2 = 0.62:0.001:0.65
    nf = 101;
    omega = zeros(2,nf);
    k = linspace(0,3,nf);
    
    for j = 1: nf
        omega(:,j) = compute_dispersion_relation(k(j),0.52,H2,0.5,1,1,1,1);
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
plot_stability_m(1,0.2,0.9,1,1,1);

figure;
plot_stability_m(1,0.5,0.95,1,1,1);




%% M - Close to wall
figure;
plot_stability_m(1,0.6,0.9,1,1,1);
plot_stability_m(1,0.6,0.95,1,1,1);
plot_stability_m(1,0.5,0.95,1,1,1);
plot_stability_m(1,0.5,0.99,1,1,1);
plot_stability_m(1,0.5,0.999,1,1,1);

%% M - Regions

figure;
plot_regions_m(1,0.35,0.55,1,1,1);

figure;
plot_regions_m(1,0.5,0.6,1,1,1);

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