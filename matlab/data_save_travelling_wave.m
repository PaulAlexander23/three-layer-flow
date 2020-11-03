function data_save_travelling_wave(x, y, H1, H2, m2, m3, s1, s2, Q)

    filename = data_filename_travelling_wave(x, H1, H2, m2, m3, s1, s2, Q);

    save(filename, "x", "y", "H1", "H2", "m2", "m3", "s1", "s2", "Q");
end
