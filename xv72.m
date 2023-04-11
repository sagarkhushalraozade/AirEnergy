% Fit of polynomial from data for the compressor SECOB XV7.2KX VSD
% Data taken from tables from SECOB data sheet 2013-05-08 at Cecomaf condtions: No subcooling, Suction gas 32°C

clear 
path(path,'C:\Program Files (x86)\Refprop');  % Search path for refprop fluid properties
path(path,'C:\Firman\Kylteknik\Kompressorer\Datafit');  % Search path for refprop fluid properties

format long;



% Data for SECOB XV7.2KX  at Cecomaf conditions
Q2=[24 33 43 56 71 88 109 133 ...       %1000 rpm 35°C T2=-35 to 0°C
    20 27 37 48 62 78 97 119	...     %1000 rpm 45°C        
    15 22 31 41 53 68 85 105 ...        %1000 rpm 55°C
        29 39 52 67 84 105 130 159 ...      %1200 rpm 35°C
        24 33 45 58 75 94 116 143 ...       %1200 rpm 45°C
        18 27 37 49 64 82 102 126 ...       %1200 rpm 55°C
            34 46 60 77 98 122 151 184 ...      %1400 rpm 35°C
            28 39 52 68 87 109 135 166 ...      %1400 rpm 45°C
            22 31 43 58 75 95 119 147 ...       %1400 rpm 55°C
                38 52 68 88 112 139 172 209 ...     %1600 rpm 35°C
                32 44 59 77 99 124 154 189 ...       %1600 rpm 45°C
                25 36 50 66 85 109 136 167 ...       %1600 rpm 55°C            
                    43 58 76 98 125 156 192 234 ...     %1800 rpm 35°C
                    36 49 66 86 111 139 172 211 ...     %1800 rpm 45°C
                    28 41 56 74 96 122 152 187 ...      %1800 rpm 55°C
                        47 64 84 109 138 172 212 258 ...    %2000 rpm 35°C  
                        39 55 73 96 122 153 190 233 ...     %2000 rpm 45°C
                        31 45 62 82 106 134 168 206 ...     %2000 rpm 55°C
                            68 92 121 156 198 247 304 ...       %3000 rpm 35°C  T2=-35 to -5°C
                            57 79 106 138 176 221 274 ...       %3000 rpm 45°C    
                            46 66 90 119 154 195 242 ...        %3000 rpm 55°C
                                87 117 154 198 250 312 ...          %4000 rpm 35°C T2=-35 to -10°C
                                73 101 135 175 223 280 ...          %4000 rpm 45°C
                                59 84 115 152 196 248];             %4000 rpm 55°C   


                            
                            
                            
Qel=[14 17 19 22 24 26 28 29 ...    %1000 rpm 35°C T2=-35 to 0°C
    14 18 21 24 27 30 33 35	...     %1000 rpm 45°C        
    14 18 22 26 30 33 37 41 ...     %1000 rpm 55°C
        17 20 23 26 29 31 33 35 ...     %1200 rpm 35°C
        17 21 25 28 32 36 39 42 ...     %1200 rpm 45°C
        17 21 26 30 35 40 44 48 ...     %1200 rpm 55°C
            20 23 27 30 34 36 39 41 ...     %1400 rpm 35°C
            20 25 29 33 37 42 45 49 ...     %1400 rpm 45°C
            20 25 30 35 41 46 51 56 ...     %1400 rpm 55°C
                23 27 31 35 38 42 45 48 ...     %1600 rpm 35°C
                23 28 33 38 43 47 52 56 ...     %1600 rpm 45°C
                23 28 34 40 46 52 58 64 ...     %1600 rpm 55°C            
                    26 30 35 39 43 47 51 54 ...     %1800 rpm 35°C
                    26 32 37 43 48 53 58 63 ...     %1800 rpm 45°C
                    26 32 38 45 52 59 65 72 ...     %1800 rpm 55°C
                        29 34 39 43 48 53 57 61 ...     %2000 rpm 35°C  
                        29 35 41 47 53 59 65 71 ...     %2000 rpm 45°C
                        29 36 43 50 58 65 73 80 ...     %2000 rpm 55°C
                            45 52 59 66 74 82 90 ...       %3000 rpm 35°C  T2=-35 to -5°C
                            45 54 62 71 81 90 100 ...      %3000 rpm 45°C    
                            45 54 65 75 86 98 109 ...      %3000 rpm 55°C
                                57 67 77 87 98 110 ...       %4000 rpm 35°C T2=-35 to -10°C
                                58 69 81 93 106 119 ...      %4000 rpm 45°C
                                57 70 84 98 113 128];        %4000 rpm 55°C   
 
              
