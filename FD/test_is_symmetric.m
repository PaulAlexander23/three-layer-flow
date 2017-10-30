

Q = 1;
H1 = 0.3;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;

tFinal = 200;
xCount = 2^6;

i_custom = @(x) [0.1*cos(x), zeros(size(x))];
i_custom_2 = @(x) [zeros(size(x)), -0.1*cos(x)];

[h,~,t] = compute_numerical_solution(H1, H2, m2, m3, s1, s2, Q, tFinal, xCount, i_custom);

[h2,x,t2] = compute_numerical_solution(H1, H2, m2, m3, s2, s1, Q, tFinal, xCount, i_custom_2);


norm(h(:,1)+[h2(end/2+1:end,1); h2(1:end/2,1)])*sqrt(x(2)-x(1))
norm(h(:,end)+[h2(end/2+1:end,end); h2(1:end/2,end)])*sqrt(x(2)-x(1))