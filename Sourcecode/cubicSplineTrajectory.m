%% cubic spline trajectory planner for joint space representation
function [thetaVals endEffVelocity] = cubicSplineTrajectory(jointSpaceRep, time, frequency)
    
    noOfViaPoints = length(jointSpaceRep);
    
    %%compute the coefficients for the cubic polynomial
    cc4PathSeg = trajectoryPlanner(jointSpaceRep, time);
    
    %trajectory at time 0 to 9 seconds - initial position to end position
    trajCount = (noOfViaPoints-1)*time*frequency;
    deltat = 1/frequency;
    t = 0;
    pathSeg = 1;
    
    thetaVals = [];
    for i=1:trajCount
        t = t + deltat;        
        theta1 = trajectoryGenerator(t, cc4PathSeg{pathSeg}{1});
        theta2 = trajectoryGenerator(t, cc4PathSeg{pathSeg}{2});
        theta = [theta1 theta2];
        thetaVals = [thetaVals; theta];
        
        %compute linear and angular velocity using Jacobian
        endEffVelocity{i} = jacobian(theta);
        
        %reset time
        if t > time
            t=0; 
            pathSeg = pathSeg+1; %change path seg
        end
    end
       
end

%% TrajectoryPlanner
% compute joint velocities at via points and 
% compute the coefficients for cubic polynomial for the path segment
function cc4PathSeg = trajectoryPlanner(jointSpaceRep, time) 
    cc4PathSeg = {};
    noOfViaPoints = length(jointSpaceRep);
    t = [0];
      
    for i=2:noOfViaPoints
        t(i) = t(i-1) + time;
    end
    
    % compute joint velocities at via points using simple heuristics
    for i=1:noOfViaPoints        
        if(i == 1 || i ==noOfViaPoints)
            jointVelocity{i} = [0 0 0];
        else
            slope1_1 = (jointSpaceRep{i}(1) - jointSpaceRep{i-1}(1)/(t(i)-t(i-1)));
            slope2_1 = (jointSpaceRep{i+1}(1) - jointSpaceRep{i}(1)/(t(i+1)-t(i)));
            if (slope1_1 < 0 && slope2_1 > 0)  || (slope1_1 >0 && slope2_1 <0)
                l1 = 0;
            else
                l1 = 1/2 * (slope1_1 + slope2_1);
            end
            slope1_2 = (jointSpaceRep{i}(2) - jointSpaceRep{i-1}(2)/(t(i)-t(i-1)));
            slope2_2 = (jointSpaceRep{i+1}(2) - jointSpaceRep{i}(2)/(t(i+1)-t(i)));
            if (slope1_2 < 0 && slope2_2 > 0)  || (slope1_2 >0 && slope2_2 <0)
                l2 = 0;
            else
                l2 = 1/2 * (slope1_2 + slope2_2);
            end
            
            jointVelocity{i} = [l1 l2];            
        end
    end
    
    % compute the coefficients for cubic polynomial
    for i=1:noOfViaPoints-1
        cc4PathSeg{i}{1} = cubecoeff(jointSpaceRep{i}(1), jointSpaceRep{i+1}(1), jointVelocity{i}(1), jointVelocity{i+1}(1), time);
        cc4PathSeg{i}{2} = cubecoeff(jointSpaceRep{i}(2), jointSpaceRep{i+1}(2), jointVelocity{i}(2), jointVelocity{i+1}(2), time);        
    end    
end

%% TrajectoryGenerator
% compute joint position, velocity and acceleration
function [q qdot qddot] = trajectoryGenerator(t, cc)
    q = cc(1) + cc(2)*t + cc(3)*t^2 + cc(4)* t^3;
    qdot = cc(2) + 2*cc(3)*t + 3*cc(4)*t^2;
    qddot = 2*cc(3) + 6*cc(4)*t;
end

%% Jacobian
%Compute end-effector linear and angular velocity
function endEffectorVelocity = jacobian(theta)
    theta1 = theta(1);
    theta2 = theta(2);
    
    l1 = 4;
    l2 = 3;
    s1 = sind(theta1);
    c1 = cosd(theta1);    
    s2 = sind(theta2);
    c2 = cosd(theta2);
    s12 = sind(theta1)*cosd(theta2) + cosd(theta1)*sind(theta2);
    c12 = cosd(theta1)*cosd(theta2) - sind(theta1)*sind(theta2);
    
    %Jacobian manipulator for end-effector
    endEffectorJacobian = [-l1*s1-l2*s12 -l2*s12
                           l1*c1+l2*c12  l2*c12
                           1             0                                
                           0             1     ];
    
    endEffectorVelocity = endEffectorJacobian;
end

%% Cubecoeff
%Compute cubic coefficients

function cc = cubecoeff(qs, qg, qdots, qdotg, time) 
    timeSq = time^2;
    timeCu = time * timeSq;
    cc_1 = qs;
    cc_2 = qdots;
    cc_3 = 3*(qg-qs)/timeSq - 2*qdots/time - qdotg/time;
    cc_4 = -2*(qg-qs)/timeCu + (qdots + qdotg)/timeSq;
    cc = [cc_1 cc_2 cc_3 cc_4];
end

