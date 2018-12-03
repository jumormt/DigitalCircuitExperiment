library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity div_2000 is
port
(
clk:in std_logic;
q:out std_logic
);
end div_2000;

architecture div_2000_arc of div_2000 is
  signal temp:integer range 0 to 999;
  signal q_temp:std_logic;
  begin
  process(clk)
  begin
     if clk'event and clk='1' then 
    if temp=999 then temp<=0 ;q_temp<= not q_temp;
    else temp<=temp+1;
end if;
end if;
end process;
q<=q_temp;
end div_2000_arc;
  