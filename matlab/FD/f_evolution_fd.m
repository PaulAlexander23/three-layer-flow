function F = f_evolution_fd(y, Q, H1, H2, m2, m3, s1, s2)
    global D

    yCell = {y(1:end/2,:), y(end/2+1:end,:)};
    dyCell = cell(4, 2);

    for degree = [1,3,4]
        for inter = [1,2]
            dyCell{degree,inter} = D{degree}*yCell{inter};
        end
    end

    F = evolution_exp(yCell,dyCell, Q, H1, H2, m2, m3, s1, s2);

end
