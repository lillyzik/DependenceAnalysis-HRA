 function [ ciq ] = CIQ(M1,M2,MSet)
 D_size=length(M1)
 D=zeros(D_size,D_size);
 for i=1:D_size
    for j=1:D_size
        tmp1=MSet(i,:);
        tmp1(find(tmp1==0))=[];
        tmp2=MSet(j,:);
        tmp2(find(tmp2==0))=[];
        D(i,j)=(2^length(intersect(tmp1,tmp2))-1)/(2^length(union(tmp1,tmp2))-1);
    end
 end
 
 m1_p=D*(M1)'
 m2_p=D*(M2)'
 
 IQ_m1_p=0
 IQ_m2_p=0
 for k=1:D_size
     tmp=MSet(k,:)
     tmp(find(tmp==0))=[]
     IQ_m1_p=IQ_m1_p+(m1_p(k)/(2^length(tmp)-1))^2
     IQ_m2_p=IQ_m2_p+(m2_p(k)/(2^length(tmp)-1))^2
 end
 
 up=0
  for k=1:D_size
     tmp=MSet(k,:)
     tmp(find(tmp==0))=[]
     up=up+(m1_p(k)*m2_p(k)/(2^length(tmp)-1))
  end
 
  ciq=up/sqrt (IQ_m1_p*IQ_m2_p)
 

 
 