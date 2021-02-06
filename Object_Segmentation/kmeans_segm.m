function [ segmentation, centers ] = kmeans_segm(image, K, L, seed)

  % Let X be a set of pixels and V be a set of K cluster centers in 3D (R,G,B).
  % Randomly initialize the K cluster centers
  % compute all distances between pixels and cluster centers
  % Iterate L times
  % Assign each pixel to the cluster center for which the distance is minimum
  % Recompute each cluster center by taking the mean of all pixels assigned to it
  % Recompute all distances between pixels and cluster centers
  
  rand("seed", seed);
  image = double(image);
  [width, height, dim] = size(image);
  if dim == 3
      Ivec = reshape(image, width*height, 3);
  else
      Ivec = image;
      height = 1;
  end
  segmentation = zeros(1, width*height);
  centers = randi(width*height, K, 1);
  centers = Ivec(centers, :);
  
  d = pdist2(Ivec, centers);
  previous_centers = centers;
  for i=1:L
    [~, c] = min(d, [], 2);
    segmentation = transpose(c);
    for k=1:K
        cluster = Ivec(segmentation == k, :);
        if size(cluster, 1) > 0
          centers(k, :) = mean(cluster);
        end
    end
    
    if previous_centers == centers
      break;
    end
    
    d = pdist2(Ivec, centers);
    previous_centers = centers;
  end
  if dim == 3
      segmentation = reshape(segmentation, width, height);
  end
end
