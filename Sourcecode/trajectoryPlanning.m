%% Trajectory planning for the manipulator via points
function trajectoryPlanning(pathNodes)
    global thetaValues segmentValues endEffectorVelocity segmentVelocity nodes;
    
    pathNodes = fliplr(pathNodes);
    path = [];
    for i=1:length(pathNodes);
        path{i} = nodes{pathNodes(i)}.position;        
    end
       
    %cubic spline trajectory for joint space representation
    noOfViaPoints = length(path);
    jointSpaceRep = [];
    for js=1:noOfViaPoints
        jointSpaceRep{js} = [path{js}(3), path{js}(4)];             
    end
    
    time = 3;
    frequency = 10;
    [thetaValues endEffectorVelocity] = cubicSplineTrajectory(jointSpaceRep, time, frequency);
    
    
    %linear trajectory for cartesian space for mobile base
    segmentValues = [];
    segmentVelocity = [];
    for kp=1:length(path)-1
        segment1 = [path{kp}(1) path{kp}(2)];
        segment2 = [path{kp+1}(1) path{kp+1}(2)];
        [tempSeg,tempSegVel]  = linearTrajectory(segment1, segment2, time*frequency);
      
        segmentValues = [segmentValues; tempSeg];
        segmentVelocity = [segmentVelocity; tempSegVel];
    end   

end