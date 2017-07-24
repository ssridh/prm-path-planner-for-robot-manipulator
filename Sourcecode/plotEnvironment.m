%% plot environemt
function plotEnvironment()
    global map manipulator startPos goalPos;
    
    obsCount = length(map.obstacles);
    type = map.obstacleType;
    if strcmp(type,'rectangle')
        for i=1:obsCount
            obs = map.obstacles{i};
            patch(obs(:,1), obs(:,2), 'b');
            hold on;
        end
    end
    
    bound = map.boundary;
    plot(bound(:,1), bound(:,2));
    
end