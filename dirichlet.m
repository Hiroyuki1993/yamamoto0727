alpha = [10 10 50];
x1 = linspace(0.01, 1, 101);
x2 = linspace(0.01, 1, 101);
[X1, X2] = ndgrid(x1, x2);
X3 = 1 - X1 - X2;
bad = (X1 + X2 > 1);
#X1(bad) = NaN;
#X2(bad) = NaN;
#X3(bad) = NaN;

betaConst = exp(sum(gammaln(alpha))-gammaln(sum(alpha)));
F = (X1.^(alpha(1)-1) .* X2.^(alpha(2)-1) .* X3.^(alpha(3)-1)) / betaConst;
F(bad) = -10;

#figure, surf(X1, X2, F, 'EdgeColor', 'none');
#grid off;
contourf(X1, X2, F)
colorbar;
xlabel('x1', 'fontsize', 20);
ylabel('x2', 'fontsize', 20);
# zlabel('f(x1, x2, 1-x1-x2)');
set(gca, 'fontsize', 20);
view(2);
saveas(1, "dirichlet.png");
pause

r = gamrnd(repmat(alpha, 10, 1), 1, 10, length(alpha));
p = r ./ repmat(sum(r,2), 1, length(alpha));
round(p*100) ./ 100