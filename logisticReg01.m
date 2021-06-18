function logisticReg01()
  close all;
  addpath('../ml-octave');

  x1 = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16];
  x2 = [0.1; 2.5; 1; 10; 3; 8; 2.5; 15; 7; 15; 2; 20; 5; 16; 10; 18];
  y = [1; 0; 1; 0; 1; 0; 1; 0; 1; 0; 1; 0; 1; 0; 1; 0];

  X = [ones(length(x1), 1) x1 x2];
  iteration = 100;

  [J, theta, hypothesis] = logisticRegMain(X, y, 0.04, iteration);

  subplot(2, 2, 1);
  plot(x1(find(y == 1)), x2(find(y == 1)), 'rx', 'MarkerSize', 3);
  hold on;
  plot(x1(find(y == 0)), x2(find(y == 0)), 'bx', 'MarkerSize', 3);
  hold on;

  for it = 1 : iteration
  	printf('Iteration %f \n', it);
  	printf('J = %f\n', J(it));
  	printf('Theta %f\n', theta(it, :));
  	printf('\n');

    subplot(2, 2, 2);
   	plot([min(X(:, 2)); max(X(:, 2))],
    [- (theta(it, 1) + theta(it, 2)*min(X(:, 2))) / theta(it, 3);
     - (theta(it, 1) + theta(it, 2)*max(X(:, 2))) / theta(it, 3)]
     ,
     'linestyle', ':');
  	hold on;

    subplot(2, 2, 4);
  	plot(it, J(it), 'rx', 'MarkerSize', 3);
  	hold on;
  end

  subplot(2, 2, 1);
  plot([min(X(:, 2)); max(X(:, 2))],
  [- (theta(iteration, 1) + theta(iteration, 2)*min(X(:, 2))) / theta(iteration, 3);
   - (theta(iteration, 1) + theta(iteration, 2)*max(X(:, 2))) / theta(iteration, 3)]);
  hold on;

end
