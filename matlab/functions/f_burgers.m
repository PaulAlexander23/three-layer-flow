function [ F ] = compute_burgers( y , dy )

    F = [(dy{2,1}) + 2 * y{1} .* (dy{1,1}) - y{1} .* (dy{1,2}) - y{2} .* (dy{1,1});...
        (dy{2,2}) + 2 * y{2} .* (dy{1,2}) - y{1} .* (dy{1,2}) - y{2} .* (dy{1,1})];

end
