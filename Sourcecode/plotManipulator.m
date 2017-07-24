%% plot manipulator on the GUI
function plotManipulator(manipulatorConfig, index)

    point0 = manipulatorConfig.point0;
    point1 = manipulatorConfig.point1;
    point2 = manipulatorConfig.point2;
    
    if index == 1
        %plot start position
        plot([point0(1) point1(1)], [point0(2) point1(2)], 'LineWidth', 2, 'Color', 'r');
        plot([point1(1) point2(1)], [point1(2) point2(2)], 'LineWidth', 2, 'Color', 'b');
    elseif index == 2
        %plot goal position
        plot([point0(1) point1(1)], [point0(2) point1(2)], 'LineWidth', 2, 'Color', 'r');
        plot([point1(1) point2(1)], [point1(2) point2(2)], 'LineWidth', 2, 'Color', 'b');
    else
        plot([point0(1) point1(1)], [point0(2) point1(2)], 'LineWidth', 2, 'Color', 'g');
        plot([point1(1) point2(1)], [point1(2) point2(2)], 'LineWidth', 2, 'Color', 'c');
end