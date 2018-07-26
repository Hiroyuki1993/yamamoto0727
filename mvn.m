mu = [-1 0.5];
Sigma = [1 .5; .5 1];

x1 = -3:.2:3;
x2 = -3:.2:3;
[X1, X2] = meshgrid(x1, x2);
F = mvnpdf([X1(:) X2(:)], mu, Sigma);
F = reshape(F, length(x2), length(x1));
# y = exp(-0.5*(x-mu)'*pinv(Sigma)*(x-mu))/sqrt((2*pi)^k * det(Sigma))
surf(x1, x2, F);
caxis([min(F(:))-.5*range(F(:)), max(F(:))]);
axis([-3 3 -3 3 0 .4]);
xlabel("x1");
ylabel("x2");
zlabel("Probability Density");
saveas(1, "mvn.png");