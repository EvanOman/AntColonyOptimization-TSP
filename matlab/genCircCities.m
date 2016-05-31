function cities = genCircCities(numCities)
radians = linspace(0, 2*pi, numCities + 1);
radians(end) = [];

x = cos(radians);
y = sin(radians);

cities = repmat(struct('x', 0, 'y', 0, 'id', 0), 1, numCities);

coordPerm = randperm(numCities);

for i = 1:numCities
    cities(i).id = i;
    cities(i).x = x(coordPerm(i));
    cities(i).y = y(coordPerm(i));
end
end