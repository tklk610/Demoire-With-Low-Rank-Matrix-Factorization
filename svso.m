function B = svso( t,A )
% Singular Value Shrinkage Operator
% function�����������ʽ���Ż�ģ��
%       argminB { p1||B||* + 0.5||B-A||F2 }
% input������t������A
% output���Ż�ģ�͵����Ž�B

[ U,s,V ] = svd( A );%���U��sigma,V
s = s - t;                 %��-t
ZeroLog = s > 0;
s = s.*ZeroLog;
B = U * s * V';       %�������ֵ������ľ���

end