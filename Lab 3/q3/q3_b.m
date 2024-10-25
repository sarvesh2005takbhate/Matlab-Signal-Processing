n = pi/3;
r = 0.95;

b = [1,2*cos(n),1];
a = [1,-2*r*cos(n),r^2];

zplane(b,a,'b');