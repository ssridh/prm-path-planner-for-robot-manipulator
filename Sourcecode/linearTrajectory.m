%% linear trajectory for cartesian space represenation for base
function [segValues, segVelocity] = linearTrajectory(segment1, segment2, time)
    segValues = [];
    segVelocity = [];
    [segValues(:,1), segVelocity(:,1)] = linearTrajectoryGenerator(segment1(1), segment2(1), time);
    [segValues(:,2), segVelocity(:,2)] = linearTrajectoryGenerator(segment1(2), segment2(2), time);
      
    
end

%% linear trajectory generator
% based on lspb - robotic toolbox
function [segValues, segVelocity] = linearTrajectoryGenerator(val1, val2, time)
    sartTime = 0;
    endTime = time-1;
    
    velocity = (val2-val1)/endTime * 1.5;
    midTime = (val1 - val2 + velocity*endTime)/velocity;
    a = velocity/midTime;
    
    segValues = zeros(length(time), 1);
    segVelocity = zeros(length(time), 1);
    
    trajTime = 0;
    for i=1:time
        if(trajTime <= midTime)
            segValues(i) = val1 + a/2*trajTime^2;
            segVelocity(i) = a * trajTime;
        elseif (trajTime <= (endTime-midTime))
            segValues(i) = (val2+val1-velocity*endTime)/2 + velocity*trajTime;
            segVelocity(i) = velocity;
        else
            segValues(i) = val2 - a/2*endTime^2 + a*endTime*trajTime - a/2*trajTime^2;
            segVelocity(i) = a*endTime - a*trajTime;
        end
        trajTime = trajTime+1;
    end
    
end