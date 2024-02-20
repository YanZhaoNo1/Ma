clc;
clear;
rosshutdown;

% 初始化ROS
rosinit('127.0.0.1');

% 订阅里程计信息
odomSub = rossubscriber('/odom', 'nav_msgs/Odometry');

% 初始位姿
initialPose = [0, 0, 0];

% 当前位姿
currentPose = initialPose;
% 主循环
while true
    % 接收里程计消息
    odomMsg = receive(odomSub);
    robotPose = [odomMsg.Pose.Pose.Position.X, odomMsg.Pose.Pose.Position.Y, 0];

    % 提取线性和角速度
    linearX = odomMsg.Twist.Twist.Linear.X;
    angularZ = odomMsg.Twist.Twist.Angular.Z;

    % 时间步长
    deltaT = 1;  % 假设每次循环的时间间隔是1秒

    % 根据里程计信息更新机器人位姿
    currentPose(1) = currentPose(1) + deltaT * linearX * cos(currentPose(3));
    currentPose(2) = currentPose(2) + deltaT * linearX * sin(currentPose(3));
    currentPose(3) = currentPose(3) + deltaT * angularZ;

    % 打印当前位姿
    disp(['Robot calculate Pose: X = ', num2str(currentPose(1)), ...
                      ', Y = ', num2str(currentPose(2)), ...
                      ', Theta = ', num2str(currentPose(3))]);
    disp(['Robot Real-time Pose: X = ', num2str(robotPose(1)), ...
                              ', Y = ', num2str(robotPose(2))]);
    % 暂停一段时间，模拟实时性
    pause(1);
end