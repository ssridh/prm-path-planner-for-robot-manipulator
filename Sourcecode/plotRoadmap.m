%% plot the generated roadmap
function plotRoadmap()
    global roadMap startPos goalPos configurations;
    
    startNode = roadMap{1};
    x1 = startPos(1);
    y1 = startPos(2);
    for i=1:length(startNode)
        n = configurations(startNode(i)-2, :);
        x2 = n(1);
        y2 = n(2);
        plot([x1 x2], [y1 y2], 'LineWidth', 1, 'Color', 'b');        
    end
    
    
    for i=3:length(roadMap)
        node = roadMap{i};
        n1 = configurations(i-2,:);
        x1 = n1(1);
        y1 = n1(2);
        for j=1:length(node)
            if node(j) == 2
                n=goalPos;
                x2=n(1);
                y2=n(2);
            else
                n = configurations(node(j)-2,:);
                x2 = n(1);
                y2 = n(2);
            end
            plot([x1 x2], [y1 y2], 'LineWidth', 1, 'Color', 'b'); 
        end
    end
    
    
end