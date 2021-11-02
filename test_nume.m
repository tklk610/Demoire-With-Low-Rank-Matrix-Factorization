

% solve PCP problem by Alternating Directions
clear
clc

m = 100 ;
n = 100 ;
r = 0.05*n ;
rate = 0.05 ;
% Generating a low rank matrix
LL = randn(m,r)/sqrt(m)*randn(r,n)/sqrt(n) ;
% Generating a large sparse noise matrix (Bernoulli matrix)
SS = randi([0,1],m,n) ;
SS(SS==0) = -1 ;

% sampling
ss = SS(:) ;
index = sort(randperm(m*n,ceil(rate*n*m))) ;
ss1 = zeros(m*n,1) ;
ss1(index) = ss(index) ;
SS = reshape(ss1,m,n) ;
M = LL+SS ;

lambda = 1/sqrt(max(m,n)) ;
% u = m*n/4/sum(sum(abs(M))) ;
u = 10*lambda ;
% lambda = 1e-6 ;

% [L,S] = pcp_ad(M,u,lambda,1000) ;
[L,S] = RobustPCA(M,lambda,u);
% [L,S] = pcp_ad(M,u,lambda,500,1e-8);
% [L,S] = adm_lrr(M);
MM = M-L-S ;

norm(M-MM,'fro')/norm(M,'fro')

norm(M-L-S,'fro')/norm(M,'fro')

norm(L-LL,'fro')/norm(LL,'fro')

norm(S-SS,'fro')/norm(SS,'fro')





