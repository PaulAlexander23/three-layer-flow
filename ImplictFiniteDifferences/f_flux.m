function F = f_flux( y, Q, m2, m3 )
%f_flux rhs for the zero surface tension problem
%   Detailed explanation goes here
global D1
F = [ 6 .* y(:,1) .* ((-(((m2 - m3) .* y(:,2) - m2) .* m3 .^ 2 .* (m2 - 1) .^ 2 .* y(:,1) .^ 5) + (3 .* ((m2 - m3) .* y(:,2) .^ 2 - m2) .* m3 .^ 2 .* (m2 - 1) .^ 2 .* y(:,1) .^ 4) - (2 .* ((m2 - m3) .* y(:,2) .^ 3 - m2) .* m3 .^ 2 .* (m2 - 1) .^ 2 .* y(:,1) .^ 3) - (2 .* ((m2 - m3) .* y(:,2) .^ 2 - m2) .^ 2 .* m3 .* (m2 - 1) .* y(:,1) .^ 2) + (0.2e1 .* ((m3 + 0.1e1 ./ 0.2e1) .* m2 - 0.3e1 ./ 0.2e1 .* m3) .* ((m2 - m3) .^ 2) .* (y(:,2) .^ 5) - (5 .* m2 .* (m2 - m3) .^ 2 .* y(:,2) .^ 4) - (2 .* m2 .* ((m3 - 5) .* m2 + 2 .* m3) .* (m2 - m3) .* y(:,2) .^ 3) - (2 .* ((m3 + 5) .* m2 - 3 .* m3) .* m2 .* (m2 - m3) .* y(:,2) .^ 2) + (5 .* m2 .^ 2 .* (m2 - m3) .* y(:,2)) + ((2 .* m3 - 1) .* m2 .^ 3) - (2 .* m3 .* m2 .^ 2)) .* y(:,1) - (((m2 - m3) .^ 2 .* y(:,2) .^ 4 - 4 .* m2 .* (m2 - m3) .* y(:,2) .^ 3 + 6 .* m2 .* (m2 - m3) .* y(:,2) .^ 2 - 4 .* m2 .* (m2 - m3) .* y(:,2) + m2 .^ 2) .* ((m2 - m3) .* y(:,2) .^ 2 - m2))) .* (D1 * y(:,1)) + (y(:,1) .* (m3 .* (m2 - 1) .* y(:,1) .^ 3 - y(:,2) .* m3 .* (m2 - 1) .* y(:,1) .^ 2 + ((-m2 + m3) .* y(:,2) .^ 2 + 2 .* y(:,2) .* m2 - m2) .* y(:,1) + (m2 - m3) .* y(:,2) .^ 3 - 3 .* y(:,2) .* m2 + 2 .* m2) .* (D1 * y(:,2)) .* (m3 .* (m2 - 1) .* y(:,1) .^ 2 - 2 .* y(:,2) .* m3 .* (m2 - 1) .* y(:,1) + (m2 - m3) .* y(:,2) .^ 2 - 2 .* y(:,2) .* m2 + m2) .* (m2 - m3))) .* m2 .* Q .* m3 ./ ((m3 .^ 2 .* (m2 - 1) .^ 2 .* y(:,1) .^ 4 - 4 .* m3 .* (m2 - 1) .* ((m2 - m3) .* y(:,2) - m2) .* y(:,1) .^ 3 + 6 .* m3 .* ((m2 - m3) .* y(:,2) .^ 2 - m2) .* (m2 - 1) .* y(:,1) .^ 2 - 4 .* m3 .* (m2 - 1) .* ((m2 - m3) .* y(:,2) .^ 3 - m2) .* y(:,1) + (m2 - m3) .^ 2 .* y(:,2) .^ 4 - 4 .* m2 .* (m2 - m3) .* y(:,2) .^ 3 + 6 .* m2 .* (m2 - m3) .* y(:,2) .^ 2 - 4 .* m2 .* (m2 - m3) .* y(:,2) + m2 .^ 2) .^ 2),...
    6 .* m2 .* Q .* m3 .* (y(:,2) - 1) .* (-((m3 .* (m2 - 1) .* y(:,1) .^ 3 - m3 .* (y(:,2) + 2) .* (m2 - 1) .* y(:,1) .^ 2 + ((-m2 + m3) .* y(:,2) .^ 2 + (2 .* m2 - 4 .* m3) .* y(:,2) - m2) .* y(:,1) + ((m2 - m3) .* y(:,2) .^ 2 + (-2 .* m2 + 2 .* m3) .* y(:,2) + m2) .* y(:,2)) .* (m3 .* (m2 - 1) .* y(:,1) .^ 2 + ((-2 .* m2 + 2 .* m3) .* y(:,2) + 2 .* m2) .* y(:,1) + (m2 - m3) .* y(:,2) .^ 2 - m2) .* (y(:,2) - 1) .* (m2 - 1) .* (D1 * y(:,1))) + ((m3 .^ 2 .* (m2 - 1) .^ 3 .* y(:,1) .^ 6) - (m3 .* (((m3 + 2) .* m2 - 3 .* m3) .* y(:,2) + (m3 - 2) .* m2 - 3 .* m3) .* (m2 - 1) .^ 2 .* y(:,1) .^ 5) + 0.2e1 .* (((m2 - m3) .* y(:,2) .^ 2) + ((3 .* m2) - 0.11e2 ./ 0.2e1 .* m3) .* y(:,2) - (4 .* m2) - m3) .* m3 .* ((m2 - 1) .^ 2) .* (y(:,1) .^ 4) - 0.8e1 .* (-((m2 - m3) .^ 2 .* y(:,2) .^ 3) ./ 0.4e1 + ((m3 + 0.3e1 ./ 0.4e1) .* m2 - 0.7e1 ./ 0.4e1 .* m3) .* (m2 - m3) .* (y(:,2) .^ 2) + ((m3 ./ 0.4e1 - 0.3e1 ./ 0.4e1) .* (m2 .^ 2) + ((-m3 .^ 2 + m3) .* m2) + (m3 .^ 2)) .* y(:,2) + (-0.5e1 ./ 0.4e1 .* m3 + 0.1e1 ./ 0.4e1) .* (m2 .^ 2) + (m2 .* m3)) .* (m2 - 1) .* (y(:,1) .^ 3) + 0.8e1 .* (-0.3e1 ./ 0.8e1 .* ((m2 - m3) .^ 2) .* (y(:,2) .^ 4) + 0.3e1 ./ 0.4e1 .* ((m2 - m3) .^ 2) .* (y(:,2) .^ 3) + m3 .* (m2 - 0.3e1 ./ 0.2e1) .* (m2 - m3) .* (y(:,2) .^ 2) - m2 .* ((m3 + 0.3e1 ./ 0.2e1) .* m2 - (4 .* m3)) .* y(:,2) ./ 0.2e1 - m2 .* ((m3 - 0.3e1 ./ 0.4e1) .* m2 - m3 ./ 0.2e1) ./ 0.2e1) .* (m2 - 1) .* (y(:,1) .^ 2) + (((m2 - m3) .^ 2 .* y(:,2) .^ 5 + (m2 - m3) .^ 2 .* y(:,2) .^ 4 - 8 .* (m2 - m3) .^ 2 .* y(:,2) .^ 3 + 8 .* m2 .* (m2 - m3) .* y(:,2) .^ 2 - m2 .* (m2 + 4 .* m3) .* y(:,2) - m2 .^ 2) .* (m2 - 1) .* y(:,1)) + (((m2 - m3) .* y(:,2) .^ 2 + (-2 .* m2 + 2 .* m3) .* y(:,2) + m2) .* ((m2 - m3) .* y(:,2) .^ 2 - m2) .* y(:,2))) .* (D1 * y(:,2))) ./ ((m3 .^ 2 .* (m2 - 1) .^ 2 .* y(:,1) .^ 4 - 4 .* m3 .* (m2 - 1) .* ((m2 - m3) .* y(:,2) - m2) .* y(:,1) .^ 3 + 6 .* m3 .* ((m2 - m3) .* y(:,2) .^ 2 - m2) .* (m2 - 1) .* y(:,1) .^ 2 - 4 .* m3 .* (m2 - 1) .* ((m2 - m3) .* y(:,2) .^ 3 - m2) .* y(:,1) + (m2 - m3) .^ 2 .* y(:,2) .^ 4 - 4 .* m2 .* (m2 - m3) .* y(:,2) .^ 3 + 6 .* m2 .* (m2 - m3) .* y(:,2) .^ 2 - 4 .* m2 .* (m2 - m3) .* y(:,2) + m2 .^ 2) .^ 2)];

end

