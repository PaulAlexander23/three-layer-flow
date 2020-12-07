function data_save(h,x,t,timeTaken,xN,xL,tL,H1,H2,m2,m3,s1,s2,Q)

    filename = data_filename(xN, xL, t, H1, H2, m2, m3, s1, s2, Q);

    save(filename, "x", "t", "h", "timeTaken", "xN", "xL", "tL", ...
        "H1", "H2", "m2", "m3", "s1", "s2", "Q");
end
