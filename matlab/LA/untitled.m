% DR - Flux - Surface Tension

figure;
hold on;
for H1 = [0.45,0.5,0.55]
    nf = 101;
    omega = zeros(2,nf);
    k = linspace(0,20,nf);
    for j = 1: nf
        omega(:,j) = compute_dispersion_relation(k(j),H1,0.6,0.5,1,1,1,1)-...
            compute_dispersion_relation(k(j),H1,0.6,0.5,1,0,0,1)-... % Flux
            compute_dispersion_relation(k(j),H1,0.6,0.5,1,1,1,0);    % Surface Tension
    end 
    plot(k,max(real(omega)))
end
xlabel('k')
ylabel('Re(\omega)')
title('The Dispersion Relation')
legend('Stable','Madja-Pego','Alpha')

figure;
plot_stability_h(1,0.5,1,1,1,1);
hold on
plot(0.45,0.6,'xk')
plot(0.55,0.6,'xw')
plot(0.5,0.6,'xk')