function group = mutate(group)
% �����ʵ��

% �������õı�����ʣ�����1��0��0.08,0��1��0.02
possibility = 0.2;
possibility_0 = 0.1; % 0��1�ĸ���
possibility_1 = 0.9; % 1��0�ĸ���

for k = 1:size(group,1)
   for m = 1:size(group,2)
       if rand() < possibility
           if group(k,m)
               if rand() < possibility_1
                   group(k,m) = 0;
               end
           else
               if rand() < possibility_0
                    group(k,m) = 1;
               end
           end
       end
   end
end

end
