% Numerical verification for SVT algorithm
clear
clc

r = 2 ; % rank(M) = 2 ;
n1 = 200 ; % row length of M
n2 = 300 ; % column length of M
sample_rate = 0.5 ; 
% real
% M = rand(n1,r)*rand(r,n2) ;
% complex
M = (rand(n1,r)+1i*rand(n1,r))*(rand(r,n2)+1i*rand(r,n2))/2 ;

% construct index matrix
P = zeros(n1*n2,1) ;  
MM = reshape(M,n1*n2,1) ;
pos = sort(randperm(n1*n2,n1*n2*sample_rate))' ;
P(pos) = MM(pos) ;
index1 = find(P) ;
P(index1) = 1 ;
P = reshape(P,n1,n2) ;

% set threshold & step size
T = sqrt(n1*n2); 
delta = 2 ;

[ X,iterations ] = SVT(M,P,T,delta) ;

% norm(P.*(X-M),'fro')
norm(P.*(X-M),'fro')/norm(P.*M,'fro')

% norm(X-M,'fro')
% norm(X-M,'fro')/norm(M,'fro')






