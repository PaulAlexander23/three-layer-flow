
% Load data


% Regrid to see arrows better
c = 60/t(end);
fr = 10;
tnew = 0:1/fr/c:t(end);
xnew = linspace(2*pi/64,2*pi,64);
hnew = compute_interpolation(h,t,x,tnew,xnew);

% Reconstruct the velocity
[z, u, v] = compute_u1(32,hnew,H1,H2,m2,m3,s1,s2,Q);

% Need X to be a matrix for plotting
X = repmat(xnew,32,1);

% Numerical velocity
figure
quiver(X,z(:,:,end)',u(:,:,end)',v(:,:,end)')

figure
quiver(X,z(:,:,1)',u(:,:,1)',v(:,:,1)')
set(gcs,'nextplot','replaceshildren');
pause(1);

for tI = 2:1:length(tnew)
    tic
    quiver(X,z(:,:,tI)',u(:,:,tI)',v(:,:,tI)')
    pause(max(0,1/fr-toc))
end



% % Base velocity
% u1 = -6 .* m2 .* m3 .* (-m3 .* (m2 - 1) .* H1 .^ 2 + z .* m3 .* (m2 - 1) .* H1 + (m2 - m3) .* H2 .^ 2 - z .* (m2 - m3) .* H2 + m2 .* (z - 1)) .* Q .* z / (m3 .^ 2 .* (m2 - 1) .^ 2 .* H1 .^ 4 - 4 .* m3 .* ((m2 - m3) .* H2 - m2) .* (m2 - 1) .* H1 .^ 3 + 6 .* m3 .* ((m2 - m3) .* H2 .^ 2 - m2) .* (m2 - 1) .* H1 .^ 2 - 4 .* m3 .* (m2 - 1) .* ((m2 - m3) .* H2 .^ 3 - m2) .* H1 + (m2 - m3) .^ 2 .* H2 .^ 4 - 4 .* m2 .* (m2 - m3) .* H2 .^ 3 + 6 .* m2 .* (m2 - m3) .* H2 .^ 2 - 4 .* m2 .* (m2 - m3) .* H2 + m2 .^ 2);
% figure
% quiver(X,z(:,:,end)',u1(:,:,end)',zeros(64,32)')
%
% % Velocity difference
% figure
% quiver(X,z(:,:,end)',u(:,:,end)'-u1(:,:,end)',v(:,:,end)')
