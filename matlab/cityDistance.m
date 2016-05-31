function distance = cityDistance(city1, city2)
distance = sqrt(abs([city1(:).x] -  [city2(:).x]).^2 + abs([city1(:).y] - [city2(:).y]).^2);
end