LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY seg7_1 IS
   PORT(a:IN STD_LOGIC_VECTOR(3 downto 0);
        b:OUT STD_LOGIC_VECTOR(6 downto 0);
        c:OUT STD_LOGIC_VECTOR(7 downto 0));
END seg7_1;

ARCHITECTURE one OF seg7_1 IS
BEGIN    
  PROCESS(a)
  BEGIN
    CASE a IS
         WHEN"0000" =>b<="1111110";  
         WHEN"0001" =>b<="0110000";
         WHEN"0010" =>b<="1101101";
         WHEN"0011" =>b<="1111001";
         WHEN"0100" =>b<="0110011";
         WHEN"0101" =>b<="1011011";
         WHEN"0110" =>b<="1011111";
         WHEN"0111" =>b<="1110000";
         WHEN"1000" =>b<="1111111";
         WHEN"1001" =>b<="1111011";
         WHEN OTHERS =>b<="0000000";
    END CASE;
   END PROCESS;
   c<="11011111";
END one;
