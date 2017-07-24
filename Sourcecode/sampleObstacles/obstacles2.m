function obstacles = obstacles2()
    obstacles = [];
    obs1 = [30,0; 50 0; 50,70; 30,70];
    obs2 = [70,30; 80,30; 80,100; 70,100];       
    
    obstacles.obs = [];
    obstacles.obs{1} = obs1;
    obstacles.obs{2} = obs2;
    
    obstacles.type = 'rectangle';
    
end