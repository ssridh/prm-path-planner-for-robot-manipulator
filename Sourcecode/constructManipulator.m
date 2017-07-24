%% construct the two link manipulator
function manipulatorConfig = constructManipulator(config)
    grelb = forwardKinematics(config);
    point0 = [config(1), config(2)];
    point1 = [grelb{1}(1,3) + point0(1), grelb{1}(2,3) + point0(2)];
    point2 = [grelb{2}(1,3) + point1(1), grelb{2}(2,3) + point1(2)];
    
    manipulatorConfig.point0 = point0;
    manipulatorConfig.point1 = point1;
    manipulatorConfig.point2 = point2;
    
end
