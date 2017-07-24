function obstacles = obstacles3()
    obstacles = [];
    
    obs1 = [40,0; 70 0; 70,40; 40,40];
    obs2 = [40,60; 70,60; 70,100; 40,100];
        
    
    obstacles.obs = [];
    obstacles.obs{1} = obs1;
    obstacles.obs{2} = obs2;
    
    obstacles.type = 'rectangle';
    
    
end