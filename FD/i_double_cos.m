function h = i_double_cos(x, H1, H2, a, theta, L)
    h = [H1 + a*cos(2*pi*x/L); H2 + a*cos(2*pi*x/L+theta)];
end