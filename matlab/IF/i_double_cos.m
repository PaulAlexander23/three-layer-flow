function h = i_double_cos(x, a, theta)
    %h = [a*cos(2*pi*x); zeros(size(x))];% a*cos(2*pi*x+theta)];
    h = [a*cos(x); a*cos(x+theta)];
end