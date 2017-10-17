function [ F ] = f_thin_film( y, C )
global D1 D2 D3 D4
F = C(1) * (y.^3 .* (D4 * y) + y.^2 .* (D1 * y) .* (D3 * y) );
end

