function plot_nsat(pathname,filename,mode)
staname=strrep(filename,'.','+');
fullname = [pathname  filename];
A=load(fullname);
diff_week = A(:,7)-A(1,7);  %���һ����Ԫ��gpsweek֮��
gpst = diff_week *7 *24 + A(:,8)/3600 - A(1,8)/3600;  %��ǰ��Ԫ�����ڵ�Сʱ�� - ��һ����Ԫ��Сʱ��
X=A(:,[10 size(A,2)]);
%pinjun=mean(X,1);
figure;
plot(gpst,X,'-','LineWidth',2);
hold on;
title(staname);
maxX = max(max(X))+2;
ylim([0,maxX]);
xlabel('Epoch [hour]');
%ylabel('Error(m)');
legend('NsatGPS','PDOP');
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