function prob = mixture_prob(image, K, L, mask)

    [height, width, ~] = size(image);
    I = im2double(reshape(image, width*height, 3));
    Mvec = reshape(mask, width*height, 1);
    Ivec = I(Mvec==1, :);
    % initialize covariance matrix, means and weights
    seed = 14;
    rand("seed", seed);
    [ segmentation, centers ] = kmeans_segm(Ivec , K, L, seed);
    means = centers;
    cov = cell(K, 1);
    cov(:) = {rand * eye(3)};
    W = zeros(1, K);
    for i = 1:K
        W(i) = sum(segmentation == i)/(width*height);
    end
    G = zeros(size(Ivec, 1), K);
    for i = 1:L
        for k = 1:K
            dif = bsxfun(@minus, Ivec, means(k, :));
            G(:, k) = 1/sqrt((2 * pi)^3*det(cov{k})) * exp(-0.5*sum((dif*inv(cov{k}).*dif), 2));
        end
        P = bsxfun(@times, W, G);
        s = sum(P, 2);
        P = bsxfun(@rdivide, P, s);
        W = sum(P, 1) / size(P, 1);
        for k = 1:K
            means(k, :) = P(:, k)'*Ivec / sum(P(:, k), 1);
            dif = bsxfun(@minus, Ivec, means(k, :));
            cov{k} = (dif'*bsxfun(@times, P(:, k), dif)) / sum(P(:, k), 1);
        end
    end
    G = zeros(size(I, 1), K);
    for k = 1:K
        dif = bsxfun(@minus, I, means(k, :));
        G(:, k) = 1/sqrt((2*pi)^3*det(cov{k})) * exp(-0.5*sum((dif*inv(cov{k}).*dif), 2));
    end
    prob = sum(bsxfun(@times, W, G), 2);
    prob = reshape(prob, height, width, 1);
end