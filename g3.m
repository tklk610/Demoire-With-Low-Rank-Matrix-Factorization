clear

A = imread('C:\Users\pc\Desktop\CS_Rectest\MC\ce_svt\im.bmp') ;

x = rgb2gray(A);
x = double(x);
[M,N] = size(x);

% F = zeros(120,200,3);
% F(:,:,1) = x;
% F(:,:,2) = y;
% F(:,:,3) = z;
% F = uint8(F) ;
% imshow(F)
% imwrite(A,'C:\Users\pc\Desktop\CS_Rectest\MC\ce_svt\colorbox.bmp','bmp')


P = zeros(M*N,1) ;
MM = reshape(x,M*N,1) ;
pos = sort(randperm(M*N,M*N*0.5))' ;
P(pos) = MM(pos) ;
index1 = find(P) ;
P(index1) = 1 ;
P = reshape(P,M,N) ;

G = P.*x;
imshow(uint8(G))
hold on
imshow(uint8(x))
