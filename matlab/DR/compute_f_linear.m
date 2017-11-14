function f = compute_f_linear(H1, H2, m2, m3, s1, s2)
    %compute_f_linear Computes the matrix F in the linearised system

    f = [(0.3e1 * (((H1 ^ 2) + ((-H2 - 1) * H1) + (H2 ^ 2) / 0.3e1 + H2 / 0.3e1 + 0.1e1 / 0.3e1) * H1 * m3 - ((H2 - 1) ^ 3) / 0.3e1) * (H2 - 1) * m2 ^ 2 + m3 * (-H2 + H1) * (H1 * ((-H2 + H1) ^ 2) * m3 - 0.4e1 * (H2 - 1) * ((H1 ^ 2) + (-0.3e1 / 0.2e1 - H2 / 0.2e1) * H1 + (H2 ^ 2) / 0.2e1 - H2 / 0.2e1 + 0.1e1)) * m2 - m3 ^ 2 * ((-H2 + H1) ^ 4)) * (H1 ^ 3) * s1 / ((0.3e1 * (H1 ^ 4) * m3 ^ 2 + ((-12 * H2 + 12) * H1 ^ 3 + (18 * H2 ^ 2 - 18) * H1 ^ 2 + (-12 * H2 ^ 3 + 12) * H1) * m3 + (3 * (H2 - 1) ^ 4)) * m2 ^ 2 - 0.6e1 * (-H2 + H1) * m3 * (H1 * (H1 ^ 2 - H1 * H2 + 2 * H2 ^ 2) * m3 - 0.2e1 * (H2 - 1) * ((H1 ^ 2) + (-0.3e1 / 0.2e1 - H2 / 0.2e1) * H1 + (H2 ^ 2) / 0.2e1 - H2 / 0.2e1 + 0.1e1)) * m2 + 0.3e1 * m3 ^ 2 * ((-H2 + H1) ^ 4)) 0.3e1 * (((H1 ^ 2) * (H1 - H2 / 0.3e1 - 0.2e1 / 0.3e1) * m3 + ((H2 - 1) ^ 2 * (H1 - 3 * H2)) / 0.3e1) * m2 - ((H1 ^ 2) + (0.2e1 / 0.3e1 * H2 - 0.2e1 / 0.3e1) * H1 + (H2 ^ 2) - (2 * H2)) * m3 * (-H2 + H1)) * (H1 ^ 2) * s2 * m2 * ((H2 - 1) ^ 2) / ((0.6e1 * (H1 ^ 4) * m3 ^ 2 + ((-24 * H2 + 24) * H1 ^ 3 + (36 * H2 ^ 2 - 36) * H1 ^ 2 + (-24 * H2 ^ 3 + 24) * H1) * m3 + (6 * (H2 - 1) ^ 4)) * m2 ^ 2 - 0.12e2 * (-H2 + H1) * m3 * (H1 * (H1 ^ 2 - H1 * H2 + 2 * H2 ^ 2) * m3 - 0.2e1 * (H2 - 1) * ((H1 ^ 2) + (-0.3e1 / 0.2e1 - H2 / 0.2e1) * H1 + (H2 ^ 2) / 0.2e1 - H2 / 0.2e1 + 0.1e1)) * m2 + 0.6e1 * m3 ^ 2 * ((-H2 + H1) ^ 4)); 0.3e1 * (((H1 ^ 2) * (H1 - H2 / 0.3e1 - 0.2e1 / 0.3e1) * m3 + ((H2 - 1) ^ 2 * (H1 - 3 * H2)) / 0.3e1) * m2 - ((H1 ^ 2) + (0.2e1 / 0.3e1 * H2 - 0.2e1 / 0.3e1) * H1 + (H2 ^ 2) - (2 * H2)) * m3 * (-H2 + H1)) * (H1 ^ 2) * s1 * m2 * ((H2 - 1) ^ 2) / ((0.6e1 * (H1 ^ 4) * m3 ^ 2 + ((-24 * H2 + 24) * H1 ^ 3 + (36 * H2 ^ 2 - 36) * H1 ^ 2 + (-24 * H2 ^ 3 + 24) * H1) * m3 + (6 * (H2 - 1) ^ 4)) * m2 ^ 2 - 0.12e2 * (-H2 + H1) * m3 * (H1 * (H1 ^ 2 - H1 * H2 + 2 * H2 ^ 2) * m3 - 0.2e1 * (H2 - 1) * ((H1 ^ 2) + (-0.3e1 / 0.2e1 - H2 / 0.2e1) * H1 + (H2 ^ 2) / 0.2e1 - H2 / 0.2e1 + 0.1e1)) * m2 + 0.6e1 * m3 ^ 2 * ((-H2 + H1) ^ 4)) s2 * ((H2 - 1) ^ 3) * (H1 * ((H1 ^ 3) * m3 + ((-H2 + 1) * H1 ^ 2) + ((3 * H2 ^ 2 - 3 * H2) * H1) - (3 * H2 ^ 3) + (3 * H2 ^ 2)) * m2 ^ 2 - 0.2e1 * ((H1 ^ 3) * m3 + (0.1e1 / 0.2e1 + (-m3 - 0.1e1 / 0.2e1) * H2) * (H1 ^ 2) + ((0.2e1 * m3 + 0.1e1) * (H2 ^ 2) - H2) * H1 - (H2 ^ 2 * (H2 - 1)) / 0.2e1) * (-H2 + H1) * m2 + m3 * ((-H2 + H1) ^ 4)) / ((0.3e1 * (H1 ^ 4) * m3 ^ 2 - 0.12e2 * m3 * (H2 - 1) * (H1 ^ 3) + (0.18e2 * (H2 ^ 2) * m3 - 0.18e2 * m3) * (H1 ^ 2) + (-0.12e2 * (H2 ^ 3) * m3 + 0.12e2 * m3) * H1 + (3 * (H2 - 1) ^ 4)) * m2 ^ 2 - 0.6e1 * m3 * (-H2 + H1) * ((H1 ^ 3) * m3 + (0.2e1 + (-m3 - 0.2e1) * H2) * (H1 ^ 2) + (-0.3e1 + (0.2e1 * m3 + 0.1e1) * (H2 ^ 2) + (2 * H2)) * H1 - (H2 ^ 3) + (2 * H2 ^ 2) - (3 * H2) + 0.2e1) * m2 + 0.3e1 * m3 ^ 2 * ((-H2 + H1) ^ 4));];
    
end