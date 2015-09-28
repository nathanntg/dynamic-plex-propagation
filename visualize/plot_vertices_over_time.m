function plot_vertices_over_time(vertices, dynamic_communities, time_axis)
%PLOT_VERTICES_OVER_TIME Plot the number of vertices in communities over time
% create a timeline of all  of the number of vertices in a dynamic component ever

% default values
if ~exist('time_axis', 'var') || isempty(time_axis)
    time_axis = 1:length(dynamic_communities);
end

% extract list of all dynamic communities
all_dyn_comms = all_dynamic_communities(dynamic_communities);

% ages
num_dynamic_communities = length(all_dyn_comms);

% calculate timeline for each dynamic community
for i = 1:num_dynamic_communities
    cur_dynamic_comm = all_dyn_comms(i);
    cur_vertices = vertices_in_community(vertices, dynamic_communities, cur_dynamic_comm);
    num = sum(cur_vertices, 2);
    
    % non-zero time indices
    nz = num > 0;
    
    % plot
    if 1 < i
        hold on;
        plot(time_axis(nz), num(nz));
        hold off;
    else
        plot(time_axis(nz), num(nz));
    end
end

% configure plot
xlim([time_axis(1) time_axis(end)]);
xlabel('Time');
ylabel('Number of Vertices');

end
