% parametersetting; 只用两种抗体解释这个现象，一种是结合力很弱的，但是含量很高，另一种是结合力强的抗体，但是含量极低。
clc
clear
x0(1) = 0;% virus_IgM_1_complex
x0(2) = 1e3;% antibody_level_initial_IgM_1
x0(3) = 1e6;% virus_intial_number
x0(4) = 0;%  virus_IgG_1_complex
x0(5) = 0;% antibody_level_initial_IgG_1
x0(6) = 0;% virus_IgM_2_complex
x0(7) = 1e-5;% antibody_level_initial_IgM_2
x0(8) = 0;%  virus_IgG_2_complex
x0(9) = 0;% antibody_level_initial_IgG_2


para(1) = 1e-6; 
para(2) = 1e-14; 
para(3) = 5e-5;
para(4) = 1; 
para(5) = 2; 
para(6) = 0.02; 

para(7) = 0; % changed it to zero
para(8) = 0.1;%% decaying ratio of IgM
para(9) = 0.001;%% transformation ratio of IgM to IgG




[t y]=ode15s(@pathway_model_build_B,[0 100],x0,[],para);
% plot(t,y(:,1),'linewidth',2);
% hold on

plot(t,y(:,5),'linewidth',2);
hold on

plot(t,y(:,9),'linewidth',2);

%%
data1_new = interp1(t,y(:,2),[0:1:100]);
data2_new = interp1(t,y(:,5),[0:1:100]);
data3_new = interp1(t,y(:,7),[0:1:100]);
data4_new = interp1(t,y(:,9),[0:1:100]);
x0(2) = data1_new(101);
x0(5) = data2_new(101);
x0(7) = data3_new(101);
x0(9) = data4_new(101);
para(1) = 1e-6; 
para(2) = 1e-14; 
para(3) = 1e-5;
[t, y]=ode15s(@pathway_model_build_B,[100 200],x0,[],para);

plot(t,y(:,5),'linewidth',2);
hold on
plot(t,y(:,9),'linewidth',2);


%% traditonal 2dose injection

x0(1) = 0;% virus_IgM_1_complex
x0(2) = 1e3;% antibody_level_initial_IgM_1
x0(3) = 1e6;% virus_intial_number
x0(4) = 0;%  virus_IgG_1_complex
x0(5) = 0;% antibody_level_initial_IgG_1
x0(6) = 0;% virus_IgM_2_complex
x0(7) = 1e-5;% antibody_level_initial_IgM_2
x0(8) = 0;%  virus_IgG_2_complex
x0(9) = 0;% antibody_level_initial_IgG_2


para(1) = 1e-6; 
para(2) = 1e-14; 
para(3) = 1e-5;
para(4) = 1; 
para(5) = 2; 
para(6) = 0.02; 

para(7) = 0; % changed it to zero
para(8) = 0.1;%% decaying ratio of IgM
para(9) = 0.001;%% transformation ratio of IgM to IgG




[t y]=ode15s(@pathway_model_build_B,[0 100],x0,[],para);

plot(t,y(:,5),'linewidth',2);
hold on
plot(t,y(:,9),'linewidth',2);

%%
data1_new = interp1(t,y(:,2),[0:1:100]);
data2_new = interp1(t,y(:,5),[0:1:100]);
data3_new = interp1(t,y(:,7),[0:1:100]);
data4_new = interp1(t,y(:,9),[0:1:100]);
x0(2) = data1_new(101);
x0(5) = data2_new(101);
x0(7) = data3_new(101);
x0(9) = data4_new(101);
[t, y]=ode15s(@pathway_model_build_B,[100 200],x0,[],para);

plot(t,y(:,5),'linewidth',2);
hold on
plot(t,y(:,9),'linewidth',2);


