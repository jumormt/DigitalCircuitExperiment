library ieee;
use ieee.std_logic_1164.all;

entity t8421_gley is
  port
  (
    i1,i2,i3,i4:in std_logic;
    o1,o2,o3,o4:out std_logic
  );
end t8421_gley;

architecture t8421_gley_arc of t8421_gley is
begin 
   process (i1,i2,i3,i4)
    variable input:std_logic_vector (3 downto 0);
  begin
    input:=i1&i2&i3&i4;
    case input is
      when "0000" =>o1<='0';o2<='0';o3<='0';o4<='0';
      when "0001" =>o1<='0';o2<='0';o3<='0';o4<='1';
      when "0010" =>o1<='0';o2<='0';o3<='1';o4<='1';
      when "0011" =>o1<='0';o2<='0';o3<='1';o4<='0';
      when "0100" =>o1<='0';o2<='1';o3<='1';o4<='0';
      when "0101" =>o1<='0';o2<='1';o3<='1';o4<='1';
      when "0110" =>o1<='0';o2<='1';o3<='0';o4<='1';
      when "0111" =>o1<='0';o2<='1';o3<='0';o4<='0';
      when "1000" =>o1<='1';o2<='1';o3<='0';o4<='0';
      when "1001" =>o1<='1';o2<='0';o3<='0';o4<='0';
      when others =>o1<='0';o2<='0';o3<='0';o4<='0';
    end case;
  end process;  
  end;