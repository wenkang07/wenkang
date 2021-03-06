function [OmegaVal,Omegaval1,Omegaval2,Omegaval3,Omegaval4,Omegaval5]=LMIkseaveragedwen(C,h,mu,kappa,barDelta,delta)

%% Decision variables 
lambda1=sdpvar(1);
lambda2=sdpvar(1);
lambda3=sdpvar(1);
p1=sdpvar(1);
p2=sdpvar(1);
r=sdpvar(1);
Gamma=sdpvar(1);


%% The LMI for (51)
Theta2=blkvar; 
Theta2(1,1)=p2-(1+Gamma)*1/(pi^2);
Theta2(1,2)=sqrt(1/(pi^2)+1/2);
Theta2(2,2)=Gamma;
Theta2=sdpvar(Theta2);
%% The LMI for (50)
Theta3=blkvar;
Theta3(1,1)=2*p1*(1-kappa)+lambda1+2*barDelta^2/(pi^2)*lambda2-lambda3;
Theta3(1,5)=-p2*C;
Theta3(1,8)=-r*h*C;
Theta3(2,2)=-2*p1*kappa+lambda1+2*barDelta^2/(pi^2)*lambda2-lambda3;
Theta3(3,3)=-2*p1+2*delta*p2;
Theta3(3,4)=2*delta*p2;
Theta3(3,5)=-p2*(1-kappa);
Theta3(3,6)=-lambda3/2;
Theta3(3,8)=-(1-kappa)*r*h;
Theta3(4,4)=-2*p1+2*delta*p2;
Theta3(4,5)=p2*kappa;
Theta3(4,6)=-lambda3/2;
Theta3(4,8)=kappa*r*h;
Theta3(5,5)=-2*p2;
Theta3(5,6)=-p2*mu;
Theta3(5,7)=p2*mu;
Theta3(5,8)=-r*h;
Theta3(6,6)=-2*p1*mu+2*delta*p1-lambda1*pi^2/2;
Theta3(6,7)=p1*mu;
Theta3(6,8)=-mu*r*h;
Theta3(7,7)=-lambda2;
Theta3(7,8)=mu*r*h;
Theta3(8,8)=-r*h;
Theta3=sdpvar(Theta3);
%% The LMI for (50)
Theta4=blkvar; 
Theta4(1,1)=2*p1*(1-kappa)+lambda1+2*barDelta^2/(pi^2)*lambda2-lambda3;
Theta4(1,5)=p2*C; 
Theta4(1,8)=r*h*C;
Theta4(2,2)=-2*p1*kappa+lambda1+2*barDelta^2/(pi^2)*lambda2-lambda3;
Theta4(3,3)=-2*p1+2*delta*p2;
Theta4(3,4)=2*delta*p2;
Theta4(3,5)=-p2*(1-kappa);
Theta4(3,6)=-lambda3/2;
Theta4(3,8)=-(1-kappa)*r*h;
Theta4(4,4)=-2*p1+2*delta*p2;
Theta4(4,5)=p2*kappa;
Theta4(4,6)=-lambda3/2;
Theta4(4,8)=kappa*r*h;
Theta4(5,5)=-2*p2;
Theta4(5,6)=-p2*mu;
Theta4(5,7)=p2*mu;
Theta4(5,8)=-r*h;
Theta4(6,6)=-2*p1*mu+2*delta*p1-lambda1*pi^2/2;
Theta4(6,7)=p1*mu;
Theta4(6,8)=-mu*r*h;
Theta4(7,7)=-lambda2;
Theta4(7,8)=mu*r*h;
Theta4(8,8)=-r*h;
Theta4=sdpvar(Theta4);
%% The LMI for (50)
Theta5=blkvar;
Theta5(1,1)=2*p1*(1-kappa)+lambda1+2*barDelta^2/(pi^2)*lambda2-lambda3;
Theta5(1,5)=-p2*C;
Theta5(1,9)=-r*h*C;
Theta5(2,2)=-2*p1*kappa+lambda1+2*barDelta^2/(pi^2)*lambda2-lambda3;
Theta5(3,3)=-2*p1+2*delta*p2;
Theta5(3,4)=2*delta*p2;
Theta5(3,5)=-p2*(1-kappa);
Theta5(3,6)=-lambda3/2;
Theta5(3,9)=-(1-kappa)*r*h;
Theta5(4,4)=-2*p1+2*delta*p2;
Theta5(4,5)=p2*kappa;
Theta5(4,6)=-lambda3/2;
Theta5(4,9)=kappa*r*h;
Theta5(5,5)=-2*p2;
Theta5(5,6)=-p2*mu;
Theta5(5,7)=p2*mu;
Theta5(5,8)=p2*mu*h;
Theta5(5,9)=-r*h;
Theta5(6,6)=-2*p1*mu+2*delta*p1-lambda1*pi^2/2;
Theta5(6,7)=p1*mu;
Theta5(6,8)=p1*mu*h;
Theta5(6,9)=-mu*r*h;
Theta5(7,7)=-lambda2;
Theta5(7,9)=mu*r*h;
Theta5(8,8)=-r*h*exp(-2*delta*h);
Theta5(8,9)=mu*r*h^2;
Theta5(9,9)=-r*h;
Theta5=sdpvar(Theta5);

