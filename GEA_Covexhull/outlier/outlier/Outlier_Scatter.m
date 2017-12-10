% Scatter Plot
% The value in a location vs. the avg value in its neighbors
xx = [ones(m,1) x];
[b,bint,r,rint,stats] = regress(y,xx);

figure;
%subplot(1,2,1);
hold on;
plot(x,y,'ro','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',6);
            
% highlight the first and last one
plot(x(1),y(1),'ro','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','r',...
                'MarkerSize',6);
plot(x(m),y(m),'ro','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','r',...
                'MarkerSize',6);
            
%highlight the two neighbors of the outlier S
plot(x(18),y(18),'ro','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',6);
plot(x(20),y(20),'ro','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',6);
        
plot(x,b(1)+b(2)*x);
title('Scatter Plot','fontsize',22);
xlabel('Attribute Values','fontsize',16);
ylabel('Average Attribute Values Over Neighborhood','fontsize',16);
text(x(19)+0.3, y(19), '\leftarrow S','FontSize', 14);
text(x(18)-0.7,y(18),'P \rightarrow','FontSize',14);
text(x(20)-0.7,y(20),'Q \rightarrow','FontSize',14);
%print -djpeg90 scatter2.jpg

figure
%subplot(1,2,2)
hold on;
plot(x_index,r,'ro','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',6);
grid on;
plot(x,hori_line,'b--');
title('Residual Plot','fontsize',22);
xlabel('Attribute Values','fontsize',16);
ylabel('Residual for regression','fontsize',16);