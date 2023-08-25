x0(1) = 0;% virus_antibody_complex
x0(2) = 100;% antibody_level_initial
x0(3) = 1e6;% virus_intial_number
x0(4) = 1e6; % environment antigen
x0(5) = 0;% environ_antibody_complex


para(1) = 1e-5; 
para(2) = 1e-14; 
para(3) = 1; 
para(4) = 2; 
para(5) = 0.02; 
para(6) = 0.02; 
para(7) = 0; % changed it to zero
para(8) = 1e-8; 
para(9) = 1e-14;% environment antigen binding kinetics

[t, y]=ode15s(@pathway_model_environ_new,[0 50],x0,[],para);

plot(t,y(:,1),'linewidth',2);
hold on
plot(t,y(:,2),'linewidth',2);
hold on
plot(t,y(:,3),'linewidth',2);

data1_new = interp1(t,y(:,2),[0:1:50]);
x0(2) = data1_new(51);
[t, y]=ode15s(@pathway_model_environ_new,[50 100],x0,[],para);
plot(t,y(:,1),'linewidth',2);
hold on
plot(t,y(:,2),'linewidth',2);
hold on
plot(t,y(:,3),'linewidth',2);

% antibody_level_initial
