library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DS is
port
(
clk,reset:in std_logic;
diout:out std_logic_vector (6 downto 0);
cat:out std_logic_vector (5 downto 0)
);
end DS;


architecture DigitalScanning_arch of DS is
  signal tmp:integer range 0 to 5;
  signal count:integer range 0 to 5:=0;
  signal count2:integer range 0 to 20:=0;
  signal tmpplus:integer range 0 to 10:=0;
  signal cat_tmp:std_logic_vector (5 downto 0);
--  signal clk2:std_logic;
begin
--component div_2000 
--port
--(
--clk:in std_logic;
--q:out std_logic
--);
--end component;
--signal clk2:std_logic;
--u1:div_2000 port map(clk,clk2);
  p:process(clk,reset)
  begin
    if reset='1' then tmp<=0;count<=0;
    elsif clk'event and clk='1' then
      if tmp=5 then 
         tmp<=0;
         count2<=count2+1;
       else
         tmp<=tmp+1;
       end if;
       if count2=21 then count2<=0;count<=count+1;
       end if;
       if count=6 then count<=0;
       end if;
    for i in 0 to 5 loop
       if tmp=i then cat_tmp(i)<='0';
       else cat_tmp(i)<='1';
       end if;
     end loop;
     for i in 0 to 5 loop
        cat(i)<=cat_tmp(i);
      end loop;
      tmpplus<=tmp+count;
--       tmpplus<=tmp;
      case tmpplus is
        when 0 =>diout<="1111110"; --0
        when 1 =>diout<="0110000"; --1
        when 2 =>diout<="1101101"; --2
        when 3 =>diout<="1111001"; --3
        when 4 =>diout<="0110011"; --4
        when 5 =>diout<="1011011"; --5
        when 6 =>diout<="1111110"; --0
        when 7 =>diout<="0110000"; --1
        when 8 =>diout<="1101101"; --2
        when 9 =>diout<="1111001"; --3
        when 10 =>diout<="0110011"; --4
      end case;
    end if;
  end process p;
end DigitalScanning_arch;

--entity DigitalScanning is
--port
--(
--clk,reset:in std_logic;
--diout:out std_logic_vector (6 downto 0);
--cat:out std_logic_vector (7 downto 0)
--);
--end DigitalScanning;
--
--architecture DigitalScanning_arch of DigitalScanning is
--  signal tmp:integer range 0 to 7;
--  signal count:integer range 0 to 7:=0;
--  signal tmpplus:integer range 0 to 14:=0;
--  signal cat_tmp:std_logic_vector (7 downto 0);
--begin
--  p:process(clk,reset)
--  begin
--    if reset='1' then tmp<=0;count<=0;
--    elsif clk'event and clk='1' then
--      if tmp=7 then 
--         tmp<=0;
--         count<=count+1;
--       else
--         tmp<=tmp+1;
--       end if;
--       if count=8 then count<=0;
--    end if;
--    for i in 0 to 7 loop
--       if tmp=i then cat_tmp(i)<='0';
--       else cat_tmp(i)<='1';
--       end if;
--     end loop;
--     for i in 0 to 7 loop
--        cat(i)<=cat_tmp(i);
--      end loop;
--      tmpplus<=tmp+count;
--      case tmpplus is
--        when 0 =>diout<="1111110"; --0
--        when 1 =>diout<="0110000"; --1
--        when 2 =>diout<="1101101"; --2
--        when 3 =>diout<="1111001"; --3
--        when 4 =>diout<="0110011"; --4
--        when 5 =>diout<="1011011"; --5
--        when 6 =>diout<="1011111"; --6
--        when 7 =>diout<="1110000"; --7
--        when 8 =>diout<="1111110"; --0
--        when 9 =>diout<="0110000"; --1
--        when 10 =>diout<="1101101"; --2
--        when 11 =>diout<="1111001"; --3
--        when 12 =>diout<="0110011"; --4
--        when 13 =>diout<="1011011"; --5
--        when 14 =>diout<="1011111"; --6
--      end case;
--    end if;
--  end process p;
--end DigitalScanning_arch;


        