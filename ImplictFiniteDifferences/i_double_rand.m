function h = i_double_rand(x, H_1, H_2, a)
    h = [0 * x, 0 * x];
    for i = 1/20:1/20:1/4
        h = h + [rand*cos(i*x + rand*2.0*pi); rand*cos(i*x + rand*2.0*pi)];
    end
    h = h ./ max(max(abs(h)));
    h = [H_1 + a * h(:,1), H_2 + a * h(:,2)];
end