ylim1 = 1;
staname1 = 'jfng';
staname2='daej';
staname3='tabl';
staname4='tid1';
staname5='tidb';
staname6='twtf';
day='2450';
%path = sprintf('%s%s%s','F:\output\data2\',staname,'\');
path='D:\gamp\gamp\gamp\2017244\results_reference\kin_jfng\';
% filename1 = sprintf('%s%s%s',path,staname1,day,'.20o.pos');
% filename2 = sprintf('%s%s%s',path,staname2,day,'.20o.pos');
% filename3 = sprintf('%s%s%s',path,staname3,day,'.20o.pos');
% filename4 = sprintf('%s%s%s',path,staname4,day,'.20o.pos');
% %filename5 = sprintf('%s%s%s',path,staname5,day,'.20o.pos');
%filename6 = sprintf('%s%s%s',path,staname6,day,'.20o.pos');

A=load('D:\gamp\gamp\gamp\2017244\results_reference\kin_jfng\G.pos');
B=load('D:\gamp\gamp\gamp\2017244\results_reference\kin_jfng\R.pos');
C=load('D:\gamp\gamp\gamp\2017244\results_reference\kin_jfng\GR.pos');
D=load('D:\gamp\gamp\gamp\2017244\results_reference\kin_jfng\GRCE.pos');
%E=load(filename5);
%F=load(filename6);




%gpst = mod(A(:,2),86400*2)/3600;0;
diff_week = A(:,7)-A(1,7);  %与第一个历元的gpsweek之差
gpst1 = diff_week *7 *24 + A(:,8)/3600 - A(1,8)/3600;  %当前历元在周内的小时数 - 第一个历元的小时数
X1=A(:,12);
Y1=A(:,13);
Z1=A(:,14);

diff_week2 = B(:,7)-B(1,7);  %与第一个历元的gpsweek之差
gpst2 = diff_week2 *7 *24 + B(:,8)/3600 - B(1,8)/3600;  %当前历元在周内的小时数 - 第一个历元的小时数
X2=B(:,12);
Y2=B(:,13);
Z2=B(:,14);

diff_week3 = C(:,7)-C(1,7);  %与第一个历元的gpsweek之差
gpst3 = diff_week3 *7 *24 + C(:,8)/3600 - C(1,8)/3600;  %当前历元在周内的小时数 - 第一个历元的小时数
X3=C(:,12);
Y3=C(:,13);
Z3=C(:,14);

diff_week4 = C(:,7)-C(1,7);  %与第一个历元的gpsweek之差
 gpst4 = diff_week4 *7 *24 + D(:,8)/3600 - D(1,8)/3600;  %当前历元在周内的小时数 - 第一个历元的小时数
X4=D(:,12);
 Y4=D(:,13);
 Z4=D(:,14);

% 
% diff_week5 = E(:,7)-E(1,7);  %与第一个历元的gpsweek之差
% gpst5 = diff_week5 *7 *24 + E(:,8)/3600 - E(1,8)/3600;  %当前历元在周内的小时数 - 第一个历元的小时数
% X5=E(:,12);
% Y5=E(:,13);
% Z5=E(:,14);
% 
% diff_week6 = F(:,7)-F(1,7);  %与第一个历元的gpsweek之差
% gpst6 = diff_week6 *7 *24 + F(:,8)/3600 - F(1,8)/3600;  %当前历元在周内的小时数 - 第一个历元的小时数
% X6=F(:,12);
% Y6=F(:,13);
% Z6=F(:,14);


figure(1);
%subplot(3,1,1);
%plot(gpst1,X1,'g.',gpst2,X2,'k.',gpst3,X3,gpst4,X4,gpst5,X5,gpst6,X6);
%plot(gpst1,X1,'.',gpst2,X2,'.',gpst3,X3,'.',gpst4,X4,'.',gpst5,X5,'.',gpst6,X6,'.');
plot(gpst1,X1,'.',gpst2,X2,'.',gpst3,X3,'.',gpst4,X4,'.');
%plot(gpst1,X1,gpst2,X2,gpst3,X3,gpst4,X4);
grid on;
title([ '(N)']);
%ylim([-0.4,0.4]);
ylim([ylim1*-1,ylim1]);
xlabel('Epoch(hour)');
ylabel('Error(m)');
legend('G','R','GR','GRCE');

saveas(gcf,[path staname1 '+N.fig'],'fig');
saveas(gcf,[path staname1 '+N.jpg'],'jpg');

figure(2);
%subplot(3,1,2);
plot(gpst1,Y1,'.',gpst2,Y2,'.',gpst3,Y3,'.',gpst4,Y4,'.');
grid on;
title(['(E)']);
ylim([ylim1*-1,ylim1]);
xlabel('Epoch(hour)');
ylabel('Error(m)');
legend('G','R','GR','GRCE');

saveas(gcf,[path staname1 '+E.fig'],'fig');
saveas(gcf,[path staname1 '+E.jpg'],'jpg');

figure(3);
%subplot(3,1,3);
plot(gpst1,Z1,'.',gpst2,Z2,'.',gpst3,Z3,'.',gpst4,Z4,'.');
grid on;
title(['(U)']);
ylim([ylim1*-1,ylim1]);
xlabel('Epoch(hour)');
ylabel('Error(m)');
legend('G','R','GR','GRCE');
saveas(gcf,[path staname1 '+U.fig'],'fig');
saveas(gcf,[path staname1 '+U.jpg'],'jpg');