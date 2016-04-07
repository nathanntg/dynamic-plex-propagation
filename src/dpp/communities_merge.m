function communities = communities_merge(communities, i, j)
%COMP_MERGE Merges two communities together together.

if communities(i) < communities(j)
    communities(communities == communities(j)) = communities(i);
elseif communities(j) < communities(i)
    communities(communities == communities(i)) = communities(j);
end

end

