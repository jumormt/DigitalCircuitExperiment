library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cout_8421 is
port
(
clk,reset:in std_logic;
q:out std_logic_vector (3 downto 0)
);
end cout_8421;

architecture cout_8421_arc of cout_8421 is
signal q_temp: std_logic_vector (3 downto 0);
begin
   process (clk,reset)
   begin 
    if (reset='1') then q_temp<="0000";
    else if (clk'event and clk='1') then 
    if (q_temp="1001") then q_temp<="0000";
    else q_temp<=q_temp+1;
end if;
end if;
end if;
end process;
q<=q_temp;
end cout_8421_arc;


