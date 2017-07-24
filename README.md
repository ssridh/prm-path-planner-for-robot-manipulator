# prm-path-planner-for-robot-manipulator

Project Description:
The main objective of the project is to implement a path planner for a mobile 2-arm manipulator using Probabilistic Roadmap path planner algorithm is a static environment. The result is the emulated path of the 2-arm manipulator from start to goal position avoiding collision with the obstacles in the environment.
The start position and the goal position and the obstacles in the environment can be specified by the user. Given the start and goal position, to construct a path in the free space and to plan trajectory for the motion of the manipulator from the start to goal position.

Development Environment:
The project is implemented in MATLAB.
The emulation of the generated path will be displayed on the GUI. The start and goal configurations can be given as input in the GUI. The obstacles in the environment are currently fixed to 4 different types of maps. To add different obstacles other than the 4 maps on the GUI, the code should be changed in the file setObstacles.m.
The executable attached supports only 4 different types of maps/obstacles. To try different obstacles, the source code needs to be imported using MATLAB and the setObstacle.m should be modified.
