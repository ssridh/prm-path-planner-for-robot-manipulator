%% function to check for collision between the manipulator and obstacles
function isColliding = collisionCheck(newConf)
    global map;
    
    obstacles = map.obstacles;
    obsCount = length(obstacles);
    type = map.obstacleType;
    
    %get points
    point0 = newConf.point0;
    point1 = newConf.point1;
    point2 = newConf.point2;
    
    %check for collision depending type of obstacle  
    isColliding = false;
    
    %currently only one type of obstacle is supported
    if strcmp(type,'rectangle')
        for i=1:obsCount
            obs = obstacles{i};
            obstacle = [obs(1,1)-3, obs(1,2)-3;...
                        obs(2,1)+3, obs(2,2)-3;...
                        obs(3,1)+3, obs(3,2)+3;...
                        obs(4,1)-3, obs(4,2)+3;];
            obsMinX = getMinX(obstacle);
            obsMaxX = getMaxX(obstacle);
            obsMinY = getMinY(obstacle);
            obsMaxY = getMaxY(obstacle);
            [in on] = inpolygon(point0(1), point0(2), obstacle(:,1), obstacle(:,2)); 
            if in || on
                isColliding = true;
                return;
            end
            [in on] = inpolygon(point1(1), point1(2), obstacle(:,1), obstacle(:,2));
            if in || on
                isColliding = true;
                return;
            end
            [in on] = inpolygon(point2(1), point2(2), obstacle(:,1), obstacle(:,2));
            if in || on
                isColliding = true;
                return;
            end
            if linkIntersectRectangle(obsMinX, obsMinY, obsMaxX, obsMaxY, point0, point1)
                isColliding = true;
                return;
            end
            if linkIntersectRectangle(obsMinX, obsMinY, obsMaxX, obsMaxY, point1, point2)
                isColliding = true;
                return;
            end      
             if linkIntersectObsLine(point0, point1, obstacle)
                 isColliding = true;
                 return;
             end
             if linkIntersectObsLine(point1, point2, obstacle)
                 isColliding = true;
                 return;
             end
        end     
    end
    
end
%% getMinX from rectangle
function minX = getMinX(obs)
    xValues = [obs(1,1) obs(2,1) obs(3,1) obs(4,1)];
    minX = min(xValues);        
end

%% getMaxX from rectangle
function maxX = getMaxX(obs)
    xValues = [obs(1,1) obs(2,1) obs(3,1) obs(4,1)];
    maxX = max(xValues);        
end

%% getMinY from rectangle
function minY = getMinY(obs)
    yValues = [obs(1,2) obs(2,2) obs(3,2) obs(4,2)];
    minY = min(yValues);        
end   

%% getMaxY from rectangle
function maxY = getMaxY(obs)
    yValues = [obs(1,2) obs(2,2) obs(3,2) obs(4,2)];
    maxY = max(yValues);        
end   

%% check if line intersect with rectangle
function intersectFlag = linkIntersectRectangle(obsMinX, obsMinY, obsMaxX, obsMaxY, point1, point2)
    intersectFlag = true;
       
    px1 = point1(1);
    py1 = point1(2);
    px2 = point2(1);
    py2 = point2(2);
      
    minX = px1;
    maxX = px2;
    if px2 < px1
        minX = px2;
        maxX = px1;
    end
        
    if maxX > obsMaxX
        maxX = obsMaxX;
    end
    if minX < obsMinX
        minX = obsMinX;
    end
        
    minY = py1;
    maxY = py2;
        
    diffX = px2 - px1;
    if abs(diffX) > 0.0000001
        a = (py2 - py1)/diffX;
        b = py1 - a * px1;
        minY = a * minX + b;
        maxY = a * maxX + b;
    end
        
    if minY > maxY
        temp = maxY;
        maxY = minY;
        minY = temp;
    end
        
    if maxY > obsMaxY
        maxY = obsMaxY;
    end
        
    if minY < obsMinY
        minY = obsMinY;
    end
        
    if minY > maxY
        intersectFlag = false; %no collision
        return;
    end    
    if minX > maxX
        intersectFlag = false; %no collision
        return;
    end
        
end
    
%% check if any of manipulator link intersects with obstacle
function result = linkIntersectObsLine(point1, point2, obs)
    x1 = point1(1);
    y1 = point1(2);
    x2 = point2(1);
    y2 = point2(2);
    if lineIntersectLine(x1,y1,x2,y2,obs(1,1),obs(1,2),obs(2,1),obs(2,2));
        result = true;
        return;
    end
        
    if lineIntersectLine(x1,y1,x2,y2,obs(2,1),obs(2,2),obs(3,1),obs(3,2));
        result = true;
        return;
    end
        
    if lineIntersectLine(x1,y1,x2,y2,obs(4,1),obs(4,2),obs(3,1),obs(3,2));
        result = true;
        return;
    end
        
    if lineIntersectLine(x1,y1,x2,y2,obs(1,1),obs(1,2),obs(4,1),obs(4,2));
        result = true;
        return;
    end
        
    result = false;
end

%% line-line intersection
function res = lineIntersectLine(x1,y1,x2,y2,x3,y3,x4,y4)
    a1 = y2-y1;
    b1 = x1-x2;
    c1 = a1*x1 + b1*y1;
    a2 = y4-y3;
    b2 = x3-x4;
    c2 = a2*x3 + b2*y3;
    det = a1*b2-a2*b1;
        
    if det > 0 || det < 0
        x = (b2*c1 - b1*c2)/det;
        y = (a1*c2 - a2*c1)/det;
        if x >= min([x1 x2]) && x <= max([x1 x2]) && x >= min([x3 x4]) && x <= max([x3 x4]) && y >= min([y1 y2]) && y <= max([y1 y2]) && y >= min([y3 y4]) && y <= max([y3 y4])
            res = true;
        else               
            res = false;
        end
    else
        res = false;
    end         
end
       

   
   
   
   