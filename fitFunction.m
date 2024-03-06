function c = fitFunction(points, full)
    popsize = size(full, 1);
    c = zeros(popsize, 1);

    for i = 1:popsize
        sofar = 0;
        for j = 1:19
            dist = sqrt((points(full(i, j+1), 1) - points(full(i, j), 1))^2 + (points(full(i, j+1), 2) - points(full(i, j), 2))^2);
            sofar = dist + sofar;
        end
        c(i) = sofar;
    end
end
