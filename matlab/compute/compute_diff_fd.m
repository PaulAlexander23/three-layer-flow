function dy = compute_diff_fd(y, degree)
    %DIFF_FD Summary of this function goes here
    %   Detailed explanation goes here
    global D

    dy = D{degree}*y;

end
