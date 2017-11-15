function [ F ] = compute_thin_film( y, dy, c )

    F = c * (y{1}.^3 .* (dy{4}) + y{1}.^2 .* (dy{1}) .* (dy{3}) );

end
