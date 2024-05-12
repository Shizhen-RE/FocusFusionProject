function high_freq_am = laplacian_pyramid(inImg)
mrp = multiresolutionPyramid(inImg);
lapp = laplacianPyramid(mrp);
high_freq_am = vecnorm(lapp{1}, 2, 3);
end
%generate Laplacian pyramid as difference in levels of Gaussian
function lapp = laplacianPyramid(mrp)
lapp = cell(size(mrp));
num_levels = numel(mrp);
lapp{num_levels} = mrp{num_levels};
for k = 1:(num_levels - 1)
   A = mrp{k};
   B = imresize(mrp{k+1},2,'lanczos3');
   [M,N,~] = size(A);
   lapp{k} = A - B(1:M,1:N,:);
end
lapp{end} = mrp{end};
end
%generate Guassian Pyramid
function mrp = multiresolutionPyramid(A,num_levels)
A = im2double(A);
M = size(A,1);
N = size(A,2);
if nargin < 2
    lower_limit = 32;
    num_levels = min(floor(log2([M N]) - log2(lower_limit))) + 1;
else
    num_levels = min(num_levels, min(floor(log2([M N]))) + 2);
end
mrp = cell(1,num_levels);
smallest_size = [M N] / 2^(num_levels - 1);
smallest_size = ceil(smallest_size);
padded_size = smallest_size * 2^(num_levels - 1);
Ap = padarray(A,padded_size - [M N],'replicate','post');
mrp{1} = Ap;
for k = 2:num_levels
    mrp{k} = imresize(mrp{k-1},0.5,'lanczos3');
end
mrp{1} = A;
end
%interpolation function
function f = lanczos3(x)
% See Graphics Gems, Andrew S. Glasser (ed), Morgan Kaufman, 1990,
% pp. 157-158.
f = (sin(pi*x) .* sin(pi*x/3) + eps) ./ ((pi^2 * x.^2 / 3) + eps);
f = f .* (abs(x) < 3);
end