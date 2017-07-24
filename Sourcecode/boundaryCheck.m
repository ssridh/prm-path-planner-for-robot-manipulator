%% function to check boundary conditions for x-y axis
function isValid = boundaryCheck(newConf)
    global map;    
    
    %get bounds
    bounds = map.xyBounds;
    minX = 0;
    maxX = bounds(1);
    minY = 0;
    maxY = bounds(2);    
    
    %get points
    point0 = newConf.point0;
    point1 = newConf.point1;
    point2 = newConf.point2;    
        
    %check if point0 is inside the boundary
    p0 = point0(1) >= minX && point0(1) < maxX && point0(2) >= minY && point0(2) < maxY;    
    %check if point1 is inside the boundary
    p1 = point1(1) >= minX && point1(1) < maxX && point1(2) >= minY && point1(2) < maxY;    
    %check if point2 is inside the boundary
    p2 = point2(1) >= minX && point2(1) < maxX && point2(2) >= minY && point2(2) < maxY;
    
    isValid = p0 && p1 && p2;    
   
end