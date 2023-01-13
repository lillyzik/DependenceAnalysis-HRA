function out = DScombination(m1, m2,T1,T2,T,N)

    lenth1 = max(size(m1));
    lenth2 = max(size(m2));
    lenth=2^N-1;

    BPA = zeros(1,lenth);           % BPA
    
    k=0;
    for i= 1:length(M1)
        for k=1:length(M2)

            tmp1=MSet(i,:);
            tmp1(find(tmp1==0))=[];
            tmp2=MSet(k,:);
            tmp2(find(tmp2==0))=[];
            if isempty(intersect(tmp1,tmp2))
                k=k+M1(i)*M2(k);
            end
        end
    end


   for t=1:lenth                 % calculate each mass of elent in final BPA
        item = 0.00;
        for i = 1:(lenth1)
            for j = 1:(lenth2)
                if size(intersect(T1{i},T2{j})) == size(T{t})
                    if intersect(T1{i},T2{j}) == T{t}
                        item = item + m1(i)*m2(j);
                    end
                end
            end
        end
        out(t) = item/(1-k);
    end
end


