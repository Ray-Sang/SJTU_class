function test(point)
% ʹ��ѡ���ı궨������������Լ��е�ƽ���궨�ɱ�

test_data = dlmread("dataform_testA-0229.csv");
cost_test = get_cost(point,test_data);
fprintf("\nThe test data's average cost is %f4.",cost_test);

end
