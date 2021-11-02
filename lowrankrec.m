

% low rank and sparse noise image recovery
clear
clc

A = imread('C:\Users\pc\Desktop\CS_Rectest\MC\ce_svt\colorbox11.bmp') ;
% A = double(imread('moon.tif'))/255;
% A = A(141:140+256, 51:50+256);
% WW = double(imnoise(A,'gaussian',0.01)) ;
WW = double(A) ;
a1 = double(A(:,:,1)) ;
a2 = double(A(:,:,2)) ;
a3 = double(A(:,:,3)) ;
[M,N] = size(a1);
X = zeros(M,N,3);

    
for jj = 1:3
    
    lambda = 1*1 / sqrt(max(M,N)); 
    u =  1*lambda;
%     u = M*N/4/sum(sum(abs(WW(:,:,jj)))) ;
%     [ X(:,:,jj),iterations ] = SVT(WW(:,:,jj),P,T,delta_t) ;
    [ X(:,:,jj),S(:,:,jj)] = RobustPCA(WW(:,:,jj),lambda,u,1e-8,200) ;
%     [ X(:,:,jj),S(:,:,jj)] = pcp_ad(WW(:,:,jj),u,lambda,200,1e-8) ;
end


figure(1)
subplot(3,1,1)
imshow(A)
title("‘≠Õº",'fontsize',12)
% subplot(2,2,2)
% imshow(uint8(WW))
% title("Ω∑—Œ‘Î…˘ 0.1")
% subplot(1,3,2)
% imshow(uint8(ff))
% title("≤…—˘∫ÛµƒÕº")
subplot(3,1,2)
imshow(uint8(X))
title("µÕ÷»Õº",'fontsize',12)
d = S ;
d(d<20) = 255 ;
subplot(3,1,3)
imshow(uint8(d))
title("‘Î…˘Õº",'fontsize',12)
% figure(2)
% imshow(uint8(P.*WW))
% figure(3)
% imshow(uint8(WW))
% figure(4)
% imshow(uint8(X))










