function updatedParticle = updateParticle(predictedParticle, particleWeight)
    % 这里简单地将权重作为比例因子来更新粒子的位置
    updatedParticle = predictedParticle * particleWeight;
end