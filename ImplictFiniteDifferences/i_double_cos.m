function h = i_double_cos(x, H_1, H_2, a, theta, L)
    h = [H_1 + a*cos(2*pi*x/L); H_2 + a*cos(2*pi*x/L+theta)];
end