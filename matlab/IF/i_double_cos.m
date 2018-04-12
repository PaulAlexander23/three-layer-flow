function h = i_double_cos(x, a, theta)
    h = a * [cos(x); cos(x+theta)];
    %h = [a(1)*cos(x); a(2)*cos(x+theta)];
end