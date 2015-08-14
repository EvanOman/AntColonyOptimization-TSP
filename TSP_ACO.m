% We first need to generate the nodes in a circle
numCities = 50;

radians = linspace(0, 2*pi, numCities);

x = cos(radians);
y = sin(radians);

cities = repmat(struct('x', 0, 'y', 0, 'id', 0), 1, numCities);

coordPerm = randperm(numCities);

for i = 1:numCities
    cities(i).id = i;
    cities(i).x = x(coordPerm(i));
    cities(i).y = y(coordPerm(i));
end

plot([cities(:).x],[cities(:).y], 'bo-')

% Here is where we will implement the ant colony algorithm
% First we will identify all of the actors:
%    - k    : an ant
%    - r    : a current city (it is supposed that k is at r)
%    - s    : a destination city
%    - M_k  : the memory of ant k, keeps track of past visits
%    - tau  : pheremone vector such that tau(r, u) is the amount of
%             pheremone on edge (r, u)
%    - eta  : A heuristic function which assigns some value to edges such
%             that eta(r, u) is the heuristic value of edge (r,u). For TSP,
%             this function is often the inverse distance between cities
%    - beta : A parameter which determines the weight of the heurstic function
%    - q_0  : A parameter determining how often we take the route with the best
%             tau and eta values vs a random route
%    - S    : A random variable which is governed by the p_k distribution
%    - p_k  : The probability distribution of the variable S which favors 
%             shorter edges and higher pheremones. p_k(r,s) is the probability
%             that ant k will choose to move from city r to city s
%    - rho  : the pheromone evaporation rate
%    - delta-tau: the global pheromone update rate

% The algorithm proceeds in the following manner:
% while score_not_good_enough
%   for ant_k in colony
%     place ant_k at random city
%     with probabily q_0, ant_k will move to the city with best tau and eta
%     otherwise, ant_k will move to a random city based on p_k
%   end
%   Perform global pheremone update:
%   for edge in edge_set
%       if (edge is traversed)
%           tau(edge) = (1 - rho) * tau(edge) + delta-tau
%       else 
%           tau(edge) = (1 - rho) * tau(edge)
%   end
% end