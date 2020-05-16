function average_cost = get_cost(group,training_data)
% �����ݽ�����ϡ�����������ֵ���ֱ��500�����ݼ���궨�ɱ�������һ��1*100����������¼ÿ������ı궨�ɱ�

Q = 50; % ���õ��βⶨ�ɱ�
average_cost = zeros(1,size(group,1));

% ��200�ֱ궨������ÿһ�����������м���궨�ɱ�
for k = 1:size(group,1)
    % ��500���У�ÿһ��t v���ݽ���ѡ�㣬��ϣ���ֵ��������ɱ��������øı궨������ƽ���ɱ�
    cost_sum = 0; % ���ֱ궨����£��ɱ����ܺ�
    count = 0; % �ۼӲⶨ����
    y = []; % ����ѡ�еĲⶨ����¶�
    for m = 1:size(group,2)
        if group(k,m) == 1
            count = count + 1;
            y = [y m-21];
        end
    end
    
    for n = 1:(size(training_data,1)/2)
        % ������ѡ��ĵ�ĵ�ѹֵ�������꣩���������� x ��
        x = [];
        cost = 0;
        for m = 1:size(group,2)
            if group(k,m) == 1
                tmp = training_data(2*n,m);
                x = [x tmp];
            end
        end
    
        % ��ѡ�е����ݵ��������������ֵ���
        yy = spline(x,y,training_data(2*n,:)); % ������Ϻ���¶�ֵ 
        del_temperature = abs(yy - training_data(2*n-1,:)); % del_temperature���������Ϻ���¶Ȳ�ֵ
    
        % ���㵥�Ρ���һ�����ݵı궨�ɱ�
        cost = count * Q;
        for m = 1:size(del_temperature,2)
            if del_temperature(1,m) <= 0.5
                continue;
            elseif del_temperature(1,m) > 0.5 && del_temperature(1,m) <=1
                cost = cost + 1;
            elseif del_temperature(1,m) > 1 && del_temperature(1,m) <=1.5
                cost = cost + 5;
            elseif del_temperature(1,m) > 1.5 && del_temperature(1,m) <=2.0
                cost = cost + 10;
            else
                cost = cost + 10000;
            end
        end
        
        % ��ÿ��ɱ������ۼ�
        cost_sum = cost_sum + cost;
    end
    
    % �����500�����ݱ궨��ƽ���ɱ������洢��average_cost��Ӧ��λ��
    average_cost(1,k) = cost_sum/(size(training_data,1)*0.5);
end
end
