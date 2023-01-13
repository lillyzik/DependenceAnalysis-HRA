function BetP = BetP(M,T,C)
BetP=zeros(1,length(C));
for i=1:length(C)
    for j=1:length(T)
        check=ismember(C{i},T{j});
        IsSub=all(check);
        if IsSub==1
            BetP(i)= BetP(i)+(1/length(T{j}))*(M(j)/(1-0-M(length(M))));
        end
    end
end