% % example 4
% x=1:0.1:3;
% y=1:0.1:4;
% [X,Y] = meshgrid(x,y);
% Z=ones(size(X));
% surf(X,Y,Z)

% % example 5
% t = -2:0.1:2;
% [x,y] = meshgrid(t);
% z = x.*exp(-x.^2-y.^2);
% subplot(1,2,1),mesh(x,y,z),title("网格图")
% subplot(1,2,2),surf(x,y,z),title("表面图")

% % example 6
% t=-10:0.1:10;
% [x,y]=meshgrid(t);
% z1=(x.^2-2*y.^2);
% subplot(1,3,1),mesh(x,y,z1),title('马鞍面')
% 
% a=input('a=(-50<a<50)'),
% z2=a*ones(size(x));
% subplot(1,3,2),mesh(x,y,z2),title('平面')
% 
% r0=abs(z1-z2)<=5; %1,0
% zz=r0.*z2;yy=r0.*y;xx=r0.*x;
% subplot(1,3,3),plot3(xx(r0~=0),yy(r0~=0),zz(r0~=0), 'x')
% % subplot(1,3,3),plot3(xx,yy,zz, '.')
% title('交线')



