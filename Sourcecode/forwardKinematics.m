%% compute forward kinematics for the given position
function grelb = forwardKinematics(position)
    global manipulator;
    
    x = position(1);
    y = position(2);
    theta1 = position(3);
    theta2 = position(4);
    
    %DH parameters
    l1 = manipulator.l1;
    l2 = manipulator.l2;
    a1 = 0;
    a2 = l1;
    d1 = 0;
    d2 = 0;
    alpha1 = 0;
    alpha2 = 0;    
    
    
    T0_1 = computeTransformationMatrix(alpha1, a1, d1, theta1);
    T1_2 = computeTransformationMatrix(alpha2, a2, d2, theta2);
    T2_3 = [1 0 l2;
            0 1 0;
            0 0 0];
    
    grelb = [];
    grelb{1} = T0_1 * T1_2;
    grelb{2} = grelb{1} * T2_3;  
    
    
        
    %%  compute the transformation matrix for (i-1)T(i)
    function transMatrix = computeTransformationMatrix(alpha,a,d,theta)
        transMatrix = [cosd(theta)               -sind(theta)                a;
                       sind(theta)*cosd(alpha)    cosd(theta)*cosd(alpha)    -sind(alpha)*d;
                       0                          0                          1];
    end
    
    
end