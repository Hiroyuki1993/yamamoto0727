Phi = [1 .5; .5 1]
v = 10
Sigma_k = iwishrnd(Phi, v)

mu = [0 0];
mu_k = mvnrnd(mu, Sigma_k)

mvnrnd(mu_k, Sigma_k)
