%SCRIPT_EXPLORE_PHASE_SPACE Using the phase space and the qualitative changes
%in the linear analysis the nonlinear numerical solution is explored.

for i = 2:size(C,1)
    [h,x,t]=compute_numerical_solution(C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q,...
        @(x) i_eigenfunction(x,C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q,[C(i,5),C(i,5)],1,0),...
        tFinal,2*pi,2^7,1e-9);
    
    filename = sprintf('data/data-x-%g-t-%g-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',2^7,tFinal,C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q);
    save(filename);
end


%%
for i = 2:size(C,1)-1
    filename = sprintf('data/data-x-%g-t-%g-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',2^7,tFinal,C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q);
    load(filename);
    
    plot_overview(h,t,x,C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q)
    
    pause()
    
    close all
end
