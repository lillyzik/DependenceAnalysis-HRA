 function [ qcorrelation ] = Qcorrelation(M1,M2,MSet,T1,T)
 qcorrelation=0
 P_size=length(M1)
 P=zeros(P_size,P_size);
 for i=1:P_size
    for j=1:P_size
        tmp1=MSet(i,:);
        tmp1(find(tmp1==0))=[];
        tmp2=MSet(j,:);
        tmp2(find(tmp2==0))=[];
        if (M1(i)==0 & M2(j)==0)
            P(i,j)=0
        elseif (M1(i)<=M2(j))
            P(i,j)=(length(intersect(tmp1,tmp2))/length(union(tmp1,tmp2)))*(M1(i)/M2(j));
        else
            P(i,j)=(length(intersect(tmp1,tmp2))/length(union(tmp1,tmp2)))*(M2(j)/M1(i));
        end
    end
 end
 
 K=0;
 for i=1:(P_size)                   
     for j=1:(P_size)
         if isempty(intersect(T1{i},T1{j}))
             K = K + M1(i)*M2(j);
         end
     end
 end
  for i=1:P_size
    for j=1:P_size
        qcorrelation=qcorrelation+1/(1-K)*P(i,j)*M1(i)*M2(j)
    end
  end
    