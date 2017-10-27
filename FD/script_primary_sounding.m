% Driver for the numerical methods
% Need to remove C

clear;

H1 = 0.4;
H2 = 0.7;

C = zeros(5,81);
% C = [Q, m2, m3, s1, s2];

values = 2.^(-1:1);
C(1,:) = 1;
for i = 2:5
    l = length(values);
    C(i,:) = kron(repmat(values,1,(l)^(i-2)),ones(1,l^(5-i)));
end

inter = i_double_rand(x, 0, 0, 0.1);

plot(x,inter(1:end/2),x,inter(end/2+1:end))

pause
%%
for n = 1:size(C,2)
    
    Q = C(1,n);
    s1 = C(2,n);
    s2 = C(3,n);
    m2 = C(4,n);
    m3 = C(5,n);
    
    [h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,tFinal,xCount,@(x) i_double_rand(x,0.1));
    
    filename = sprintf(sprintf('data/output/evening16october/data-x-%g-t-%g-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',x_length,t_final,H1,H2,m2,m3,s1,s2,Q));
    save(filename);
    
end