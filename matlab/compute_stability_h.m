function [unstable, elliptic] = compute_stability_h(y, H1, H2, m2, m3, s1, s2, Q)

    k = 1;

    h1 = H1 + y(1:end/2);
    h2 = H2 + y(1+end/2:end);

    omegaDR = nan(length(h1),1);
    omegaG = nan(length(h1),1);
    
    parfor i = 1:length(h1)
        omegaDR(i,:) = max(real(compute_dispersion_relation(k,h1(i),h2(i),m2,m3,s1,s2,Q)));
        omegaG(i,:) = max(real(compute_dispersion_relation(k,h1(i),h2(i),m2,m3,0,0,Q)));
    end
    
    unstable = zeros(length(h1), 1);
    unstable(omegaDR>0) = 1;
    
    elliptic = zeros(length(h1), 1);
    elliptic(omegaG>1e-13) = 1;
end
