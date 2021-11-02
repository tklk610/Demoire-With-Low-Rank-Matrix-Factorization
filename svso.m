function B = svso( t,A )
% Singular Value Shrinkage Operator
% function：求解如下形式的优化模型
%       argminB { p1||B||* + 0.5||B-A||F2 }
% input：参数t，矩阵A
% output：优化模型的最优解B

[ U,s,V ] = svd( A );%求解U，sigma,V
s = s - t;                 %σ-t
ZeroLog = s > 0;
s = s.*ZeroLog;
B = U * s * V';       %输出奇异值缩紧后的矩阵

end