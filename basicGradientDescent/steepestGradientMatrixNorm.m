x0 = [-0.2 0.1]';
maxIter = 80;
P1 = [2 0; 0 8];
computeDir = @(x1, x2, x3, x4) (-inv(P1)*gradf(x1));
computeStepSize = @(x1, x2, x3, x4, x5) (blts(x1,1.0, 0.1, 0.7,x2, x3,x4));
f1 = @(x) (f(x));
gradf1 = @(x) (gradf(x));
tr1 = steepestDescent( x0,maxIter, f1, gradf1, computeDir, computeStepSize  );
P2 = [8 0; 0 2];
computeDir = @(x1, x2, x3, x4) (-inv(P2)*gradf(x1));
tr2 = steepestDescent( x0,maxIter, f1, gradf1, computeDir, computeStepSize  );
f2 = @(x1, x2)(exp(x1-3*x2-0.1) + exp(x1+3*x2-0.1) + exp(-x1-0.1));
f = @(x) f2(x(1), x(2))
xlabel('x_1');
ylabel('x_2');
ezcontour(f2, [-0.6,-0.15, -0.15, 0.21]);
hold on;
plot(tr1(:,1), tr1(:,2),'r*-')
plot(tr2(:,1), tr2(:,2),'b*-')
legend('Contours of f','Steepest Descent with P1', 'Steepest Descent with P2');