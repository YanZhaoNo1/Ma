function particleWeight = calculateWeight(predictedParticle, sensorMeasurement)
    % 提取数组中的元素
    predX = predictedParticle(1);
    predY = predictedParticle(2);
    
    sensorY = sensorMeasurement(2);

    % 计算欧氏距离
    distance = norm([predX - sensorX, predY - sensorY]);

    % 计算权重（可以根据需要调整权重计算方法）
    particleWeight = 1 / (1 + distance);  % 设权重与距离成反比


    % 错误处理，如果需要的话
    if isnan(particleWeight) || isinf(particleWeight)
        error('无法计算有效权重。');
    end
end