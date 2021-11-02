% low rank image completion by SVT algorithm
clear
clc

src_path = fullfile('D:\工作\程序\low rank recovery code\test');
tar_path = fullfile('D:\工作\程序\low rank recovery code\result');

filelist=dir(fullfile(src_path, '*.bmp'));

for n =1:length(filelist)
    A = imread(fullfile(src_path, filelist(n).name));
    
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
        T = 5000000 ;
        delta_t = 1 ;
        
%         [X(:,:,jj), iterations] = SVT(WW(:,:,jj), P, T, delta_t) ;
        
        if jj ==2
            [X(:,:,jj), iterations] = SVT(WW(:,:,jj), P, T, delta_t) ;
        else
            X(:,:,jj) = WW(:,:,jj) ;
        end
        %     [ X(:,:,jj)] = pcp_ad(WW(:,:,jj)) ;
    end
    
    DD  = P.*WW(:,:,1) ;
    DD1 = P.*WW(:,:,2) ;
    DD2 = P.*WW(:,:,3) ;
    
    ff(:,:,1) = DD;
    ff(:,:,2) = DD1;
    ff(:,:,3) = DD2;
    
    figure(1)
    subplot(1,3,1)
    imshow(A)
    title('原图')
    
    subplot(1,3,2)
    imshow(uint8(ff))
    title('采样后的图')
    
    subplot(1,3,3)
    imshow(uint8(X))
    title('恢复的图')
    
    imwrite(uint8(X), fullfile(tar_path, filelist(n).name))
    
    
end
    
    
