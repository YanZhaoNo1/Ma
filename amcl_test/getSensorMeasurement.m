function sensorMeasurement = getSensorMeasurement()
    try
        % 创建ROS激光雷达数据订阅器
        laserSub = rossubscriber('/scan', 'sensor_msgs/LaserScan');

        % 获取激光雷达数据
        laserMsg = receive(laserSub);

        % 假设激光雷达数据存储在 Ranges 字段中
        ranges = laserMsg.Ranges;

        % 获取最小距离或其他感兴趣的信息
        minDistance = min(ranges);

        % 获取消息时间戳
        timestamp = laserMsg.Header.Stamp;

        % 将传感器测量信息封装为一个结构体或数组
        sensorMeasurement = struct('Ranges', ranges, 'MinDistance', minDistance, 'Timestamp', timestamp);
        

    % 清理订阅器
    clear laserSub;
end