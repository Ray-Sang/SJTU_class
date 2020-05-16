% ���ļ��ǰ��� 1 �Ĵ����ļ�

tic
clear;

iteration_flag = 1;
cnt = 0; % ��¼��������
y_cost = []; % ��¼ÿ�ε���֮��Ĳⶨ�ɱ�

% ������ʼ��Ⱥ,��СΪ100*90
group = get_initial_group();

% ����ѵ������
training_data = dlmread("dataform_train-0229.csv"); % ��СΪ1000*90����500��T/V��ϵ���������¶ȣ������ǵ�ѹ

cost = get_cost(group,training_data); % �����ݽ�������������ֵ���ֱ��100����������궨�ɱ�������һ��1*100����������¼ÿ������ı궨�ɱ�

% ��ȷ������Ҫ���ݵ�ѹ��Ϊ�Ա�����ϳ��¶����ѹ�Ĺ�ϵ����ѹ���Ա�����
while iteration_flag
    cnt = cnt + 1; % ��¼��������
    
    % ������Ӧ��
    adaption = get_adaption(cost);
    
    % ��̭
    group = eliminate(group,adaption);
    
    % ���滥����ע����������ݵ��������������
    group = exchange(group);
    
    % ���죬ע����������ݵ��������������
    group = mutate(group);
    
    % �����ԡ������Ƿ��������ݵ��������������
    group = check_ones(group);
    
    cost = get_cost(group,training_data); % �����ݽ�������������ֵ���ֱ��100����������궨�ɱ�������һ��1*100����������¼ÿ������ı궨�ɱ�
    
    y_cost = [y_cost min(cost)]; % ��¼ÿ�ε��������Сƽ���ⶨ�ɱ�
    
    % �ж��Ƿ��˳�ѭ��
    iteration_flag = is_to_jump_out(y_cost);
end

% �����С��ƽ���궨�ɱ��ͱ궨��
point = print_result(group,cost); % ����һ��1*90����������¼��Ϊ1�����ݵ�
fprintf("Iterated %d times.\n",size(y_cost,2));
x_iterate = 1:1:cnt;

% ����������
plot(x_iterate,y_cost,'x--');
xlabel('Iteration times');
ylabel('Calibration cost');
title('The curve of iteration');

% ���Բ��Լ�����
test(point);

toc
