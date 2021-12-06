function new_msg=rs_rrscode(in_msg,all_code_msg,all_msg)
new_msg=rs_interpret(in_msg,all_code_msg,all_msg);
return; %计算GF域内两个码字的码距子程序：
function ret = gf_dis(a,b)
ret = 0;
a_temp = de2bi(gf2num(a),3);
b_temp = de2bi(gf2num(b),3);
temp = a_temp+b_temp;
temp = mod(temp,2);
ret = sum(temp);
%计算GF域内每个码元与“0”码字的码距，并映射在成实数子程序：
function distance = gf2num(gf_a)
distance = -1;
if (gf_a == gf(0,3)) distance = 0; end
if (gf_a == gf(1,3)) distance = 1; end
if (gf_a == gf(2,3)) distance = 2; end
if (gf_a == gf(3,3)) distance = 3; end
if (gf_a == gf(4,3)) distance = 4; end
if (gf_a == gf(5,3)) distance = 5; end
if (gf_a == gf(6,3)) distance = 6; end
if (gf_a == gf(7,3)) distance = 7; end
%得到码距最短的码字：
function interpret_msg=rs_interpret(in_msg,all_code_msg,all_msg)
for i=1:512
 rs_dis(i)=rscode_dis(in_msg,all_code_msg(i,:)); 
end
rs_dis_min =min(rs_dis);
index = find(rs_dis == rs_dis_min);
interpret_msg = all_msg(index(1),:);
return;
%计算两个RS码的码距子程序：
function dis = rscode_dis(code1,code2)
dis = 0;
for i = 1:7
 temp = gf_dis(code1(i),code2(i));
 dis = dis+temp;
end

