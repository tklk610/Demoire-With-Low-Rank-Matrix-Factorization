

% 图像去噪
clear
clc

A = imread('X:\博士\matlab code\CS_Rectest\MC\ce_svt\9817.jpg') ;

WW = double(A) ;
a1 = double(A(:,:,1)) ;
a2 = double(A(:,:,2)) ;
a3 = double(A(:,:,3)) ;

[M,N] = size(a1);

X = zeros(M,N,3);
% sampling
pos = sort(randperm(M*N,M*N*0.5))' ;
    
for jj = 1:3
    P = zeros(M*N,1) ;
    MM = reshape(double(WW(:,:,jj)),M*N,1) ;
    P(pos) = MM(pos) ;
    index1 = find(P) ;
    P(index1) = 1 ;
%     P(index1) = rand(size(index1,1),1) ;
    P = reshape(P,M,N) ; 
    T = 20000 ;
    delta_t = 1 ; 
    tic
    [ X(:,:,jj),iterations ] = SVT(WW(:,:,jj),P,T,delta_t) ;
    toc
%     [ X(:,:,jj)] = pcp_ad(WW(:,:,jj)) ;
end
%[ X1 ] = SVT(p1,P,T,delta_t) ;
% [ X2 ] = SVT(p2,P,T,delta_t) ;
% [ X3 ] = SVT(p3,P,T,delta_t) ;

% rec_X = zeros(M,N,3) ;
% rec_X(:,:,1) = X1 ;
% rec_X(:,:,2) = X2 ;
% rec_X(:,:,3) = X3 ;
DD = P.*WW(:,:,1) ;
% IP = find(DD==0) ;
% DD(IP) = 0;

DD1 = P.*WW(:,:,2) ;
% IP = find(DD1==0) ;
% DD(IP) = 0;

DD2 = P.*WW(:,:,3) ;
% IP = find(DD2==0) ;
% DD(IP) = 0;
ff(:,:,1) = DD;
ff(:,:,2) = DD1;
ff(:,:,3) = DD2;

figure(1)
subplot(1,3,1)
imshow(A)
title("原图")
% subplot(2,2,2)
% imshow(uint8(WW))
% title("椒盐噪声 0.1")
subplot(1,3,2)
imshow(uint8(ff))
title("采样后的图")
subplot(1,3,3)
imshow(uint8(X))
title("恢复的图")

% figure(2)
% imshow(uint8(P.*WW))
% figure(3)
% imshow(uint8(WW))
% figure(4)
% imshow(uint8(X))









