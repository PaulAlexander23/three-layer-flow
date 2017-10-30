function [ G ] = compute_g_nonlinear(y1, y2, Q, H1, H2, m2, m3)
    %compute_g_nonlinear Returns the matrix G for the nonlinear problem
    
    G = [-0.6e1 * Q * m2 * ((m2 - m3) ^ 3 * (H2 + y2) ^ 6 - 0.2e1 * (m2 - m3) ^ 2 * (((m3 + 0.1e1 / 0.2e1) * m2 - 0.3e1 / 0.2e1 * m3) * (H1 + y1) + 0.2e1 * m2) * (H2 + y2) ^ 5 + 0.2e1 * (m2 - m3) ^ 2 * (m3 * (m2 - 0.1e1) * (H1 + y1) ^ 2 + 0.5e1 / 0.2e1 * (H1 + y1) * m2 + 0.5e1 / 0.2e1 * m2) * (H2 + y2) ^ 4 + 0.2e1 * (m2 - m3) * (m3 ^ 2 * (m2 - 0.1e1) ^ 2 * (H1 + y1) ^ 3 + m2 * ((m3 - 0.5e1) * m2 + 0.2e1 * m3) * (H1 + y1) + 0.2e1 * m2 * m3) * (H2 + y2) ^ 3 - 0.3e1 * (m2 - m3) * (m3 ^ 2 * (m2 - 0.1e1) ^ 2 * (H1 + y1) ^ 4 + 0.4e1 / 0.3e1 * m2 * m3 * (m2 - 0.1e1) * (H1 + y1) ^ 2 - 0.2e1 / 0.3e1 * m2 * ((m3 + 0.5e1) * m2 - 0.3e1 * m3) * (H1 + y1) + 0.5e1 / 0.3e1 * m2 ^ 2) * (H2 + y2) ^ 2 + (m2 - m3) * (m3 ^ 2 * (m2 - 0.1e1) ^ 2 * (H1 + y1) ^ 5 - 0.5e1 * (H1 + y1) * m2 ^ 2 + 0.4e1 * m2 ^ 2) * (H2 + y2) - m2 * (H1 + y1 - 0.1e1) * (m3 * (m2 - 0.1e1) * (H1 + y1) ^ 2 + m2) * (m3 * (m2 - 0.1e1) * (H1 + y1) ^ 2 - 0.2e1 * m3 * (m2 - 0.1e1) * (H1 + y1) - m2)) * m3 * (H1 + y1) / ((m2 - m3) ^ 2 * (H2 + y2) ^ 4 - 0.4e1 * (m2 - m3) * (m3 * (m2 - 0.1e1) * (H1 + y1) + m2) * (H2 + y2) ^ 3 + 0.6e1 * (m2 - m3) * (m3 * (m2 - 0.1e1) * (H1 + y1) ^ 2 + m2) * (H2 + y2) ^ 2 - 0.4e1 * (m2 - m3) * (m3 * (m2 - 0.1e1) * (H1 + y1) ^ 3 + m2) * (H2 + y2) + m3 ^ 2 * (m2 - 0.1e1) ^ 2 * (H1 + y1) ^ 4 + 0.4e1 * m2 * m3 * (m2 - 0.1e1) * (H1 + y1) ^ 3 - 0.6e1 * m2 * m3 * (m2 - 0.1e1) * (H1 + y1) ^ 2 + 0.4e1 * m2 * m3 * (m2 - 0.1e1) * (H1 + y1) + m2 ^ 2) ^ 2,...
         6 * Q * m2 * (H2 + y2 - 1) ^ 2 * (m2 - 1) * (m3 * (m2 - 1) * (H1 + y1) ^ 3 - m3 * (H2 + y2 + 2) * (m2 - 1) * (H1 + y1) ^ 2 + ((-m2 + m3) * (H2 + y2) ^ 2 + (2 * m2 - 4 * m3) * (H2 + y2) - m2) * (H1 + y1) + (H2 + y2) * ((m2 - m3) * (H2 + y2) ^ 2 + (-2 * m2 + 2 * m3) * (H2 + y2) + m2)) * m3 * (m3 * (m2 - 1) * (H1 + y1) ^ 2 + ((-2 * m2 + 2 * m3) * (H2 + y2) + 2 * m2) * (H1 + y1) + (m2 - m3) * (H2 + y2) ^ 2 - m2) / (m3 ^ 2 * (m2 - 1) ^ 2 * (H1 + y1) ^ 4 - 4 * (m2 - 1) * m3 * ((m2 - m3) * (H2 + y2) - m2) * (H1 + y1) ^ 3 + 6 * (m2 - 1) * m3 * ((m2 - m3) * (H2 + y2) ^ 2 - m2) * (H1 + y1) ^ 2 - 4 * (m2 - 1) * m3 * ((m2 - m3) * (H2 + y2) ^ 3 - m2) * (H1 + y1) + (m2 - m3) ^ 2 * (H2 + y2) ^ 4 - 4 * m2 * (m2 - m3) * (H2 + y2) ^ 3 + 6 * m2 * (m2 - m3) * (H2 + y2) ^ 2 - 4 * m2 * (m2 - m3) * (H2 + y2) + m2 ^ 2) ^ 2;...
         6 * Q * m2 * (m2 - m3) * ((m2 - m3) * (H2 + y2) ^ 3 - (H1 + y1) * (m2 - m3) * (H2 + y2) ^ 2 + (-m3 * (m2 - 1) * (H1 + y1) ^ 2 + 2 * (H1 + y1) * m2 - 3 * m2) * (H2 + y2) + m3 * (m2 - 1) * (H1 + y1) ^ 3 - (H1 + y1) * m2 + 2 * m2) * m3 * ((m2 - m3) * (H2 + y2) ^ 2 + (-2 * m3 * (m2 - 1) * (H1 + y1) - 2 * m2) * (H2 + y2) + m3 * (m2 - 1) * (H1 + y1) ^ 2 + m2) * (H1 + y1) ^ 2 / ((m2 - m3) ^ 2 * (H2 + y2) ^ 4 - 4 * (m2 - m3) * (m3 * (m2 - 1) * (H1 + y1) + m2) * (H2 + y2) ^ 3 + 6 * (m2 - m3) * (m3 * (m2 - 1) * (H1 + y1) ^ 2 + m2) * (H2 + y2) ^ 2 - 4 * (m2 - m3) * (m3 * (m2 - 1) * (H1 + y1) ^ 3 + m2) * (H2 + y2) + m3 ^ 2 * (m2 - 1) ^ 2 * (H1 + y1) ^ 4 + 4 * m2 * m3 * (m2 - 1) * (H1 + y1) ^ 3 - 6 * m2 * m3 * (m2 - 1) * (H1 + y1) ^ 2 + 4 * m2 * m3 * (m2 - 1) * (H1 + y1) + m2 ^ 2) ^ 2,...
         -0.6e1 * Q * m2 * ((m3 ^ 2 * (m2 - 1) ^ 3 * (H1 + y1) ^ 6) - ((m2 - 1) ^ 2 * m3 * (((m3 + 2) * m2 - 3 * m3) * (H2 + y2) + (m3 - 2) * m2 - 3 * m3) * (H1 + y1) ^ 5) + 0.2e1 * (((m2 - m3) * (H2 + y2) ^ 2) + ((3 * m2) - 0.11e2 / 0.2e1 * m3) * (H2 + y2) - (4 * m2) - m3) * ((m2 - 1) ^ 2) * m3 * ((H1 + y1) ^ 4) - 0.8e1 * (-((m2 - m3) ^ 2 * (H2 + y2) ^ 3) / 0.4e1 + ((m3 + 0.3e1 / 0.4e1) * m2 - 0.7e1 / 0.4e1 * m3) * (m2 - m3) * ((H2 + y2) ^ 2) + ((m3 / 0.4e1 - 0.3e1 / 0.4e1) * (m2 ^ 2) + ((-m3 ^ 2 + m3) * m2) + (m3 ^ 2)) * (H2 + y2) + (-0.5e1 / 0.4e1 * m3 + 0.1e1 / 0.4e1) * (m2 ^ 2) + (m2 * m3)) * (m2 - 1) * ((H1 + y1) ^ 3) + 0.8e1 * (m2 - 1) * (-0.3e1 / 0.8e1 * ((m2 - m3) ^ 2) * ((H2 + y2) ^ 4) + 0.3e1 / 0.4e1 * ((m2 - m3) ^ 2) * ((H2 + y2) ^ 3) + (m2 - m3) * (m2 - 0.3e1 / 0.2e1) * m3 * ((H2 + y2) ^ 2) - m2 * ((m3 + 0.3e1 / 0.2e1) * m2 - (4 * m3)) * (H2 + y2) / 0.2e1 - m2 * ((m3 - 0.3e1 / 0.4e1) * m2 - m3 / 0.2e1) / 0.2e1) * ((H1 + y1) ^ 2) + ((m2 - 1) * ((m2 - m3) ^ 2 * (H2 + y2) ^ 5 + (m2 - m3) ^ 2 * (H2 + y2) ^ 4 - 8 * (m2 - m3) ^ 2 * (H2 + y2) ^ 3 + 8 * m2 * (m2 - m3) * (H2 + y2) ^ 2 - m2 * (m2 + 4 * m3) * (H2 + y2) - m2 ^ 2) * (H1 + y1)) + ((H2 + y2) * ((m2 - m3) * (H2 + y2) ^ 2 - m2) * ((m2 - m3) * (H2 + y2) ^ 2 + (-2 * m2 + 2 * m3) * (H2 + y2) + m2))) * (H2 + y2 - 1) * m3 / ((m3 ^ 2 * (m2 - 1) ^ 2 * (H1 + y1) ^ 4 - 4 * (m2 - 1) * m3 * ((m2 - m3) * (H2 + y2) - m2) * (H1 + y1) ^ 3 + 6 * (m2 - 1) * m3 * ((m2 - m3) * (H2 + y2) ^ 2 - m2) * (H1 + y1) ^ 2 - 4 * (m2 - 1) * m3 * ((m2 - m3) * (H2 + y2) ^ 3 - m2) * (H1 + y1) + (m2 - m3) ^ 2 * (H2 + y2) ^ 4 - 4 * m2 * (m2 - m3) * (H2 + y2) ^ 3 + 6 * m2 * (m2 - m3) * (H2 + y2) ^ 2 - 4 * m2 * (m2 - m3) * (H2 + y2) + m2 ^ 2) ^ 2)];
    
end