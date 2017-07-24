%% geerate random configurations in free c-space
function generateRandomConfigurations(noOfConfigs)
    global startPos goalPos configurations map manipulator;
    bounds = map.xyBounds;
    
    %initialize configurations    
    configurations = zeros(noOfConfigs, 4);  
    
    count = 1;
    while count <= noOfConfigs
        %generate random configuration
        randomX = bounds(1) * rand(1);
        randomY = bounds(2) * rand(1);
        randomTheta1 = manipulator.workspace(1,1) + 2* manipulator.workspace(1,2) * rand(1);
        randomTheta2 = manipulator.workspace(2,1) + 2* manipulator.workspace(2,2) * rand(1);
        randomConf = [randomX randomY randomTheta1 randomTheta2];
        randommanipulatorConf = constructManipulator(randomConf);
        if ~boundaryCheck(randommanipulatorConf) || collisionCheck(randommanipulatorConf)
            % do nothing
        else
            plotManipulator(randommanipulatorConf, 0);
            configurations(count, :) = randomConf;
            count = count+1;
        end
    end
end