T2 = [-35  -30  -25  -20  -15  -10  -5   0 ...    %1000 rpm
    -35  -30  -25  -20  -15  -10  -5   0 ...    %1000 rpm        
    -35  -30  -25  -20  -15  -10  -5   0 ...    %1000 rpm      
        -35  -30  -25  -20  -15  -10  -5   0 ...    %1200 rpm     
        -35  -30  -25  -20  -15  -10  -5   0 ...    %1200 rpm
        -35  -30  -25  -20  -15  -10  -5   0 ...    %1200 rpm
            -35  -30  -25  -20  -15  -10  -5   0 ...    %1400 rpm
            -35  -30  -25  -20  -15  -10  -5   0 ...    %1400 rpm
            -35  -30  -25  -20  -15  -10  -5   0 ...    %1400 rpm
                -35  -30  -25  -20  -15  -10  -5   0 ...    %1600 rpm
                -35  -30  -25  -20  -15  -10  -5   0 ...    %1600 rpm
                -35  -30  -25  -20  -15  -10  -5   0 ...    %1600 rpm
                    -35  -30  -25  -20  -15  -10  -5   0 ...    %1800 rpm
                    -35  -30  -25  -20  -15  -10  -5   0 ...    %1800 rpm
                    -35  -30  -25  -20  -15  -10  -5   0 ...    %1800 rpm
                        -35  -30  -25  -20  -15  -10  -5   0 ...  %2000 rpm
                        -35  -30  -25  -20  -15  -10  -5   0 ...  %2000 rpm
                        -35  -30  -25  -20  -15  -10  -5   0 ...  %2000 rpm
                            -35  -30  -25  -20  -15  -10  -5 ...    %3000 rpm
                            -35  -30  -25  -20  -15  -10  -5 ...    %3000 rpm
                            -35  -30  -25  -20  -15  -10  -5 ...    %3000 rpm
                                -35  -30  -25  -20  -15  -10 ...      %4000 rpm
                                -35  -30  -25  -20  -15  -10 ...      %4000 rpm
                                -35  -30  -25  -20  -15  -10];      %4000 rpm

T1 = [35 35 35 35 35 35 35 35 ...    %1000 rpm
     45 45 45 45 45 45 45 45 ...
     55 55 55 55 55 55 55 55 ...
        35 35 35 35 35 35 35 35 ...     %1200 rpm
        45 45 45 45 45 45 45 45 ...
        55 55 55 55 55 55 55 55 ...
            35 35 35 35 35 35 35 35 ...     %1400 rpm
            45 45 45 45 45 45 45 45 ...
            55 55 55 55 55 55 55 55 ...
                35 35 35 35 35 35 35 35 ...     %1600 rpm
                45 45 45 45 45 45 45 45 ...
                55 55 55 55 55 55 55 55 ...
                    35 35 35 35 35 35 35 35 ...     %1800 rpm
                    45 45 45 45 45 45 45 45 ...
                    55 55 55 55 55 55 55 55 ...
                        35 35 35 35 35 35 35 35 ...     %2000 rpm
                        45 45 45 45 45 45 45 45 ...
                        55 55 55 55 55 55 55 55 ...
                            35 35 35 35 35 35 35 ...     %3000 rpm
                            45 45 45 45 45 45 45 ...
                            55 55 55 55 55 55 55 ...
                                35 35 35 35 35 35 ...     %4000 rpm
                                45 45 45 45 45 45 ...
                                55 55 55 55 55 55];
                
                
                
