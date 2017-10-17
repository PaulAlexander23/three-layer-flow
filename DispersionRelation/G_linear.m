function G = G_linear(H1, H2, m2, m3, s1, s2, Q)

G = zeros(2);

G(1,1) = 0.6e1 * m3 * (-(H2 - 1) * ((H1 ^ 5 * m3 ^ 2) - (3 * m3 ^ 2 * (H2 + 1) * H1 ^ 4) + (2 * m3 ^ 2 * (H2 ^ 2 + H2 + 1) * H1 ^ 3) + (2 * m3 * (H2 - 1) * (H2 + 1) ^ 2 * H1 ^ 2) - 0.2e1 * (((H2 ^ 3 + 2 * H2 ^ 2 + 2 * H2 + 1) * m3) + ((H2 - 1) ^ 3) / 0.2e1) * (H2 - 1) * H1 + ((H2 + 1) * (H2 - 1) ^ 4)) * m2 ^ 3 + m3 * ((m3 * (H2 * m3 + 2 * H2 - 2) * H1 ^ 5) + ((-3 * H2 ^ 2 * m3 ^ 2 - 6 * H2 ^ 2 * m3 + 6 * m3) * H1 ^ 4) + ((2 * H2 ^ 3 * m3 ^ 2 + 4 * H2 ^ 3 * m3 - 4 * m3) * H1 ^ 3) + (((4 * H2 ^ 4 - 4 * H2 ^ 2) * m3 + 2 * H2 ^ 4 - 4 * H2 ^ 2 + 2) * H1 ^ 2) + (((-4 * H2 ^ 5 + 2 * H2 ^ 3 + 2 * H2 ^ 2) * m3) - 0.5e1 * ((H2 - 1) ^ 2) * ((H2 ^ 3) + 0.9e1 / 0.5e1 * H2 + 0.2e1 / 0.5e1)) * H1 + (3 * H2 ^ 6) - (8 * H2 ^ 5) + (10 * H2 ^ 4) - (4 * H2 ^ 3) - (5 * H2 ^ 2) + (4 * H2)) * m2 ^ 2 - 0.2e1 * (m3 ^ 2) * ((-H2 + H1) ^ 2) * (((H2 * m3) + H2 / 0.2e1 - 0.1e1 / 0.2e1) * (H1 ^ 3) + (-(H2 ^ 2 * m3) - (H2 ^ 2) / 0.2e1 - H2 + 0.3e1 / 0.2e1) * (H1 ^ 2) + (-(H2 ^ 3 * m3) - (H2 ^ 3) / 0.2e1 - 0.3e1 / 0.2e1 * (H2 ^ 2) + (3 * H2) - 0.1e1) * H1 + 0.3e1 / 0.2e1 * (H2 ^ 4) - (2 * H2 ^ 3) + 0.5e1 / 0.2e1 * (H2 ^ 2) - (2 * H2)) * m2 + (H2 * m3 ^ 3 * (H1 + H2) * (-H2 + H1) ^ 4)) * m2 * H1 / ((H1 ^ 4 * m3 ^ 2 - 4 * (H2 - 1) * m3 * H1 ^ 3 + (6 * H2 ^ 2 - 6) * m3 * H1 ^ 2 + (-4 * H2 ^ 3 + 4) * m3 * H1 + (H2 - 1) ^ 4) * m2 ^ 2 - 0.2e1 * m3 * (-H2 + H1) * (H1 ^ 3 * m3 + (-H2 * m3 - 2 * H2 + 2) * H1 ^ 2 + (2 * H2 ^ 2 * m3 + H2 ^ 2 + 2 * H2 - 3) * H1 - H2 ^ 3 + 2 * H2 ^ 2 - 3 * H2 + 2) * m2 + (m3 ^ 2 * (-H2 + H1) ^ 4)) ^ 2;

G(1,2) = 6 * m3 * (m2 - m3) * ((H1 ^ 3 * m3 - H1 ^ 2 * H2 * m3 - (H2 - 1) ^ 2 * H1 + H2 ^ 3 - 3 * H2 + 2) * m2 - (H1 + H2) * (-H2 + H1) ^ 2 * m3) * ((H1 ^ 2 * m3 - 2 * H1 * H2 * m3 + (H2 - 1) ^ 2) * m2 - (-H2 + H1) ^ 2 * m3) * H1 ^ 2 * m2 / ((H1 ^ 4 * m3 ^ 2 - 4 * (H2 - 1) * m3 * H1 ^ 3 + (6 * H2 ^ 2 - 6) * m3 * H1 ^ 2 + (-4 * H2 ^ 3 + 4) * m3 * H1 + (H2 - 1) ^ 4) * m2 ^ 2 - 2 * m3 * (-H2 + H1) * (H1 ^ 3 * m3 + (-H2 * m3 - 2 * H2 + 2) * H1 ^ 2 + (2 * H2 ^ 2 * m3 + H2 ^ 2 + 2 * H2 - 3) * H1 - H2 ^ 3 + 2 * H2 ^ 2 - 3 * H2 + 2) * m2 + m3 ^ 2 * (-H2 + H1) ^ 4) ^ 2;

