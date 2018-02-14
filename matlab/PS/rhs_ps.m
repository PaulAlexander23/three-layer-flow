<<<<<<< Updated upstream
function F = rhs_ps(t, x, y, func, diffOrders)
    
    nOI = size(y,1)/size(x,1); % Number of interfaces
    
    yCell = cell(nOI,1);
    for j = 1:nOI
        yCell{j} = y(1 + end*(j-1)/nOI:end*j/nOI,:);
    end
    
    dyCell = cell(max(diffOrders),nOI);
    for degree = diffOrders
        for j = 1:nOI
            dyCell{degree,j} = diff_ps(yCell{j}, degree);
        end
    end
    
    F = func(t, x, yCell, dyCell);
    
    %     % Remove changes in mode 0 as this is conserved
%     FF = fft(F);
%     N = size(FF,1)/2;
%     k = [0:N-1, 0, 1-N:-1]';
%     FF(k==0,:) = 0;
%     F = ifft(FF);

=======
function F = rhs_ps(t, x, y, func, diffOrders)
    
    nOI = size(y,1)/size(x,1); % Number of interfaces
    
    yCell = cell(nOI,1);
    dyCell = cell(max(diffOrders),nOI);
    
    for j = 1:nOI
        [dy,ny] = diff_ps(y(1 + end*(j-1)/nOI:end*j/nOI,:),diffOrders);
        
        yCell{j} = ny;
        for k = 1:length(diffOrders)
            dyCell{diffOrders(k),j} = dy(:,:,1+j);
        end
    end
    
    F = func(t, x, yCell, dyCell);
    
    % Remove changes in mode 0 as this is conserved
    N = size(F,1)/4;
    FF = fft(reshape(F,2*N,2*size(F,2)));
    FF(1,:) = 0;
    FF(1+N,:) = 0;
    F = reshape(ifft(FF),4*N,size(F,2));
%     k = [0:N-1, 0, 1-N:-1]';
%     FF(k==0,:) = 0;
%     F = ifft(FF);
    
>>>>>>> Stashed changes
end