RPM=[1000 1000 1000 1000 1000 1000 1000 1000 ...
     1000 1000 1000 1000 1000 1000 1000 1000 ...
     1000 1000 1000 1000 1000 1000 1000 1000 ...
        1200 1200 1200 1200 1200 1200 1200 1200 ...
        1200 1200 1200 1200 1200 1200 1200 1200 ...
        1200 1200 1200 1200 1200 1200 1200 1200 ...
            1400 1400 1400 1400 1400 1400 1400 1400 ...
            1400 1400 1400 1400 1400 1400 1400 1400 ...
            1400 1400 1400 1400 1400 1400 1400 1400 ...
                1600 1600 1600 1600 1600 1600 1600 1600 ...
                1600 1600 1600 1600 1600 1600 1600 1600 ...
                1600 1600 1600 1600 1600 1600 1600 1600 ...
                    1800 1800 1800 1800 1800 1800 1800 1800 ...
                    1800 1800 1800 1800 1800 1800 1800 1800 ...
                    1800 1800 1800 1800 1800 1800 1800 1800 ...
                        2000 2000 2000 2000 2000 2000 2000 2000 ...
                        2000 2000 2000 2000 2000 2000 2000 2000 ...
                        2000 2000 2000 2000 2000 2000 2000 2000 ...
                        	3000 3000 3000 3000 3000 3000 3000 ...
                            3000 3000 3000 3000 3000 3000 3000 ...
                            3000 3000 3000 3000 3000 3000 3000 ...
                                4000 4000 4000 4000 4000 4000 ...
                                4000 4000 4000 4000 4000 4000 ...
                                4000 4000 4000 4000 4000 4000];


[m n]= size(T2);
for i=1:n
    t1=T1(i);   % [C] Condensing temperature
    t2=T2(i);   % [C] Evaporating temperature
	
	p1=refpropm('P','T',t1+273.15,'Q',0,'Isobutan');               % [kPa] Condensing saturation pressure
	h1_Cecomaf=refpropm('H','T',t1+273.15,'P',p1,'Isobutan');      % [J/kg] Enthalpy at condenser outlet - No subcooling (Cecomaf)
	
	p2=refpropm('P','T',t2+273.15,'Q',1,'Isobutan');               % [kPa] Evaporating saturation pressure
	h2_32=refpropm('H','T',32+273.15,'P',p2,'Isobutan');           % [J/kg] Enthalpy of 32C suction gas at compressor inlet 
    	
	dh_Cecomaf=h2_32-h1_Cecomaf;                                   % [J/kg] Enthalpy change (cooling) for Cecomaf condtions
	 
    m_flow(1,i)=Q2(1,i)/dh_Cecomaf;                                 % [kg/s] refrigerant massflow rate
        
    rho_in=refpropm('D','T',32+273.15,'P',p2,'Isobutan');          % [kg/m3] Density of vapour at compressor inlet
    V_flow(1,i)= m_flow(1,i)/rho_in;                               % [m3/s] real volume flow rate
    V_swept=7.48e-6*RPM(i)/60;                                      % [m3/s] theortical swept volume flow rate Vs=3cm3 n=2900rpm
    Vs(1,i)=V_flow(1,i)/V_swept;                                   % Volymteric efficiency
    
    s_in=refpropm('S','T',32+273.15,'P',p2,'Isobutan');            % [J/(kg·KJ)] Entropy at compressor inlet
    h_out_is=refpropm('H','P',p1,'S',s_in,'Isobutan');             % [J/kg] Enthalpy at compressor outlet if isentropic compression
    Dh_comp_is=h_out_is-h2_32;
    Dh_comp_real=Qel(1,i)/m_flow(1,i);
        
    eta_is_a(1,i)=Dh_comp_is/Dh_comp_real;                          % Isentropic efficiency
      
    h_out = h2_32 + Dh_comp_real;                                  % Real enthalpy after compression p2->p1 [kJ/kg]
    T_out = refpropm('T','P',p1,'H',h_out,'Isobutan')-273.15;      % Real temperature after compression p2->p1 [°C]
    DT_comp(1,i)=T_out-32
end   
                    
                            
% Polynomial fit to data   
x=T2;
y=T1;
z=RPM/100;

x=x(:);
y=y(:);
z=z(:);

