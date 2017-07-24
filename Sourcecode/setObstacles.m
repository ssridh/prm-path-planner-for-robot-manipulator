%% set rectangle obstacles
%To set different obtacles this file can be extended

function [obstacles] = setObstacles(obsNo)
    obstacles = [];
    if obsNo == 0
        obs1 = [10,50; 20,50; 20,70; 10,70];
        obs2 = [35,10;60,10; 60,25; 35,25];
        obs3 = [60,30; 72,30; 72, 45; 60,45];
        obs4 = [70,75; 80,75; 80,90; 70,90];
        obs5 = [35,40; 45,40; 45,70; 35,70];
        obs6 = [85,35; 95,35; 95,50; 85,50];      
     
        obstacles.obs = [];
        obstacles.obs{1} = obs1;
        obstacles.obs{2} = obs2;
        obstacles.obs{3} = obs3;
        obstacles.obs{4} = obs4;
        obstacles.obs{5} = obs5;
        obstacles.obs{6} = obs6;
        obstacles.type = 'rectangle';
    elseif obsNo == 1
        obs1 = [40,0; 70 0; 70,40; 40,40];
        obs2 = [40,60; 70,60; 70,100; 40,100];
        
        obstacles.obs = [];
        obstacles.obs{1} = obs1;
        obstacles.obs{2} = obs2;
    
        obstacles.type = 'rectangle';
    elseif obsNo == 2
        obs1 = [10,60; 40,60; 40,80; 10,80];
        obs2 = [10,30; 40,30; 40,50; 10,50];
        obs3 = [60,50; 90,50; 90,70; 60,70]; 
        obs4 = [60,20; 90,20; 90,40; 60,40];
    
    
        obstacles.obs = [];
        obstacles.obs{1} = obs1;
        obstacles.obs{2} = obs2;
        obstacles.obs{3} = obs3;
        obstacles.obs{4} = obs4;
    
        obstacles.type = 'rectangle';
    elseif obsNo == 3
        obs1 = [30,0; 50 0; 50,70; 30,70];
        obs2 = [70,30; 80,30; 80,100; 70,100];       
    
        obstacles.obs = [];
        obstacles.obs{1} = obs1;
        obstacles.obs{2} = obs2;
    
        obstacles.type = 'rectangle';
    else
        obs1 = [10,50; 20,50; 20,70; 10,70];
        obs2 = [35,10;60,10; 60,25; 35,25];
        obs3 = [60,30; 72,30; 72, 45; 60,45];
        obs4 = [70,75; 80,75; 80,90; 70,90];
        obs5 = [35,40; 45,40; 45,70; 35,70];
        obs6 = [85,35; 95,35; 95,50; 85,50];      
     
        obstacles.obs = [];
        obstacles.obs{1} = obs1;
        obstacles.obs{2} = obs2;
        obstacles.obs{3} = obs3;
        obstacles.obs{4} = obs4;
        obstacles.obs{5} = obs5;
        obstacles.obs{6} = obs6;
        obstacles.type = 'rectangle';
    end
        
        
end