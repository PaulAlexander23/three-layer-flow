%SCRIPT_PRIMARY_SOUNDING 


clear;

tFinal = 300;
xCount = 2^5;
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


for n = 1:size(C,2)
    
    Q = C(1,n);
    s1 = C(2,n);
    s2 = C(3,n);
    m2 = C(4,n);
    m3 = C(5,n);
    
    [h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,tFinal,xCount,@(x) i_double_rand_fixed(x,0.1));
    
    filename = sprintf(sprintf('../data/sounding/data-x-%g-t-%g-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',xCount,tFinal,H1,H2,m2,m3,s1,s2,Q));
    save(filename);
    
end