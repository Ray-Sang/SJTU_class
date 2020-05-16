function adaption = get_adaption(cost)
% ���ݱ궨�ɱ�������Ӧ��
% ����һ��1*100������������ÿ���궨��������Ӧ�ȴ�С

adaption = zeros(1,size(cost,2));
% solution:���cost����800����ô��Ӧ�ȴ�С�����ó�100�����С��800����Ӧ�ȴ�С����2^(800-cost)
for k = 1:size(cost,2)
   if cost(1,k) > 800
       adaption(1,k) = 100;
   else
       adaption(1,k) = 2^(800-cost(1,k));
   end
end

adaption_sum = sum(adaption);
adaption = adaption ./ adaption_sum;

end
