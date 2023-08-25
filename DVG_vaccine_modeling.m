clc
clear
x0(1) = 0;% virus_IgM_complex
x0(2) = 100;% antibody_level_initial_IgM
x0(3) = 100;% virus_intial_number
x0(4) = 1e6; % environment antigen
x0(5) = 0;% environ_IgM_complex
x0(6) = 0;% environ_IgG_complex
x0(7) = 0;%  virus_IgG_complex
x0(8) = 0;% antibody_level_initial_IgG


para(1) = 1e-5; 
para(2) = 1e-14; 
para(3) = 1; 
para(4) = 2; 
para(5) = 0.02; 
para(6) = 0.02; 
para(7) = 0.20; % changed it to one
para(8) = 1e-8; 
para(9) = 1e-14;% environment antigen binding kinetics
para(10) = 0.1;%% decaying ratio of IgM
para(11) = 0.001;%% transformation ratio of IgM to IgG


[t, y]=ode15s(@pathway_model_environ_vaccine,[0 100],x0,[],para);

plot(t,y(:,1),'linewidth',2);
hold on
plot(t,y(:,2),'linewidth',2);
hold on
plot(t,y(:,3),'linewidth',2);
hold on
plot(t,y(:,7),'linewidth',2);
hold on
plot(t,y(:,8),'linewidth',2);

% %% 第二针
% 
% data1_new = interp1(t,y(:,2),[0:1:50]);
% data2_new = interp1(t,y(:,8),[0:1:50]);
% x0(2) = data1_new(51);
% x0(8) = data2_new(51);
% [t, y]=ode15s(@pathway_model_environ_vaccine,[50 100],x0,[],para);
% plot(t,y(:,1),'linewidth',2);
% hold on
% plot(t,y(:,2),'linewidth',2);
% hold on
% plot(t,y(:,3),'linewidth',2);
% hold on
% plot(t,y(:,7),'linewidth',2);
% hold on
% plot(t,y(:,8),'linewidth',2);
% 
% %% 第三针
% 
% 
% data1_new_2 = interp1(t,y(:,2),[50:1:100]);
% data2_new_2 = interp1(t,y(:,8),[50:1:100]);
% x0(2) = data1_new_2(51);
% x0(8) = data2_new_2(51);
% [t, y]=ode15s(@pathway_model_environ_vaccine,[100 150],x0,[],para);
% plot(t,y(:,1),'linewidth',2);
% hold on
% plot(t,y(:,2),'linewidth',2);
% hold on
% plot(t,y(:,3),'linewidth',2);
% hold on
% plot(t,y(:,7),'linewidth',2);
% hold on
% plot(t,y(:,8),'linewidth',2);
% % antibody_level_initial
