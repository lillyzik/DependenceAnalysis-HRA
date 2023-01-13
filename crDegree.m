function [ Crd_M ] = crDegree(M_s,M_count,MSet,T1,T)

CM=zeros(M_count,M_count);

for i=1:M_count
    for j=1:M_count
        cm1m1=Correlation(M_s(i,:),M_s(i,:),MSet);
        cm1m2=Correlation(M_s(i,:),M_s(j,:),MSet);
        cm2m2=Correlation(M_s(j,:),M_s(j,:),MSet);
        CM(i,j)=cm1m2/sqrt (cm1m1*cm2m2);
    end
end

%CIQ
% for i=1:M_count
%     for j=1:M_count
%         CM(i,j)=CIQ(M_s(i,:),M_s(j,:),MSet);
%     end
% end

%ECC
% for i=1:M_count
%     for j=1:M_count
%         cm1m1=Correlation(M_s(i,:),M_s(i,:),MSet);
%         cm1m2=Correlation(M_s(i,:),M_s(j,:),MSet);
%         cm2m2=Correlation(M_s(j,:),M_s(j,:),MSet);
%         CM(i,j)=(cm1m2/sqrt (cm1m1*cm2m2))^2;
%     end
% end

%Qcorrelation
% for i=1:M_count
%     for j=1:M_count
%         CM(i,j)=Qcorrelation(M_s(i,:),M_s(j,:),MSet,T1,T);
%     end
% end

Sup_M=zeros(M_count,1);
for i=1:M_count
    for j=1:M_count
        if i~=j
            Sup_M(i)=Sup_M(i)+CM(i,j);
        end
    end
end

Crd_M=zeros(M_count,1);
Sup_SUM=sum(Sup_M);
for i=1:M_count
    Crd_M(i)=Sup_M(i)/Sup_SUM;
end