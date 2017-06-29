function communities = communities_merge2(communities, idx)
%COMMUNITIES_MERGE Merges multiple communities together together.

% get community numbers for each
nums = communities(idx);

% use lowest as new community number
new_num = min(nums);

% renumber all
communities(ismember(communities, nums)) = new_num;

end