%% The LMI for (50) 
Theta6=blkvar;
Theta6(1,1)=2*p1*(1-kappa)+lambda1+2*barDelta^2/(pi^2)*lambda2-lambda3;
Theta6(1,5)=p2*C;
Theta6(1,9)=r*h*C;
Theta6(2,2)=-2*p1*kappa+lambda1+2*barDelta^2/(pi^2)*lambda2-lambda3;
Theta6(3,3)=-2*p1+2*delta*p2;
Theta6(3,4)=2*delta*p2;
Theta6(3,5)=-p2*(1-kappa);
Theta6(3,6)=-lambda3/2;
Theta6(3,9)=-(1-kappa)*r*h;
Theta6(4,4)=-2*p1+2*delta*p2;
Theta6(4,5)=p2*kappa;
Theta6(4,6)=-lambda3/2;
Theta6(4,9)=kappa*r*h;
Theta6(5,5)=-2*p2;
Theta6(5,6)=-p2*mu;
Theta6(5,7)=p2*mu;
Theta6(5,8)=p2*mu*h;
Theta6(5,9)=-r*h;
Theta6(6,6)=-2*p1*mu+2*delta*p1-lambda1*pi^2/2;
Theta6(6,7)=p1*mu;
Theta6(6,8)=p1*mu*h;
Theta6(6,9)=-mu*r*h;
Theta6(7,7)=-lambda2;
Theta6(7,9)=mu*r*h;
Theta6(8,8)=-r*h*exp(-2*delta*h);
Theta6(8,9)=mu*r*h^2;
Theta6(9,9)=-r*h;
Theta6=sdpvar(Theta6);
%% Solution of LMIs
LMIs=[lambda1>=0,lambda2>=0,p1>=0, p2>=0,r>=0,Gamma>=0, Theta2>=0,  Theta3<=0, Theta4<=0, Theta5<=0,Theta6<=0]; 
options=sdpsettings('solver','lmilab','verbose',0); 
sol=optimize(LMIs,[],options); 

OmegaVal=[]; 
Omegaval1=[]; 
Omegaval2=[]; 
Omegaval3=[];
Omegaval4=[]; 
Omegaval5=[];
if sol.problem == 0
    primal=check(LMIs); 
    if min(primal)>=0 && all(primal(3:7)>0)
       OmegaVal=double(lambda1);
       Omegaval1=double(lambda2);
       Omegaval2=double(lambda3);
       Omegaval3=double(p1);
       Omegaval4=double(p2);
       Omegaval5=double(r);
        
        
    end
else
    yalmiperror(sol.problem); 
end