A=[x.^0  x  y  z ...
   x.*y  x.*z  y.*z  x.^2  y.^2  z.^2 ...
   x.^3 y.^3 z.^3 x.^2.*y x.^2.*z y.^2.*x y.^2.*z z.^2.*x z.^2.*y x.*y.*z ];  

% A=[x.^0  x  y  z  x.*y  x.*z  y.*z  x.^2  y.^2  z.^2];
%    %x.^3 y.^3 z.^3 x.^2.*y x.^2.*z y.^2.*x y.^2.*z z.^2.*x]; % z.^2.*y x.*y.*z ];  



% Polynomial fit of coefficients to cooling capacity: Q2_Cecomaf 
hl=Q2;
hl=hl(:);
if cond(A)>1e10    %1e10 i original
   disp('Varning: dålig noggrannhet');
end
beta=A\hl;
if norm(A*beta-hl)/norm(hl)>0.1
   disp('Varning: stor residual');
end
Q2Coeff=beta


% Polynomial fit of coefficients to compressor input power: Qel
hl=Qel;
hl=hl(:);
apa=cond(A);
if cond(A)>1e10    %1e10 i original
   disp('Varning: dålig noggrannhet');
end
beta=A\hl;
if norm(A*beta-hl)/norm(hl)>0.1
   disp('Varning: stor residual');
end
QelCoeff=beta



% Polynomial fit of coefficients to mass flow: m_flow
hl=m_flow;
hl=hl(:);
apa=cond(A);
if cond(A)>1e10    %1e10 i original
   disp('Varning: dålig noggrannhet');
end
beta=A\hl;
if norm(A*beta-hl)/norm(hl)>0.1
   disp('Varning: stor residual');
end
mCoeff=beta


% Polynomial fit of coefficients to compression temperature rise: DT_comp
hl=DT_comp;
hl=hl(:);
apa=cond(A);
if cond(A)>1e10    %1e10 i original
   disp('Varning: dålig noggrannhet');
end
beta=A\hl;
if norm(A*beta-hl)/norm(hl)>0.1
   disp('Varning: stor residual');
end
DT_compCoeff=beta



% x=-25;
% y=45;
% z=2000;
% A=[x.^0 x y z x.*y x.*z y.*z x.^2  y.^2 z.^2];  

Q=A*Q2Coeff;
DiffQ=Q2'-Q;
RelDiffQ=DiffQ./Q2';

El=A*QelCoeff;
DiffEl=Qel'-El;
RelDiffEl=DiffEl./Qel';

% mFlow=A*mCoeff;
% Diffm=m'-mFlow;
% RelDiffm=Diffm./m';





 t=T2(1:8);
 a=1;

 Data=(RelDiffQ+RelDiffEl)*100;
 model='XV7.2KX';
Label_Y='Heating capacity Error [%]'; %'Heating capacity [W]' %'Power consumption [W]';    %'Cooling capacity [W]';

subplot(2,2,1); 
plot(t,Data(a:a+7),t,Data(a+8:a+15),t,Data(a+16:a+23))
grid
legend('T1=35°C','T1=45°C','T1=55°C',2);
title('XV7.2KX at 1000 rpm');
xlabel('T2 [°C]');
ylabel(Label_Y);

a=5*3*8+1;
subplot(2,2,2); 
plot(t,Data(a:a+7),t,Data(a+8:a+15),t,Data(a+16:a+23))
grid
legend('T1=35°C','T1=45°C','T1=55°C',2);
title('XV7.2KX at 2000 rpm');
xlabel('T2 [°C]');
ylabel(Label_Y);

a=6*3*8+1;
t=T2(1:7);
subplot(2,2,3);  
plot(t,Data(a:a+6),t,Data(a+7:a+13),t,Data(a+14:a+20))
grid
legend('T1=35°C','T1=45°C','T1=55°C',2);
title('XV7.2KX at 3000 rpm');
xlabel('T2 [°C]');
ylabel(Label_Y);

a=6*3*8+3*7+1;
t=T2(1:6);
subplot(2,2,4); 
plot(t,Data(a:a+5),t,Data(a+6:a+11),t,Data(a+12:a+17))
grid
legend('T1=35°C','T1=45°C','T1=55°C',2);
title('XV7.2KX at 4000 rpm');
xlabel('T2 [°C]');
ylabel(Label_Y);