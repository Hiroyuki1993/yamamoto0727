w1 = [0; 0; 1; 0]
Theta1 = rand(3,4)
a1 = Theta1 * w1
a2 = Theta1' * a1
y = exp(a2)/sum(exp(a2))