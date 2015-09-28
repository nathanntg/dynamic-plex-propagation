function C = generate_network_with_edge_probability_and_density(edge_freq, densities)
%GENERATE_NETWORK_WITH_EDGE_PROBABILITY_AND_DENSITY Summary
%   Generates a dynamic network based on the probability of edges existing
%   between two vertices and matching a time course of densities.

% time steps
time_steps = length(densities);

% number of vertices
n = size(edge_freq, 1);

% generate an upper right triangular mask to extract edge probabilities
v = 1:n;
[x, y] = meshgrid(v, v);
ult = y < x;

% ignore rest of matrix
edge_freq(~ult) = 0;

% make into a column vector
edge_freq = reshape(edge_freq, [], 1);
x_index = reshape(x, [], 1);
y_index = reshape(y, [], 1);

% max edges
max_edges = (n * (n - 1)) / 2;
target_edges = max_edges * densities;

% empty network
C = false(n, n, time_steps);
for t = 1:time_steps
	% copy edge probability matrix
	cur_edge_freq = edge_freq;
	
	% add edges up to target density
	for i = 1:target_edges(t)
		c = cumsum([0; cur_edge_freq]);
		idx = find(c >= rand * c(end), 1);
        j = x_index(idx);
        k = y_index(idx);
        cur_edge_freq(idx) = 0;
        
        C(j, k, t) = 1;
        C(k, j, t) = 1;
	end
end

end
