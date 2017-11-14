function [ F ] = f_burgers( y )
    global D
    
    F = [(D{2} * y(1:end/2)) + 2 * y(1:end/2) .* (D{1} * y(1:end/2)) - y(1:end/2) .* (D{1} * y(end/2+1:end)) - y(end/2+1:end) .* (D{1} * y(1:end/2));...
        (D{2} * y(end/2+1:end)) + 2 * y(end/2+1:end) .* (D{1} * y(end/2+1:end)) - y(1:end/2) .* (D{1} * y(end/2+1:end)) - y(end/2+1:end) .* (D{1} * y(1:end/2))];
    
end

