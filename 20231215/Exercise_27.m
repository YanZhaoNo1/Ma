% dsolve('D2y+t*Dy-y=1-2t','y(0)=0.1,Dy(0)=0.2','x')
t0=0; tf=pi;
x0=[0.1;0.2];
[t,x]=ode23('exf',[t0,tf],x0);
y=x(:,1);
y1=x(:,2); %y的一阶导数
plot(t,y,'b-', t,y1,'r*')
legend('y',"y'")
