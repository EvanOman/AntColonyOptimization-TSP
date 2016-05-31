function score = scorePath(cityPerm, cities)

fromCities = cities(cityPerm);
toCities = cities(circshift(cityPerm, [0,1]));

score = sum(sqrt(abs([fromCities(:).x] -  [toCities(:).x]).^2 + abs([fromCities(:).y] - [toCities(:).y]).^2));

end