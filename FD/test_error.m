%Error testing

addpath('../IF/')

Q = 1;
H1 = 0.4;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;

tFinal = 10;
inter = @(x) i_double_cos(x, 0.05, pi/2);

xCount = 2.^(4:7);

h = cell(length(xCount),1);
x = cell(length(xCount),1);
t = cell(length(xCount),1);


timeTaken = ones(length(xCount),1);
error = ones(length(xCount)-1,1);

for i = 1:length(xCount)
    tic;
    [h{i},x{i},t{i}] = compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,tFinal,xCount(i),inter); 
    timeTaken(i) = toc;
end

for i = 1:length(xCount)-1
    error(i) = norm(h{i}(:,end)-h{end}(1:xCount(end)/xCount(i):end,end))*sqrt(2*pi/xCount(i));
    fprintf('Method %u, error: %g, Time taken: %f,\n',i,error(i),timeTaken(i))
end
fprintf('Method %u, error: -, Time taken: %f,\n',i+1,timeTaken(length(xCount)));