G(2,1) = -6 * m3 * ((H1 ^ 2 * m3 + (-2 * H2 + 2) * H1 + H2 ^ 2 - 1) * m2 - (-H2 + H1) ^ 2 * m3) * (H2 - 1) ^ 2 * ((H1 ^ 3 * m3 - m3 * (H2 + 2) * H1 ^ 2 - (H2 - 1) ^ 2 * H1 + (H2 - 1) ^ 2 * H2) * m2 - m3 * (H1 + H2 - 2) * (-H2 + H1) ^ 2) * (m2 - 1) * m2 / ((H1 ^ 4 * m3 ^ 2 - 4 * (H2 - 1) * m3 * H1 ^ 3 + (6 * H2 ^ 2 * m3 - 6 * m3) * H1 ^ 2 + (-4 * H2 ^ 3 * m3 + 4 * m3) * H1 + (H2 - 1) ^ 4) * m2 ^ 2 - 2 * m3 * (-H2 + H1) * (H1 ^ 3 * m3 + (2 + (-m3 - 2) * H2) * H1 ^ 2 + (-3 + (2 * m3 + 1) * H2 ^ 2 + 2 * H2) * H1 - H2 ^ 3 + 2 * H2 ^ 2 - 3 * H2 + 2) * m2 + m3 ^ 2 * (-H2 + H1) ^ 4) ^ 2;

G(2,2) = 0.6e1 * m3 * ((H1 * (H1 ^ 5 * m3 ^ 2 - m3 * ((m3 + 2) * H2 + m3 - 2) * H1 ^ 4 + 2 * m3 * (H2 + 4) * (H2 - 1) * H1 ^ 3 + 2 * (H2 - 1) * (H2 ^ 2 + (-2 - 4 * m3) * H2 - 5 * m3 + 1) * H1 ^ 2 + (-3 * H2 ^ 4 + 6 * H2 ^ 3 + 8 * H2 ^ 2 * m3 + (-4 * m3 - 6) * H2 + 3 - 4 * m3) * H1 + (H2 ^ 2 + 4 * H2 + 1) * (H2 - 1) ^ 3) * m2 ^ 3) + (-(3 * H1 ^ 6 * m3 ^ 2) + (((5 * m3 ^ 2 + 4 * m3) * H2 + 5 * m3 ^ 2 - 4 * m3) * H1 ^ 5) - 0.2e1 * m3 * (((m3 + 2) * H2 ^ 2) + (0.11e2 / 0.2e1 * m3 + 0.6e1) * H2 + m3 - 0.8e1) * (H1 ^ 4) + (((-2 - 4 * m3) * H2 ^ 3 + (8 * m3 ^ 2 + 28 * m3 + 6) * H2 ^ 2 + (8 * m3 ^ 2 - 6 * m3 - 6) * H2 - 18 * m3 + 2) * H1 ^ 3) + (((6 * m3 + 3) * H2 ^ 4 + (-12 * m3 - 6) * H2 ^ 3 + (-8 * m3 ^ 2 - 20 * m3) * H2 ^ 2 + (20 * m3 + 6) * H2 + 6 * m3 - 3) * H1 ^ 2) - 0.2e1 * (0.1e1 / 0.2e1 + (m3 + 0.1e1 / 0.2e1) * (H2 ^ 4) + ((2 * m3 + 1) * H2 ^ 3) + ((-6 * m3 - 3) * H2 ^ 2) + ((1 - 2 * m3) * H2)) * (H2 - 1) * H1 + (H2 * (H2 + 1) * (H2 - 1) ^ 3)) * (m2 ^ 2) + 0.3e1 * m3 * ((H1 ^ 4 * m3) + ((-m3 / 0.3e1 - 0.2e1 / 0.3e1) * H2 - 0.7e1 / 0.3e1 * m3 + 0.2e1 / 0.3e1) * (H1 ^ 3) + ((-m3 / 0.3e1 - 0.2e1 / 0.3e1) * (H2 ^ 2) + (0.8e1 / 0.3e1 * m3 + 0.10e2 / 0.3e1) * H2 + 0.4e1 / 0.3e1 * m3 - 0.8e1 / 0.3e1) * (H1 ^ 2) + (0.8e1 / 0.3e1 + (m3 / 0.3e1 + 0.2e1 / 0.3e1) * (H2 ^ 3) + (m3 / 0.3e1 - 0.2e1 / 0.3e1) * (H2 ^ 2) + (-0.8e1 / 0.3e1 * m3 - 0.8e1 / 0.3e1) * H2) * H1 - 0.2e1 / 0.3e1 * (H2 ^ 3) + 0.4e1 / 0.3e1 * (H2 ^ 2) - 0.2e1 / 0.3e1) * ((-H2 + H1) ^ 2) * m2 - (m3 ^ 2 * (H1 - 1) * (H1 + H2 - 2) * (-H2 + H1) ^ 4)) * (H2 - 1) * m2 / (((H1 ^ 4 * m3 ^ 2 - 4 * (H2 - 1) * m3 * H1 ^ 3 + (6 * H2 ^ 2 * m3 - 6 * m3) * H1 ^ 2 + (-4 * H2 ^ 3 * m3 + 4 * m3) * H1 + (H2 - 1) ^ 4) * m2 ^ 2 - 2 * m3 * (-H2 + H1) * (H1 ^ 3 * m3 + (2 + (-m3 - 2) * H2) * H1 ^ 2 + (-3 + (2 * m3 + 1) * H2 ^ 2 + 2 * H2) * H1 - H2 ^ 3 + 2 * H2 ^ 2 - 3 * H2 + 2) * m2 + m3 ^ 2 * (-H2 + H1) ^ 4) ^ 2);

end
