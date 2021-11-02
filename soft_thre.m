

function A = soft_thre(B,T) 

A = sign(B).*max(abs(B)-T,0) ;
end