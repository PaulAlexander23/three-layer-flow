function F = f_m20m31( y, s1, s2 )
%f_m20m31 rhs for the special case of the full problem
%   
global D1 D3 D4
F = [ s1 * ((D4*y(:,1)) .* (y(:,1).^3)/3 + (D3*y(:,1)).* (y(:,1) .^ 2) .* (D1*y(:,1))),...
   - (s2 * ((D4*y(:,2)) .* ((1 - y(:,2)).^3)/3 - (D3*y(:,1)).* ((1 - y(:,1)) .^ 2) .* (D1*y(:,1))))];
end

