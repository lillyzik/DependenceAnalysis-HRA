 function [ corrDegree ] = Correlation(M1,M2,MSet)
 corrDegree=0;
for i= 1:length(M1)
    for k=1:length(M2)
        a=M1(i);
        b=M2(k);
        
        tmp1=MSet(i,:);
        tmp1(find(tmp1==0))=[];
        tmp2=MSet(k,:);
        tmp2(find(tmp2==0))=[];
        c=length(intersect(tmp1,tmp2));
        d=length(union(tmp1,tmp2));
        corrDegree=corrDegree+M1(i)*M2(k)*(length(intersect(tmp1,tmp2))/length(union(tmp1,tmp2)));
    end
end