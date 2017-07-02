%% Hand Wave Solution
% An example solution using the Maestro class to control a 6 degree of
% freedom robot.

%% Hand Wave
% This uses the OS level (Maestro) class.
disp('Robotic Arm Hand Wave Test...');
waitTime = 0.5;

% Create a new robot, and set it home.
myRobot = Maestro(true);
myRobot.goHome();

% Set servo 1 and 2 at a 'slight' angle (left?)
myRobot.setTarget(1, 5000);
myRobot.setTarget(2, 4000);
pause(waitTime);

% Set servo 1 and 2 to the centre
myRobot.setTarget(1, 6000);
myRobot.setTarget(2, 6000);
pause(waitTime);

% Set servo 1 and 2 at a 'slight' angle (right?)
myRobot.setTarget(1, 7000);
myRobot.setTarget(2, 8000);
pause(waitTime);

% Set servo 1 and 2 to the centre
myRobot.setTarget(1, 6000);
myRobot.setTarget(2, 6000);
pause(waitTime);
