function predictedParticle = predictParticle(currentParticle, robotMotion)
    % currentParticle 是当前粒子的位置 [x, y, theta]
    % robotMotion 包含机器人的线性和角速度信息 Linear: [X, Y], Angular: [Z]

    % 解析当前粒子的位置信息
    x = currentParticle(1);
    y = currentParticle(2);
    theta = currentParticle(3);

    % 解析机器人运动信息
    linearX = robotMotion.Linear.X;
    linearY = robotMotion.Linear.Y;
    angularZ = robotMotion.Angular.Z;

    % 假设简单的模型，根据四轮麦轮车底盘的运动学方程进行预测
    deltaT = 1; % 时间步长
    v = sqrt(linearX^2 + linearY^2); % 速度
    omega = angularZ; % 角速度

    % 更新粒子的预测位置
    predictedParticle = [
        x + deltaT * v * cos(theta);
        y + deltaT * v * sin(theta);
        theta + deltaT * omega
    ];
end
