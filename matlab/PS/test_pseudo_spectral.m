% A short script to test the validity of the psuedo spectral differentiation
% against a simple exact case ( y = cos(x) )

fprintf('test_pseudo_spectral\n')

addpath('../IF/')

xN = 2.^(4:10)';
xL = 2*pi;
xS = xL./xN;

%% Single Derivatives
error = zeros(length(xN),4);

for degree = 1:4
    error(:,degree) = compute_exact_error(xN, xL, xS, degree);   
end

hold on
for degree = 1:4
    scatter(log10(xL./xN),log10(error(:,degree)));
end
set(gca, 'XDir','reverse')
title({'A log - log plot of the error',' against dx'})
xlabel('dx, 10^x')
ylabel('Error, 10^y')
legend({'First derivative','Second derivative',...
    'Third derivative','Fourth derivative'},'Location','southeast');


%% Full problem rhs

error = compute_approx_error(xN,xL,xS);
figure();
scatter(log10(xL./xN(1:end-1)),log10(error));
set(gca, 'XDir','reverse')
title({'A log - log plot of the error',' against dx'})
xlabel('dx, 10^x')
ylabel('Error, 10^y')

%%
function error = compute_exact_error(xN,xL,xS,degree)
    error = ones(length(xN),1);
    for i = 1:length(xN)
        x = linspace(xS(i), xL, xN(i))';
        y = cos(x);
        if degree == 1
            dy = -sin(x);
        elseif degree == 2
            dy = -cos(x);
        elseif degree == 3
            dy = sin(x);
        else
            dy = cos(x);
        end
        dyApprox = diff_ps(y,degree);
        error(i) = max(abs(dyApprox - dy));
    end
end

%%
function error = compute_approx_error(xN,xL,xS)
    Q = 1;
    H1 = 0.4;
    H2 = 0.7;
    m2 = 1;
    m3 = 1;
    s1 = 1;
    s2 = 1;
    a = 0.1;
    theta = 1;
    
    error = ones(length(xN)-1,1);
    
    x = linspace(xS(end), xL, xN(end))';
    yApp = rhs_ps(0,x,i_double_cos(x,a,theta),...
                  @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
                  [1,3,4]);
%     figure;
%     plot_interfaces(x,yApp,H1,H2);hold on;
    for i = 1:length(xN)-1
        x = linspace(xS(i), xL, xN(i))';
        y = rhs_ps(0,x,i_double_cos(x,a,theta),...
                  @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
                  [1,3,4]);
%         plot_interfaces(x,y,H1,H2);
        error(i) = max(abs(y -  yApp(xN(end)/xN(i):xN(end)/xN(i):end)));
    end
end