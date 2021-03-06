library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity div_12 is
port
(
clk:in std_logic;
q:out std_logic
);
end div_12;

architecture div_12_arc of div_12 is
  signal temp:integer range 0 to 5;
  signal q_temp:std_logic;
  begin
  process(clk)
  begin
     if clk'event and clk='1' then 
    if temp=5 then temp<=0 ;q_temp<= not q_temp;
    else temp<=temp+1;
end if;
end if;
end process;
q<=q_temp;
end div_12_arc;
  