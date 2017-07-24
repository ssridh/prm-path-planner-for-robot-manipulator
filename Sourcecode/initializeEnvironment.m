%% initialize obstacles and manipulator configurations
function initializeEnvironment(obsNo)
    global map manipulator startPos goalPos;
    
    map = [];
    manipulator = [];
    
    %get obstacles from setObstacles.m file
    %to use different environment, change values in setObstacles.m file
    [obstacles] = setObstacles(obsNo);
    map.obstacles = obstacles.obs;
    map.obstacleType = obstacles.type;
    
    map.boundary = [0 0; 100 0; 100 100; 0 100; 0 0];
    map.xyBounds = [100 100];
        
    manipulator.l1 = 8;
    manipulator.l2 = 8;
    manipulator.noOfLinks = 2;
    manipulator.workspace = [-180 180; -180 180];
        
      
end

