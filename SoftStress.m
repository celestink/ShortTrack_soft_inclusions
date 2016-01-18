clear all
numfiles =15;
myStresses=cell(1,numfiles);
pos_vet=10.32:10.0:120.32;
pos_hor=-28.0:4.0:28.0;
X1=pos_hor'; 
X2=pos_vet';
Str=zeros(12,15);
Str1=zeros(12,15);
u1=zeros(12,15);
v1=zeros(12,15);
w1=zeros(12,15);
Ang=zeros(12,45);
ft=16;
ba=60;
sc=0.5
c=[1 0.5 0]
load 'C:\Users\celestink\Documents\TestingStation\EllptContact2\Allnoinclusions\Str1noiso.txt'
for k=1:15
  %  myDispName=sprintf('RailMaxS-%d.txt', k);
  myStressName=sprintf('RailMaxPrinc_%d.txt', k-1);
  myStresses{k}=importdata(myStressName);
 % Str(:,k)=myStresses{k};
  L=size(myStresses{k});
 Str(1:L(1),k)=(myStresses{k}(1:L(1)))';
 Angs{k}=myStresses{k}(:,2:4);
 Angsd{k}=acosd(Angs{k});
 Ang(1:L(1),((3*k-2):(3*k)))=Angs{k};
 Angd(1:L(1),((3*k-2):(3*k)))=Angsd{k};
 u1(1:L(1),k)=Angs{k}(:,1);
 v1(1:L(1),k)=Angs{k}(:,2);
 w1(1:L(1),k)=Angs{k}(:,3);
figure(k)
axs{k}=axes('Parent',figure(k),'FontSize',ft,'FontName','Times New Roman');
%xlim(axes1,[0 X22(end)+10]);
%ylim(axes1,[min(min(Y2)) max(max(Y2))+0.5]);
hold(axs{k},'on');
box(axs{k},'on');
scatter(X2(1:L(1)),Angs{k}(:,1),ba,'d','filled','MarkerEdgeColor','k','MarkerFaceColor','b');hold on
scatter(X2(1:L(1)),Angs{k}(:,2),ba,'o','filled','MarkerEdgeColor','r','MarkerFaceColor','r');hold on
scatter(X2(1:L(1)),Angs{k}(:,3),ba,'*','filled','MarkerEdgeColor','r','MarkerFaceColor','k');hold on
xlabel('Vertical distance from the rail top surface (mm)','FontName','Times New Roman', 'FontSize',ft);
ylabel('Principal direction components','FontName','Times New Roman',  'FontSize',ft);
legend('\it{cos\alpha_1}','\it{cos\beta_1}','\it{cos\gamma_1}')
end
Str1(:,8:15)=Str(:,1:8);
u11(:,8:15)=u1(:,1:8);
v11(:,8:15)=v1(:,1:8);
w11(:,8:15)=w1(:,1:8);
 for l=1:7
  Str1(:,l)=Str(:,(15-(l-1)));
  u11(:,l)=u1(:,(15-(l-1)));
  v11(:,l)=v1(:,(15-(l-1)));
  w11(:,l)=w1(:,(15-(l-1)));
 end
Y1=Str1(:,1:6);
Y2=Str1(:,7:9);
Z=Str1(1:3,:);
Y3=Str1(:,10:15); 
figure(16)
axes16=axes('Parent',figure(16),'FontSize',ft,'FontName','Times New Roman');
box(axes16,'on');
hold(axes16,'on');
xlim(axes16,[0 X2(end)+10]);
ylim(axes16,[min(min(Y2)) max(max(Y2))+0.5]);
hold(axes16,'on');
scatter(X2,Y2(:,1),ba,'d','filled','MarkerEdgeColor','k','MarkerFaceColor','k');hold on
scatter(X2,Y2(:,2),ba,'o','filled','MarkerEdgeColor','r','MarkerFaceColor','r');hold on
scatter(X2,Y2(:,3),ba,'*','filled','MarkerEdgeColor','b','MarkerFaceColor','b');hold on
xlabel('Vertical distance from the rail top surface (mm)','FontName','Times New Roman', 'FontSize',ft);
ylabel('Maximum principal stress at inclusion  (MPa)','FontName','Times New Roman',  'FontSize',ft);
legend('\itx=-4.0 mm','\itx=0','\itx=4.0 mm') 

