function min_result = print_result(group,cost)
% ���ִ�н��������1*100������¼Ҫѡ��ĵ�

min_cost = min(cost);
[m,n] = find(cost == min_cost);
min_result2 = group(n,:); % ����ж����ͬ��ֵ����ôfind����Ҳ��һ������ÿ�����ݻ���ͬ
min_result = min_result2(1,:);
temperature_point = [];

for k = 1:size(min_result,2)
    if min_result(1,k) == 1
        temperature_point = [temperature_point k-21];
    end
end

fprintf("The minimun cost is: %f4.\n",min_cost);
disp("The chosen temperature point is :");disp(temperature_point);

end
