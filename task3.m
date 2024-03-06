popsize = 50;
points = [0,0;77,68;12,75;32,17;51,64;20,19;72,87;80,37;35,82;2,15;18,90;33,50;85,52;97,27;37,67;20,82;49,0;62,14;7,60;100,100];
% 2-19
coef = zeros(popsize, 18);
%1-20
full = zeros(popsize, 20);
% Store fitness values over generations
fitness_history = zeros(100, popsize);
gens = 700;
for i = 1:popsize
    coef(i, :) = randperm(18) + 1;
end

for generation = 1:gens
    for i = 1:popsize
        full(i, :) = [1, coef(i, :), 20];
    end
    %values matrix
    c = fitFunction(points, full);

    fitness_history(generation, :) = c;

    best = selbest(coef, c, [10 3 0]);
    %gen new pop
    work = [best; swapgen(coef, 0.25)];
    coef = [best; work];
end
%the best coordinats
exelent = selbest(full, c, [1 0 0]);

bestRoute = points(exelent, :);
disp("points")
disp(bestRoute);

% Plot fitness values over generations
figure;
plot(1:gens, fitness_history(:, 1), 'r-', 'LineWidth', 2);
hold on;
xlabel('Generation');
ylabel('Fitness Value');
title('Evolution of Fitness Function');
hold off;

figure;

plot(bestRoute(:, 1), bestRoute(:, 2), 'b.-'); % Маршрут

xlabel('X координата');
ylabel('Y координата');
title(fitFunction(points, exelent));

hold off;



%387

 % 0     0
 %2    15
 %20    19
 %32    17
 %49     0
 %62    14
 %97    27
 %80    37
 %85    52
 %77    68
 %51    64
 %37    67
 %33    50
 %7    60
 %12    75
 %20    82
 % 100   100