function filename = data_filename_travelling_wave(x, H1, H2, m2, m3, s1, s2, Q)

    filename = sprintf('data-h-%g-%g-m-%g-%g-s-%g-%g-Q-%g-xN-%g-xL-%g.mat',...
        H1, H2, m2, m3, s1, s2, Q, length(x), x(end));
end
