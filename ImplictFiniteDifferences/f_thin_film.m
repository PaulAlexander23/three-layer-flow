function [ F ] = f_thin_film( y, c )
global D1 D3 D4
F = c * (y.^3 .* (D4 * y) + y.^2 .* (D1 * y) .* (D3 * y) );
end

