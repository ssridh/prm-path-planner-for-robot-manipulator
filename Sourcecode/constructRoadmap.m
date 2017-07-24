%% construct the roadmap for PRM algorithm
function constructRoadmap(noOfConfigs, noOfNeighbors, distanceThreshold)
    global startPos goalPos configurations roadMap;
    disp('Constructing roadmap');
    %find nearest configurations for each sampled config
    nearestNeighbors = [];
    for i=1:noOfConfigs
        k=1;
        for j=1:noOfConfigs
            if i ~= j
                distance = computeDistance(configurations(i,:), configurations(j,:));
                %get configurations whose distance is < distanceThreshold
                if distance < distanceThreshold
                    distanceArray(k,:) = [j, distance];
                    k = k+1;                               
                end
            end
        end
        %sort configurations based on distance from current node
        distanceArray = sortrows(distanceArray, 2);   
        nearestNeighbors{i} = distanceArray(:,1);        
        
    end
    
    %construct edge list
    for e=1:noOfConfigs
        index = nearestNeighbors{e};
        tempEdges = [];
        for j=1:length(index) 
            if checkPath(configurations(e,:), configurations(index(j),:))
                tempEdges = [tempEdges, index(j)+2];
                
            end            
        end
        %check if current configuration is connected to goalPos        
        if checkPath(configurations(e,:), goalPos)
            tempEdges = [tempEdges, 2];
        end
        roadMap{e+2} = tempEdges;
    end            
    
    %find configurations connected to start state and add to roadMap
    stDistArray = zeros(noOfConfigs-1, 2);
    for s=1:noOfConfigs
        stDist = computeDistance(startPos, configurations(s,:));
        stDistArray(s,:) = [s, stDist];  
    end
    %sort configurations based on distance from current node         
    stDistArray = sortrows(stDistArray, 2);        
    %get n nearest neighbors
    stNearestNeighbors = stDistArray(1:noOfNeighbors,1);      
    
    tempEdges = [];
    for sa=1:noOfNeighbors
        if checkPath(startPos, configurations(stNearestNeighbors(sa),:))
            tempEdges = [tempEdges, stNearestNeighbors(sa)+2];
        end
        roadMap{1} = tempEdges;
    end

    %% compute Euclidean distance between two configurations
    function distance = computeDistance(conf1, conf2)
        distance = sqrt(((conf2(1) - conf1(1))^2) + ((conf2(2) - conf1(2))^2));
    end

    %% check if path exists between two configurations
    function pathExists = checkPath(conf1, conf2)        
        time = 3;
        frequency = 10;
                
        %local path generation for collision and boundary check
        theta{1} = [conf1(3) conf1(4)];
        theta{2} = [conf2(3) conf2(4)];
        
        [thetaVal endEffVel] = cubicSplineTrajectory(theta, time, frequency);
        
        segment1 = [conf1(1) conf1(2)];
        segment2 = [conf2(1) conf2(2)];
        [segVal segVel]  = linearTrajectory(segment1, segment2, time*frequency);
        
        for st=1:length(thetaVal)
            
            conf = [segVal(st,1), segVal(st,2), thetaVal(st,1), thetaVal(st,2)];
            newConf = constructManipulator(conf);
            if ~boundaryCheck(newConf) || collisionCheck(newConf)
               pathExists = false;   
               return;            
            end            
        end
        pathExists = true;
    end
        
end