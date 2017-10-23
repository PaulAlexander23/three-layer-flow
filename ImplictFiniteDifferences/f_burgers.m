function [ F ] = f_burgers( y )
    global D1 D2
    
    F = [(D2 * y(1:end/2)) + 2 * y(1:end/2) .* (D1 * y(1:end/2)) - y(1:end/2) .* (D1 * y(end/2+1:end)) - y(end/2+1:end) .* (D1 * y(1:end/2));...
        (D2 * y(end/2+1:end)) + 2 * y(end/2+1:end) .* (D1 * y(end/2+1:end)) - y(1:end/2) .* (D1 * y(end/2+1:end)) - y(end/2+1:end) .* (D1 * y(1:end/2))];
    
end

