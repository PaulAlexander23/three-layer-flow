function F = rhs_fd(t, x, y, func, diffOrders)
    global D
    
    nOI = size(y,1)/size(x,1); % Number of interfaces
    
    yCell = cell(nOI,1);
    for j = 1:nOI
        yCell{j} = y(1 + end*(j-1)/nOI:end*j/nOI,:);
    end
    
    dyCell = cell(max(diffOrders),nOI);
    for degree = diffOrders
        for j = 1:nOI
            dyCell{degree,j} = D{degree}*yCell{j};
        end
    end
    
    F = func(t, x, yCell, dyCell);
    
end
