% Driver for the numerical methods

clear;

Q = 2;
H1 = 0.2;
H2 = 0.7;
m2 = 0.8;
m3 = 1.2;
s1 = 10;
s2 = 1;

tFinal = 200;
xCount = 2^6;

[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,tFinal,xCount,@(x) i_double_cos(x,0.01,0));

plot_overview(h,t,x,H1,H2,m2,m3)