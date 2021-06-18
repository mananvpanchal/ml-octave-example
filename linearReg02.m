function linearReg02()

close all; clc;
addpath('../ml-octave');

x = [0.1; 1.1; 2; 3; 4.1];
y = [0; 1.2; 4.1; 9.2; 15.9];

m = length(y);
X = [ones(length(x), 1)  x  (x .^ 2)];

iteration = 100;

[J, theta, hypothesis] = linearRegMain(X, y, 0.02, iteration);

subplot(2, 2, 1);
plot(x, y, 'rx', 'MarkerSize', 3);
hold on;
pause;

for it = 1 : iteration
	printf('Iteration %f \n', it);
	printf('J = %f\n', J(it));
	printf('Theta %f\n', theta(it, :));
	printf('\n');

	subplot(2, 2, 2);
  plot(X(:, 2)', hypothesis(it, :)');
  hold on;
  %pause;

	subplot(2, 2, 4);
	plot(it, J(it), 'rx', 'MarkerSize', 3);
	hold on;
end

% predict = [1 2.5 6.25] * theta(iteration, :)';
% printf('Predicted value is %f for x %f\n', predict, 2.5);

end
