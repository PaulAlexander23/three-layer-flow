function hnew = compute_interpolation(h,t,x,tNew,xNew)

    F1 = griddedInterpolant({x, t}, h(1:end/2,:));
    F2 = griddedInterpolant({x, t}, h(1+end/2:end,:));

    hnew = [F1({xNew,tNew}); F2({xNew,tNew})];

end
