function h = i_single_rand(x)
    h = 0 * x;
    for i = 1:4
        h = h + rand*cos(i*x + rand*2.0*pi);
    end
    h = h / max(abs(h));
    h = 0.5 + 0.1 * h;
end