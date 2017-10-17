function [ F ] = f_burgers( y , C )
global D1 D2
F(:,1) = (D2 * y(:,1)) + 2 * y(:,1) .* (D1 * y(:,1)) - y(:,1) .* (D1 * y(:,2)) - y(:,2) .* (D1 * y(:,1));
F(:,2) = (D2 * y(:,2)) + 2 * y(:,2) .* (D1 * y(:,2)) - y(:,1) .* (D1 * y(:,2)) - y(:,2) .* (D1 * y(:,1));
F = -F;
end

