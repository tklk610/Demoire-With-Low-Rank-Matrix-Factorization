

function [A] = sig_thre(B,T)

[s,v,d] = svd(B,'econ') ;
%     v(v<T) = 0 ;
%     A = s*v*d' ;
A = s*soft_thre(v,T)*d' ;
end