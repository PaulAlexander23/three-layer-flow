

H1 = 0.3;
H2 = 0.7;
m2 = 2;
m3 = 1;
s1 = 0.1;
s2 = 10;
Q = 1;
tFinal = 10;



[h,x,t] = compute_numerical_solution(H1, H2, m2, m3, s1, s2, Q, tFinal);

[h2,x,t2] = compute_numerical_solution(H1, H2, m2, m3, s2, s1, Q, tFinal);


norm(h(:,end)-[h(end/2+1:end,end); h(1:end/2,end)])*(x(2)-x(1))

norm(h(:,end)-h2(:,end))*(x(2)-x(1))

norm(h(:,end)-[h2(end/2+1:end,end); h2(1:end/2,end)])*(x(2)-x(1))