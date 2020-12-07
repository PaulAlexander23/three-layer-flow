function F = compute_tw_rhs_ps(t, x, yIn, func, diffOrders)

    c = yIn(end);
    y = yIn(1:end-1);


    nOI = size(y,1)/size(x,1); % Number of interfaces

    yCell = cell(nOI,1);
    for j = 1:nOI
        yCell{j} = y(1 + end*(j-1)/nOI:end*j/nOI,:);
    end

    %dyCell = cell(max(diffOrders),nOI);
    %for degree = diffOrders
    %    for j = 1:nOI
    %        dyCell{degree,j} = compute_diff_ps(yCell{j}, degree, x(end));
    %    end
    %end

    compute_finite_differences_init(length(x),x(1),4);
    dyCell = cell(max(diffOrders),nOI);
    for degree = diffOrders
        for j = 1:nOI
            dyCell{degree,j} = compute_diff_fd(yCell{j}, degree);
        end
    end

    F = func(t, x, yCell, dyCell) + c * [dyCell{1,1}; dyCell{1,2}];
    %F = func(t, x, yCell, dyCell) + c * [yCell{1}; yCell{2}];


    N = size(y,1)/4;
    %M = size(y,2);
    %%k = [0:N-1, 0, 1-N:-1]';
    %fy = fft(reshape(y,2*N,2*M));

    %FF = fft(reshape(F,2*N,2*M));
    %FF(1,:) = 0;
    %FF(1+N,:) = abs(FF(1+N,:)) + abs(fy(1+N,:)).^2;
    %FF(1+N,:) = fy(1+N,:);

    %F = [F(1:end/2) - FF(1,1)/N/2; F(1+end/2:end) - FF(1,2)/N/2];
    %%%F = [F(1:end/2) - FF(1,1)/N/2 + fy(1,1)/N/2; F(1+end/2:end) - FF(1,2)/N/2 + fy(1,2)/N/2];
    %F = reshape(real(ifft(FF)), 4*N, M);
    %F = reshape(ifft(FF,'symmetric'),4*N,M);

    %F(1:end/2) = F(1:end/2) - mean(F(1:end/2));
    %F(1+end/2:end) = F(1+end/2:end) - mean(F(1+end/2:end));

    %F = [F; sum(abs(fy(1,:)/N/2))];
    F = [F; (2*N*(y(1)-yIn(1)))];
    %F = [F; abs(sum(yCell{1})) + abs(sum(yCell{2}))];

    %F = [F; sum(abs(fy(1,:)/N/2)) + abs(N*(y(1)-yIn(1)))];
    %F = [F; sum(yCell{1}).^2 + sum(yCell{2})^2 + (N*(y(1)-yIn(1))).^2];

    %F = [F; sum(y(1:end/2))^2 + sum(y(1+end/2:end))^2 + (y(1)-yIn(1)).^2 + ...
    %    1e3*sum(fy(1+N,:).^2)];

    function yOut = zero_largest_mode(y)

        N = size(y,1)/4;

        fy = fft(reshape(y,2*N,2*size(y,2)));

        fy(1+N,:) = 0;

        %m = 0;
        %FF(1+N + (-m-1:m),:) = 0;

        yOut = reshape(real(ifft(fy)),4*N,size(y,2));
    end
end
