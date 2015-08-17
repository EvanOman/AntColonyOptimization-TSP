function cities = genCities(numCities, type)

if (type == 'circ')
	cities = genCircCities(numCities);
else
	cities = genRandCities(numCities);
end

end