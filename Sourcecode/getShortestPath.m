%% query the shortest path from the roadmap generated using a*
function finalPath = getShortestPath()
    global startPos goalPos configurations nodes roadMap;
    
    %construct graph nodes for a* algorithm
    constructNodes();
    
    %initialize initial state
    nodes{1}.heuristicVal = computeHeuristicValue(nodes{1});
    nodes{1}.visited = 'false';
    nodes{1}.fVal = computeTotalCost(nodes{1});
    
    finalPath = [];       
    
    while 1
        currentNodeIndex = getBestNode();
        if currentNodeIndex == 0
            return;
        end
        currentNode = nodes{currentNodeIndex};        
        
        %update node with path cost
        parentNode = currentNode.parentIndex;   
        
        nodes{currentNodeIndex}.heuristicVal = computeHeuristicValue(currentNode);
        nodes{currentNodeIndex}.gVal = computePathCost(currentNode, parentNode);
        nodes{currentNodeIndex}.fVal = computeTotalCost(currentNode);
        
        nodes{currentNodeIndex}.visited = 'true';
        childNodes = roadMap{currentNodeIndex};
        
        
        for j=1:length(childNodes)
            cNodeIndex = childNodes(j);
            cNode = nodes{cNodeIndex};
            if ~strcmp(cNode.visited, 'true')
                hVal = computeHeuristicValue(cNode);
                gVal = computePathCost(cNode, currentNodeIndex);
                fVal = hVal + gVal;
                if(fVal < cNode.fVal)
                    nodes{cNodeIndex}.heuristicVal = hVal;
                    nodes{cNodeIndex}.gVal = gVal;
                    nodes{cNodeIndex}.fVal = fVal;
                    nodes{cNodeIndex}.visited = 'false';
                    nodes{cNodeIndex}.parentIndex = currentNodeIndex;
                end
            end
        end
        
        %if goal state backtrack path
        if isGoalState(nodes{2})
            finalPath = backTrackPath();
            break;
        end
    end
    
    
    

   
    %% construct nodes
    function constructNodes()
        nodes = [];
    
        % add start configuration
        nodes{1}.position = startPos;
        nodes{1}.heuristicVal = 0;
        nodes{1}.gVal = 0;
        nodes{1}.fVal = intmax('int32');
        nodes{1}.parentIndex = 0;
        nodes{1}.visited = 'nan';
    
        %add end configuration
        nodes{2}.position = goalPos;
        nodes{2}.heuristicVal = 0;
        nodes{2}.gVal = 0;
        nodes{2}.fVal = intmax('int32');
        nodes{2}.parentIndex = 0;
        nodes{2}.visited = 'nan';
    
        for cn=1:length(configurations)
            nodes{cn+2}.position = configurations(cn,:);
            nodes{cn+2}.heuristicVal = 0;
            nodes{cn+2}.gVal = 0;
            nodes{cn+2}.fVal = intmax('int32');
            nodes{cn+2}.parentIndex = 0;
            nodes{cn+2}.visited = 'nan';
        end
        
    end
    
    %% compute and update heuristic value
    function hVal = computeHeuristicValue(node)
        hVal = computeDistance(node.position, goalPos);        
    end

    %% compute and update total cost
    function fVal = computeTotalCost(node)
        fVal = node.heuristicVal + node.gVal;
    end
    
    %% compute and update path cost
    function gVal = computePathCost(node, parent)
        if parent == 0
            gVal = 0;
        else
            gVal = nodes{parent}.fVal + computeDistance(nodes{parent}.position, node.position);            
        end
    end
        
    %% compute Euclidean distance between two configurations
    function distance = computeDistance(conf1, conf2)
        distance = sqrt(((conf2(1) - conf1(1))^2) + ((conf2(2) - conf1(2))^2));
    end
    
    %% check if node is goal state
    function goal = isGoalState(node)
        goal = 0;
        if strcmp(node.visited,'true')
            goal = 1;
            return;
        end
    end
    
    %% get next best node with min cost
    function node = getBestNode()
        min = intmax('int32');
        node = 0;
        for bn=1:length(nodes)
            totalCost = nodes{bn}.fVal;
            visited = nodes{bn}.visited;
            
            if strcmp(visited,'false') && totalCost < min
                min = totalCost;
                node = bn;
            end            
        end
    end

    %% back track path from goal position
    function path = backTrackPath()
        path = [];
        index = 2;
        while index ~= 1
            path = [path index];
            index = nodes{index}.parentIndex;
        end
        path = [path index];        
    end
            
    
end
    