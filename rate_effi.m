close all
clear
file=dir('*.csv');
filelist={file.name};

idx=1;
keyword='.*';
for ii=length(filelist):-1:1
    Filter=regexp(filelist{ii},keyword,'match');
    if isempty(Filter)==0
        filepath(idx)=Filter;
        filename(idx)={Filter{1}(1:end-4)};
        idx=idx+1;
    end
end

for ii=length(filepath):-1:1
%     fig=figure('visible','off');
    data=readmatrix(filepath{ii}); 
    x=data(:,1);
    y=data(:,2);
    plot(x,y,'LineWidth',1.2)
    hold on
end

title('IM divergence model')
legend(flip(filename))
dpi = 300;
set(gcf,'position',[50,50,500,400])
set(gca, 'FontSize', 12,'FontWeight','bold','xminortick','on'...
    ,'yminortick','on','zminortick','on'),...
%     'XTick',lb:.1:rb,'YTick',.5:.05:1); 
grid on
xlabel('heralding efficiency','FontSize',13,'FontWeight','bold');
ylabel('key rate','FontSize',13,'FontWeight','bold');