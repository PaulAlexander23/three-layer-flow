function h = i_double_rand(x, H1, H2, a)
    h = [0 * x, 0 * x];
    for i = 1:1:5
        h = h + [rand*cos(i*x + rand*2.0*pi), rand*cos(i*x + rand*2.0*pi)];
    end
    h = h ./ max(max(abs(h)));
    h = [H1 + a * h(:,1); H2 + a * h(:,2)];
end