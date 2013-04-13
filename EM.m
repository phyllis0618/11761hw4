%function EMtext=EM(Pmodel,La,Lb,Lc,r)
Rec=[];% Line 1 LTnew Line2 Ratio Line3 La Line4 Lb Line5 Lc 

[N,l]=size(Pmodel);
La=0.25;
Lb=0.25;
Lc=0.25;
Ld=0.25;
d=1/15000;
r=0.000000001;
TOL = 0.000000001;
ratio=1;
%for k=1:100
  while(ratio>r)
  lamdaa=0;
  lamdab=0;
  lamdac=0;
  lamdad=0;
  temp=[];
for n=1:N
    
    lamdaa=lamdaa+(La*Pmodel(n,1)/(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)+Ld*d));
    
    
    lamdab=lamdab+(Lb*Pmodel(n,2)/(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)+Ld*d));
    lamdac=lamdac+(La*Pmodel(n,3)/(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)+Ld*d));
    lamdad=lamdad+((Ld*d)/(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)+Ld*d));
   %{
   
  
    lamdaa=lamdaa+(La*Pmodel(n,1)/(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)));
    
    
    lamdab=lamdab+(Lb*Pmodel(n,2)/(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)));
    lamdac=lamdac+(Lc*Pmodel(n,3)/(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)));
    %}
   
end
Lanew=(1/N)*lamdaa;
Lbnew=(1/N)*lamdab;
Lcnew=(1/N)*lamdac;

%Ldnew=(1/N)*lamdaa;
%Ldnew=(1/N)*lamdab;
Ldnew=(1/N)*lamdad;

      
%{
Lanew=(1/N)*sum(La*Pmodel(1:N,1)/(La*Pmodel(1:N,1)+Lb*Pmodel(1:N,2)+Lc*Pmodel(1:N,3)))
Lbnew=(1/N)*sum(Lb*Pmodel(1:N,2)/(La*Pmodel(1:N,1)+Lb*Pmodel(1:N,2)+Lc*Pmodel(1:N,3)))
Lcnew=(1/N)*sum(La*Pmodel(1:N,3)/(La*Pmodel(1:N,1)+Lb*Pmodel(1:N,2)+Lc*Pmodel(1:N,3)))
%}
sumLT=0;
sumLTnew=0;
for m=1:N
    sumLT=sumLT+(log(La*Pmodel(m,1)+Lb*Pmodel(m,2)+Lc*Pmodel(m,3)+Ld*d));
    sumLTnew=sumLTnew+(log(Lanew*Pmodel(m,1)+Lbnew*Pmodel(m,2)+Lcnew*Pmodel(m,3)+Ldnew*d));
   % sumLT=sumLT+(log(La*Pmodel(m,1)+Lb*Pmodel(m,2)+Lc*Pmodel(m,3)));
   % sumLTnew=sumLTnew+(log(Lanew*Pmodel(m,1)+Lbnew*Pmodel(m,2)+Lcnew*Pmodel(m,3)));
  end

LT=(1/N)*sumLT;
LTnew=(1/N)*sumLTnew;
%}
%{      
LT=(1/N)*sum(log(La*Pmodel(1:N,1)+Lb*Pmodel(1:N,2)+Lc*Pmodel(1:N,3)))
LTnew=(1/N)*sum(log(Lanew*Pmodel(1:N,1)+Lbnew*Pmodel(1:N,2)+Lcnew*Pmodel(1:N,3)))
 %ans=(LTnew-LT)/abs(LTnew)
 %}
 ratio=abs(LTnew-LT)/abs(LTnew);
 La=Lanew;
 Lb=Lbnew;
 Lc=Lcnew;
 Ld=Ldnew;
 %RecLambdaABC=[La Lb Lc ]
 %loglikelihood=LTnew
 temp=[LTnew;La;Lb;Lc;Ld];
 Rec=[Rec temp];

%disp('La'+'Lb'+'Lc'+'LT'+'LTnew'+'ans')
%disp(La)

if(ratio<=r)
    ratio;
    break
    
 



    
    %Lanew=(1/N)*sum(La*Pmodel(n,1)/(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)))
    %Lbnew=(1/N)*sum(Lb*Pmodel(n,2)/(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)))
    %Lcnew=(1/N)*sum(Lc*Pmodel(n,3)/(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)))
    
  %LT=(1/N)*sum (log(La*Pmodel(n,1)+Lb*Pmodel(n,2)+Lc*Pmodel(n,3)))
  %LTnew=(1/N)*sum (log(Lanew*Pmodel(n,1)+Lbnew*Pmodel(n,2)+Lcnew*Pmodel(n,3)))
  
   %if((LTnew-LT)/abs(LTnew)<=r)
    %  break
 % else
  %    La==Lanew
   %   Lb==Lbnew
    %  Lc==Lcnew
end;
RecRe=Rec'
end;



