%A=RecRe(:,2)
%B=RecRe(:,3)
[X,Y]=meshgrid(0:0.01:1,0:0.01:1);

[M,L]=size(X);
Z=zeros(M,L);

for n=1:M
    for m=1:L
        if 1-X(n,m)-Y(n,m)>0.0001
          
        
Z(n,m)=(1/N)*sum((log(X(n,m)*Pmodel(:,1)+Y(n,m)*Pmodel(:,2)+(1-X(n,m)-Y(n,m))*Pmodel(:,3))));
        else
 Z(n,m)=NaN;
        
        end
    end
end
surf(X,Y,Z)
title('average log-likelihood')
xlabel('/lambda_A')
ylabel('/lambda_B')
text ('interpolation of the three original models')