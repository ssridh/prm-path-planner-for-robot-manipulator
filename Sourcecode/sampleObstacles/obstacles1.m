function obstacles = obstacles1()
    obstacles = [];
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

end