function group = get_initial_group()
% ��ȡ��ʼ��Ⱥ

group = zeros(100,90);
possibility_chosen = 0.40; % ѡ��Ϊ1�Ŀ����Կ������⣬û�кܴ���

% ��ÿһ��Ԫ�ؽ��б���������1/0
for k = 1:size(group,1)
    cnt = 0;
    for m = 1:size(group,2)
        if rand() <= possibility_chosen
            group(k,m) = 1;
            cnt = cnt + 1;
        end
    end
    
    % ����ȫ����0����ֻ��һ��1�����
    if cnt == 0 || cnt == 1
        for m = 1:size(group,2)
            if group(k,m) == 0
               group(k,m) = 1;
               cnt = cnt + 1;
            end
            if cnt == 2
               break;
            end
        end
    end
end
end
