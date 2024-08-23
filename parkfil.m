clear all
clc

dir=1
ystep=20;
park=0;
x0=2;
y0=2;
fi0=45;

x=[10 10 12 12];
y=[0 8 8 0];
plot(x,y);
hold on
x=[10 10 12 12 10];
y=[22 40 40 22 22];
plot(x,y);
xlim([0 20])
ylim([0 40])

sim('simpark');
% plot(X.signals.values,Y.signals.values);
quiver(X.signals.values,Y.signals.values,4*cosd(Fi.signals.values),4*sind(Fi.signals.values));

[c,r]= size(Y.signals.values);
x0=X.signals.values(c);
y0=Y.signals.values(c);
fi0=Fi.signals.values(c);
if round(Y.signals.values(c)) > 20
    dir=-1
    sim('simpark');
    quiver(X.signals.values,Y.signals.values,4*cosd(Fi.signals.values),4*sind(Fi.signals.values));
elseif round(Y.signals.values(c)) < 20
     dir=1
    sim('simpark');
   quiver(X.signals.values,Y.signals.values,4*cosd(Fi.signals.values),4*sind(Fi.signals.values));
end
[c,r]= size(Y.signals.values);
dir=-1
ystep=10;
x0=X.signals.values(c);
y0=Y.signals.values(c);
fi0=Fi.signals.values(c);
park=1;
sim('simpark');
quiver(X.signals.values,Y.signals.values,-4*cosd(Fi.signals.values),4*sind(Fi.signals.values));


