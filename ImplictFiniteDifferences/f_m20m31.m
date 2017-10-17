function F = f_m20m31( y, C )
%UNTITLED Summary of this function goes here
%   C = [sigma1, sigma2]
global D1 D2 D3 D4
F = [ C(1) * ((D4*y(:,1)) .* (y(:,1).^3)/3 + (D3*y(:,1)).* (y(:,1) .^ 2) .* (D1*y(:,1))),...
   - (C(2) * ((D4*y(:,2)) .* ((1 - h(:,2)).^3)/3 - (D3*y(:,1)).* ((1 - y(:,1)) .^ 2) .* (D1*y(:,1))))];
end

