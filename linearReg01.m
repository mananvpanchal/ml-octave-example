function linearReg01()

close all;
addpath('../ml-octave');

x = [0.1; 0.8; 2.1; 2.9; 4.3];
y = [0; 1; 2; 3; 4];

m = length(y);
X = [ones(length(x), 1) x];
iteration = 50;

[J, theta, hypothesis] = linearRegMain(X, y, 0.05, iteration);

subplot(2, 2, 1);
plot(x, y, 'rx', 'MarkerSize', 3);
hold on;

for it = 1 : iteration
	printf('Iteration %f \n', it);
	printf('J = %f\n', J(it));
	printf('Theta %f\n', theta(it, :));
	printf('\n');

	subplot(2, 2, 2);
 	plot(X(:, 2)', hypothesis(it, :)');
	hold on;

	subplot(2, 2, 4);
	plot(it, J(it), 'rx', 'MarkerSize', 3);
	hold on;
end

theta0_vals = linspace(-4, 4, 100);
theta1_vals = linspace(-4, 4, 100);

J_vals = zeros(length(theta0_vals), length(theta1_vals));

for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = linearRegCost(X, y, t);
    end
end

subplot(2, 2, 3);
surf(theta1_vals, theta0_vals, J_vals');

end
