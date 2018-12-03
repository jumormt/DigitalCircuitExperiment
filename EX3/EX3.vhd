LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY EX3 IS
 PORT(
   clk,reset:IN STD_LOGIC;
   EX:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
   c:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
END EX3;

ARCHITECTURE EX3_arch OF EX3 IS

component cout_8421 is
 PORT(
       clk,reset:IN STD_LOGIC;
               q:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END component;

component div_12 IS
 PORT(
   clk:IN STD_LOGIC;
   q:OUT STD_LOGIC);
  END component;
  
component seg7_1 IS
 PORT(
   a:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
   b:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
   c:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
 END component;
 
  signal tmp1:STD_LOGIC;
  SIGNAL tmp2:STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL CLKTMP:STD_LOGIC;
  
 BEGIN
   u1: div_12 port map(clk,tmp1);
   u2: cout_8421 port map (tmp1,reset,tmp2);
   u3: seg7_1 port map(tmp2,EX,c);
   
 END EX3_arch;
  