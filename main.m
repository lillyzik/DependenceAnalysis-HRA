T={'Z','L','M','H','C','ZL','ZM','ZH','ZC','LM','LH','LC','MH','MC','HC', ...
   'ZLM','ZLH','ZLC','ZMH','ZMC','ZHC','LMH','LMC','LHC','MHC',...
   'LMHC','ZMHC','ZLHC','ZLMC','ZLMH','ZLMHC'}; % T is the all elements
%performers
m1=[0,0,0.2,0.2,0.6];
m2=[0,0.2,0.2,0,0.6];
m3=[0.1,0,0,0.4,0.5];
m=['M',0,0,0,0;'H',0,0,0,0;'C',0,0,0,0;'H','C',0,0,0;'Z','L','M','H','C'];
T1={'M','H','C','HC','ZLMHC'};


%times
% m1=[0.4,0,0,0.6];
% m2=[0.4,0.1,0,0.5];
% m3=[0,0,0.4,0.6];
% m=['M',0,0,0,0;'H',0,0,0,0;'M','H',0,0,0;'Z','L','M','H','C'];
% T1={'M','H','MH','ZLMHC'};



% %cues
% m1=[0.4,0,0.6];
% m2=[0,0.2,0.8];
% m3=[0.3,0,0.7];
% m=['L','M',0,0,0;'L','M','H',0,0;'Z','L','M','H','C'];
% T1={'LM','LMH','ZLMHC'};


% 
% %goals
% m1=[1];
% m2=[1];
% m3=[1];
% m=['L',0,0,0,0];
% T1=['L'];


M_count=3
M_s=[m1;m2;m3]
Crd_M=crDegree(M_s,M_count,m,T1,T);
mean_m=zeros(1,length(m1));
for i=1:length(m1)
    for j=1:length(Crd_M)
        mean_m(i)=mean_m(i)+Crd_M(j)*M_s(j,i);
    end
end


temp1=DempsterCombinationRule(mean_m,mean_m,T1,T1,T,5);
temp1(find(temp1==0))=[]
temp2=DempsterCombinationRule(temp1,mean_m,T1,T1,T,5);
temp2(find(temp2==0))=[]
result=DempsterCombinationRule(temp2,mean_m,T1,T1,T,5);

for i=1:length(result)
    result(i)=result(i)*weight;
end