function cities = genRandCities(numCities)

cities = repmat(struct('x', 0, 'y', 0, 'id', 0), 1, numCities);

for i = 1:numCities
    cities(i).id = i;
    cities(i).x = rand;
    cities(i).y = rand;
end
end