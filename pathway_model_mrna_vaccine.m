function F=pathway_model_mrna_vaccine(t,y,para)
% the rate constant parameters
%% para(1) = 2e-5; para(2) = 1e-12; para(3) = 10; para(4) = 0.98; para(5) = 1.2
% F(1,1) = 0;
% F(2,1) = 0;
F(1,1) = para(1)*y(3)*y(2)-para(2)*y(1)-para(3)*y(1);


F(2,1) = para(2)*y(1)-para(1)*y(2)*y(3)+para(4)*y(1)-para(10)*y(2)+para(9)*y(5)-para(8)*y(2)*y(4)+para(4)*y(5) - para(11)*y(2);

if y(3) <  0
   
    y(3)  = 0;
    F(3,1) = 0;
else
 F(3,1) = -para(1)*(y(2)+y(8))*y(3) + para(2)*(y(1)+y(7)) - para(6)*y(3) + para(7)*y(3) + para(12)*y(9);
end

 F(4,1) = 0;
 F(5,1) = para(8)*y(4)*y(2)-para(9)*y(5)-para(3)*y(5);
 
 F(6,1) = para(8)*y(4)*y(8)-para(9)*y(6)-para(3)*y(6);
 
 F(7,1) = para(1)*y(3)*y(8)-para(2)*y(7)-para(3)*y(7);
 
 F(8,1) = para(2)*y(7)-para(1)*y(3)*y(8)+para(4)*y(7)-para(5)*y(8)+para(9)*y(6)-para(8)*y(8)*y(4) + para(4)*y(6) + para(11)*y(2);

 F(9,1) = -para(13)*y(9);
 
end




%created by the program testexcel_IL
