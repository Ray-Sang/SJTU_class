function group = exchange(group)
% ���滥���Ĵ���ʵ��

group_size = size(group,1); % ȡ��group������

for k = 1:1/2 * group_size
    % ѡ�񽻻��ĵ㣬���ó���20~70֮�����ֵ
    position = ceil(rand()*70) - ceil(rand()*20);
    
    % ���򽻲���ԣ�Ƭ�ν�����
    for j = 1:position
        medium = group(k,j); % �������Ƶ��м价�ڣ�a��b��������ʱ����
        group(k,j) = group(group_size - k + 1,j);
        group(group_size - k + 1,j) = medium;
    end
end

end
