function resampledParticles = resampleParticles(particleSet)
    % 对粒子集合进行重采样
    weights = rand(size(particleSet, 1), 1);
    [~, idx] = sort(weights, 'descend');
    resampledParticles = particleSet(idx, :);
end