set(legend,...
    'Position',[0.386483427098263 0.00763220135010602 0.214511610308849 0.0809228787088169],...
    'FontSize',18,...
    'FontName','Times New Roman');
figure(17)
figure(17)
axes17=axes('Parent',figure(17),'FontSize',ft,'FontName','Times New Roman');
box(axes17,'on');
hold(axes17,'on');
xlim(axes17,[-X1(end)-10 X1(end)+10]);
ylim(axes17,[0 max(max(Z))+0.5]);
%hold(axes1,'on');
scatter(X1,Z(1,:),ba,'d','filled','MarkerEdgeColor','k','MarkerFaceColor','k');hold on
scatter(X1,Z(2,:),ba,'o','filled','MarkerEdgeColor','r','MarkerFaceColor','r');hold on
scatter(X1,Z(3,:),ba,'*','filled','MarkerEdgeColor','b','MarkerFaceColor','b');hold on
xlabel('Lateral position (mm)','FontName','Times New Roman', 'FontSize',ft);
% x is the lateral distance in the rail cross section (left to right)
ylabel('Maximum principal stress at inclusion (MPa)','FontName','Times New Roman',  'FontSize',ft);
legend('\it h=10 mm','\ith=20 mm','\ith=30 mm')
set(legend,...
    'Position',[0.386483427098263 0.00763220135010602 0.214511610308849 0.0809228787088169],...
    'FontSize',18,...
    'FontName','Times New Roman');
figure(18)
axes3=axes('Parent',figure(18),'FontSize',ft,'FontName','Times New Roman');
box(axes3,'on');
hold(axes3,'on');
mesh(X1(1:7),X2(1:3),Str1(1:3,1:7)),hold on;
mesh(X1(7:9),X2,Str1(:,7:9)),hold on;
mesh(X1(9:15),X2(1:3),Str1(1:3,9:15)),hold on;
xlabel('X, mm','FontName','Times New Roman',  'FontSize',ft)
ylabel('Y, mm','FontName','Times New Roman',  'FontSize',ft)
zlabel('Maximum principal stress \it(\sigma_1) at inclusion \it(MPa)','FontName','Times New Roman',  'FontSize',ft)
Y1=zeros(12,1);
X11=zeros(3,6);
X12=zeros(12,3);
X13=zeros(3,6);
X21=zeros(3,6);
X22=zeros(12,3);
X23=zeros(3,6);
Y1=zeros(3,6);
Y1(:,:)=0;
Y2=zeros(12,3);
Y2(:,:)=0;
Y3=Y1;
X12=zeros(12,3)
for p=1:3
X11(p,:)=(X1(1:6))';
X13(p,:)=(X1(10:15))';
 X22(:,p)=X2;
end
for q=1:6
    X21(:,q)=X2(1:3);
    X23(:,q)=X2(1:3);
end
for q=1:12
    X12(q,:)=(X1(7:9))';
