function eta = genEta(cities)
numCities = length(cities);
eta = zeros(numCities, numCities);

% Calculate the upper triangle of eta
for fromCity = 1:numCities
	for toCity = fromCity:numCities
		if (fromCity == toCity)
			continue;
		else
			eta(fromCity, toCity) = 1.0/cityDistance(cities(fromCity), cities(toCity));
		end
	end
end

% Euclidean distance is symetric, upper and lower triangles should be identical
eta = eta + eta';

end