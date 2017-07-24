function obstacles = obstacles0()
    obstacles = [];
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