end
figure(19)
axes4=axes('Parent',figure(19),'FontSize',ft,'FontName','Times New Roman');
box(axes4,'on');
hold(axes4,'on');
quiver3(Str1(1:3,1:6),u11(1:3,1:6),v11(1:3,1:6),w11(1:3,1:6)),hold on;
quiver3(Str1(:,7:9),u11(:,7:9),v11(:,7:9),w11(:,7:9)),hold on;
quiver3(Str1(1:3,10:15),u11(1:3,10:15),v11(1:3,10:15),w11(1:3,10:15))
xlabel('X, mm','FontName','Times New Roman','FontSize',ft)
ylabel('Y, mm','FontName','Times New Roman','FontSize',ft)
zlabel('Maximum principal stress \it(\sigma_1) at inclusion \it(MPa)','FontName','Times New Roman',  'FontSize',ft)
figure(20)
axes5=axes('Parent',figure(20),'FontSize',ft,'FontName','Times New Roman');
quiver3(X11,Y1,171.13-X21,u11(1:3,1:6),v11(1:3,1:6),w11(1:3,1:6),'LineWidth',1.5),hold on;
quiver3(X12,Y2,171.13-X22,u11(:,7:9),v11(:,7:9),w11(:,7:9),'LineWidth',1.5),hold on;
quiver3(X13,Y3,171.13-X23,u11(1:3,10:15),v11(1:3,10:15),w11(1:3,10:15),'LineWidth',1.5),hold on;

plot3([-32,32],[-5,-5],[171.13,171.13],'k','LineStyle','--'),hold on;
plot3([-32,32],[5,5],[171.13,171.13],'k','LineStyle','--'),hold on;
plot3([-32,-32],[-5,5],[171.13,171.13],'k','LineStyle','--'),hold on;
plot3([32,32],[-5,5],[171.13,171.13],'k','LineStyle','--'),hold on;

plot3([-32,-10],[-5,-5],[130,130],'k','LineStyle','--'),hold on;
plot3([-32,-10],[5,5],[130,130],'k','LineStyle','--'),hold on;
plot3([10.0,32.0],[-5,-5],[130,130],'k','LineStyle','--'),hold on;
plot3([10.0,32.0],[5,5],[130,130],'k','LineStyle','--'),hold on;

plot3([-32,-32],[-5,5],[130,130],'k','LineStyle','--'),hold on;
plot3([32,32],[-5,5],[130,130],'k','LineStyle','--'),hold on;

plot3([-10,-10],[-5,5],[130,130],'k','LineStyle','--'),hold on;
plot3([10,10],[-5,5],[130,130],'k','LineStyle','--'),hold on;

plot3([-32,-32],[-5,-5],[130,172],'k','LineStyle','--'),hold on;
plot3([32,32],[-5,-5],[130,172],'k','LineStyle','--'),hold on;
plot3([-32,-32],[5,5],[130,172],'k','LineStyle','--'),hold on;
plot3([32,32],[5,5],[130,172],'k','LineStyle','--'),hold on;

plot3([-10,-10],[-5,-5],[45,130],'k','LineStyle','--'),hold on;
plot3([10,10],[-5,-5],[45,130],'k','LineStyle','--'),hold on;
plot3([-10,-10],[5,5],[45,130],'k','LineStyle','--'),hold on;
plot3([10,10],[5,5],[45,130],'k','LineStyle','--'),hold ;

xlabel('Lateral position, mm','FontName','Times New Roman','FontSize',ft)
ylabel('Longitudinal, mm','FontName','Times New Roman','FontSize',ft)
zlabel('Vertical position, mm','FontName','Times New Roman',  'FontSize',ft)
save Str1.txt -ascii -double Str1
save Anglesd.txt -ascii -double Angsd
figure(21)
Str1noiso(Str1noiso==0)=0.001;
StrConc=Str1./Str1noiso
axes3=axes('Parent',figure(21),'FontSize',ft,'FontName','Times New Roman');
box(axes3,'on');
hold(axes3,'on');
mesh(X1(1:7),X2(1:3),StrConc(1:3,1:7)),hold on;
mesh(X1(7:9),X2,StrConc(:,7:9)),hold on;
mesh(X1(9:15),X2(1:3),StrConc(1:3,9:15)),hold on;
xlabel('X, mm','FontName','Times New Roman',  'FontSize',ft)
zlabel('Stress concentration factors','FontName','Times New Roman',  'FontSize',ft)
