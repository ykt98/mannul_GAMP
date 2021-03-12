function plot_resx(pathname,filename,mode)
staname=strrep(filename,'_','+');
fullname = [pathname  filename];
A=load(fullname);
A(find(A == 99999.0)) = NaN;
%gpst = mod(A(:,2),86400*2)/3600;0;
diff_week = A(:,7)-A(1,7);  %���һ����Ԫ��gpsweek֮��
gpst = diff_week *7 *24 + A(:,8)/3600 - A(1,8)/3600;  %��ǰ��Ԫ�����ڵ�Сʱ�� - ��һ����Ԫ��Сʱ��
X=A(:,9:size(A,2));
figure;
plot(gpst,X);
% ylim([-10 10]);
hold on;
title(staname);
xlabel('Epoch [hour]');
ylabel('Error [m]');
box on;
grid on;
hold off;


%index_dir=findstr(pathname,'\');
%path_temp=pathname(1:index_dir(end)-1);
%pathname_jpg = sprintf('%s%s%s',path_temp,'_plot\jpg\');
pathname_jpg = sprintf('%s%s',pathname,'plot\jpg\');
if ~exist(pathname_jpg) 
    mkdir(pathname_jpg)
end 
saveas(gcf,[pathname_jpg staname '.jpg'],'jpg');
%pathname_fig = sprintf('%s%s%s',path_temp,'_plot\fig\');
% pathname_fig = sprintf('%s%s',pathname,'plot\fig\');
% if ~exist(pathname_fig) 
%     mkdir(pathname_fig)
% end 
% saveas(gcf,[pathname_fig staname '.fig'],'fig');
delete(gcf);