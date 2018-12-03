LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY vote4 IS
  PORT
  (
    v1,v2,v3,v4:in std_logic;
    result:out std_logic
  );
end vote4;

architecture vote4_arc of vote4 is
begin
  process(v1,v2,v3,v4)
  variable vote:std_logic_vector (3 downto 0);
  begin
    vote:=v1&v2&v3&v4;
    case vote is
       when "1111"=>result<='1';
       when "1110"=>result<='1';
       when "0111"=>result<='1';
       when "1011"=>result<='1';
       when "1101"=>result<='1';
       when others =>result<='0';
    end case;
  end process;
end;

       