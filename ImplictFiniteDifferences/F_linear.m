function F = F_linear(H1, H2, m2, m3, sigma1, sigma2, Q)

F = zeros(2);

F(1,1) = -(H1 ^ 3) * (0.3e1 * (H2 - 1) * (((H1 ^ 2) + ((-H2 - 1) * H1) + (H2 ^ 2) / 0.3e1 + H2 / 0.3e1 + 0.1e1 / 0.3e1) * H1 * m3 - ((H2 - 1) ^ 3) / 0.3e1) * m2 ^ 2 + (H1 * ((-H2 + H1) ^ 2) * m3 - 0.4e1 * (H2 - 1) * ((H1 ^ 2) + (-H2 / 0.2e1 - 0.3e1 / 0.2e1) * H1 + (H2 ^ 2) / 0.2e1 - H2 / 0.2e1 + 0.1e1)) * m3 * (-H2 + H1) * m2 - m3 ^ 2 * ((-H2 + H1) ^ 4)) * sigma1 / ((0.3e1 * (H1 ^ 4) * m3 ^ 2 + ((-12 * H2 + 12) * H1 ^ 3 + (18 * H2 ^ 2 - 18) * H1 ^ 2 + (-12 * H2 ^ 3 + 12) * H1) * m3 + (3 * (H2 - 1) ^ 4)) * m2 ^ 2 - 0.6e1 * m3 * ((H1 ^ 2 - H1 * H2 + 2 * H2 ^ 2) * H1 * m3 - 0.2e1 * (H2 - 1) * ((H1 ^ 2) + (-H2 / 0.2e1 - 0.3e1 / 0.2e1) * H1 + (H2 ^ 2) / 0.2e1 - H2 / 0.2e1 + 0.1e1)) * (-H2 + H1) * m2 + 0.3e1 * m3 ^ 2 * ((-H2 + H1) ^ 4));

F(1,2) = -0.3e1 * ((H1 ^ 2 * (H1 - H2 / 0.3e1 - 0.2e1 / 0.3e1) * m3 + (H2 - 0.1e1) ^ 2 * (H1 - 0.3e1 * H2) / 0.3e1) * m2 - m3 * (H1 ^ 2 + (0.2e1 / 0.3e1 * H2 - 0.2e1 / 0.3e1) * H1 + H2 ^ 2 - 0.2e1 * H2) * (-H2 + H1)) * H1 ^ 2 * (H2 - 0.1e1) ^ 2 * sigma2 * m2 / ((0.6e1 * H1 ^ 4 * m3 ^ 2 + ((-0.24e2 * H2 + 0.24e2) * H1 ^ 3 + (0.36e2 * H2 ^ 2 - 0.36e2) * H1 ^ 2 + (-0.24e2 * H2 ^ 3 + 0.24e2) * H1) * m3 + 0.6e1 * (H2 - 0.1e1) ^ 4) * m2 ^ 2 - 0.12e2 * m3 * ((H1 ^ 2 - H1 * H2 + 0.2e1 * H2 ^ 2) * H1 * m3 - 0.2e1 * (H2 - 0.1e1) * (H1 ^ 2 + (-H2 / 0.2e1 - 0.3e1 / 0.2e1) * H1 + H2 ^ 2 / 0.2e1 - H2 / 0.2e1 + 0.1e1)) * (-H2 + H1) * m2 + 0.6e1 * m3 ^ 2 * (-H2 + H1) ^ 4);

F(2,1) = -0.3e1 * ((H1 ^ 2 * (H1 - H2 / 0.3e1 - 0.2e1 / 0.3e1) * m3 + (H2 - 0.1e1) ^ 2 * (H1 - 0.3e1 * H2) / 0.3e1) * m2 - m3 * (H1 ^ 2 + (0.2e1 / 0.3e1 * H2 - 0.2e1 / 0.3e1) * H1 + H2 ^ 2 - 0.2e1 * H2) * (-H2 + H1)) * H1 ^ 2 * (H2 - 0.1e1) ^ 2 * sigma1 * m2 / ((0.6e1 * H1 ^ 4 * m3 ^ 2 + ((-0.24e2 * H2 + 0.24e2) * H1 ^ 3 + (0.36e2 * H2 ^ 2 - 0.36e2) * H1 ^ 2 + (-0.24e2 * H2 ^ 3 + 0.24e2) * H1) * m3 + 0.6e1 * (H2 - 0.1e1) ^ 4) * m2 ^ 2 - 0.12e2 * m3 * ((H1 ^ 2 - H1 * H2 + 0.2e1 * H2 ^ 2) * H1 * m3 - 0.2e1 * (H2 - 0.1e1) * (H1 ^ 2 + (-H2 / 0.2e1 - 0.3e1 / 0.2e1) * H1 + H2 ^ 2 / 0.2e1 - H2 / 0.2e1 + 0.1e1)) * (-H2 + H1) * m2 + 0.6e1 * m3 ^ 2 * (-H2 + H1) ^ 4);

F(2,2) = -((H2 - 1) ^ 3) * sigma2 * ((H1 * (H1 ^ 3 * m3 + (-H2 + 1) * H1 ^ 2 + (3 * H2 ^ 2 - 3 * H2) * H1 - 3 * H2 ^ 3 + 3 * H2 ^ 2) * m2 ^ 2) - 0.2e1 * ((H1 ^ 3 * m3) + (0.1e1 / 0.2e1 + (-m3 - 0.1e1 / 0.2e1) * H2) * (H1 ^ 2) + (((2 * m3 + 1) * H2 ^ 2 - H2) * H1) - (H2 ^ 2 * (H2 - 1)) / 0.2e1) * (-H2 + H1) * m2 + (m3 * (-H2 + H1) ^ 4)) / ((3 * H1 ^ 4 * m3 ^ 2 - 12 * (H2 - 1) * m3 * H1 ^ 3 + (18 * H2 ^ 2 * m3 - 18 * m3) * H1 ^ 2 + (-12 * H2 ^ 3 * m3 + 12 * m3) * H1 + 3 * (H2 - 1) ^ 4) * m2 ^ 2 - 6 * m3 * (-H2 + H1) * (H1 ^ 3 * m3 + (2 + (-m3 - 2) * H2) * H1 ^ 2 + (-3 + (2 * m3 + 1) * H2 ^ 2 + 2 * H2) * H1 - H2 ^ 3 + 2 * H2 ^ 2 - 3 * H2 + 2) * m2 + 3 * m3 ^ 2 * (-H2 + H1) ^ 4);

end
