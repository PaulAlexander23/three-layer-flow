function [values] = PlotOverRange(f,endpoints,numpoints)

dim = size(endpoints,1);
x = cell(dim,1);
for j = 1:dim
    x{dim} = linspace(endpoints(dim,1),endpoints(dim,2),numpoints(dim));
end
values = zeros(x);
for i = 1:numpoints
    values(i) = f(x(i));
end
plot(x,values);

end

