clc
clear

% From a dat file
airfoil_name = 'naca0010';
coord = dlmread([airfoil_name, '.dat'],'',1,0);

VAP3_airfoil_gen(airfoil_name, coord, [100000:150000:8e6], [-5:0.25:10])

