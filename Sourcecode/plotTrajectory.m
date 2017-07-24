%% emulate the path from start to goal position
function plotTrajectory()
    global startPos goalPos manipulator thetaValues segmentValues endEffectorVelocity segmentVelocity;
    
    plotEnvironment();
    startConfig = constructManipulator(startPos);
    plotManipulator(startConfig, 1);  
    goalConfig = constructManipulator(goalPos);
    plotManipulator(goalConfig, 2); 
    
    pause(0.10);
    for i= 1:length(thetaValues)
        cla;
        % plot environment
        plotEnvironment();
        startConfig = constructManipulator(startPos);
        plotManipulator(startConfig, 1);  
        goalConfig = constructManipulator(goalPos);
        plotManipulator(goalConfig, 2); 
        
        % emulate path
        plot(segmentValues(1:i,1),segmentValues(1:i,2),'k');        
        conf = [segmentValues(i,1) segmentValues(i,2) thetaValues(i,1) thetaValues(i,2)];
        manipulatorConf = constructManipulator(conf);
        plotManipulator(manipulatorConf, 0);
        
        pause(0.10);
    end   
    
end