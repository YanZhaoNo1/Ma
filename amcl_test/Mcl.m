clc;
% 关闭所有的ros节点
rosshutdown

% 初始化ROS
rosinit('127.0.0.1');

% 订阅机器人位置信息
odomSub = rossubscriber('/odom', 'nav_msgs/Odometry');
cmdVelSub = rossubscriber('/cmd_vel', 'geometry_msgs/Twist');

% 获取雷达传感器的数据信息
sensorMeasurement = getSensorMeasurement();

% 设置蒙特卡洛算法参数
numParticles = 1000;
initialPose = [0, 0, 0];
particleSet = repmat(initialPose, numParticles, 1);

% 主循环
while true

    % 获取机器人速度信息
    cmdVelMsg = receive(cmdVelSub);

    % 获取机器人位置信息
    odomMsg = receive(odomSub);
    robotPose = [odomMsg.Pose.Pose.Position.X, odomMsg.Pose.Pose.Position.Y, 0];

    % 解析线速度和角速度
    linearX = cmdVelMsg.Linear.X;
    linearY = cmdVelMsg.Linear.Y;
    angularZ = cmdVelMsg.Angular.Z;
    
    % 封装机器人运动信息
    robotMotion.Linear.X = linearX;
    robotMotion.Linear.Y = linearY;
    robotMotion.Angular.Z = angularZ;

    % 更新蒙特卡洛粒子滤波
    for i = 1:numParticles

    % 根据机器人运动模型进行粒子预测粒子的下一个位置
    predictedParticle = predictParticle(particleSet(i, :), robotMotion);
    disp(['Size of predictedParticle: ', num2str(size(predictedParticle))]);
    particleWeight = calculateWeight(predictedParticle, sensorMeasurement);

    % 将权重更新后的粒子保存回粒子集合
    particleSet(i, :) = updateParticle(predictedParticle, particleWeight);
    end

    % 对粒子集合进行重采样
    particleSet = resampleParticles(particleSet);

    % 打印实时位置信息
    disp(['Robot calculate Pose: X = ', num2str(mean(particleSet(:,1))), ...
                                         ', Y = ', num2str(mean(particleSet(:,2)))]);
    disp(['Robot Real-time Pose: X = ', num2str(robotPose(1)), ', Y = ', num2str(robotPose(2))]);

    % 暂停一段时间，模拟实时性
    pause(1);
end
