library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DigitalScanning2 is
port
(
clk,reset:in std_logic;
diout:out std_logic_vector (6 downto 0);
cat:out std_logic_vector (5 downto 0)
);
end DigitalScanning2;

architecture DigitalScanning2_arch of DigitalScanning2 is
  signal tmp:integer range 0 to 5;
  signal count:integer range 0 to 5:=0;
  signal count2:integer range 0 to 11:=0;
  signal tmpplus:integer range 0 to 10:=0;
  signal cat_tmp:std_logic_vector (5 downto 0);
begin
  p:process(clk,reset)
  begin
    if reset='1' then tmp<=0;count<=0;count2<=0;
    elsif clk'event and clk='1' then
      if tmp=5 then 
         tmp<=0;
         count<=count+1;
         count2<=count2+1;
       else
         tmp<=tmp+1;
       end if;
       if count=6 then count<=0;
       if count2=12 then count2<=0;
    end if;
    end if;
    for i in 0 to 5 loop
       if tmp=i then cat_tmp(i)<='0';
       else cat_tmp(i)<='1';
       end if;
     end loop;
     for i in 0 to 5 loop
        cat(i)<=cat_tmp(i);
      end loop;
      case count2 is
        when 1=>cat(5)<='1';
        when 2=>cat(5)<='1';cat(4)<='1';
        when 3=>cat(5)<='1';cat(4)<='1';cat(3)<='1';
        when 4=>cat(5)<='1';cat(4)<='1';cat(3)<='1'; cat(2)<='1';
        when 5=>cat(5)<='1';cat(4)<='1';cat(3)<='1'; cat(2)<='1';cat(1)<='1';
        when 6=>cat(5)<='1';cat(4)<='1';cat(3)<='1'; cat(2)<='1';cat(1)<='1';cat(0)<='1';
        when 7=>cat(4)<='1';cat(3)<='1'; cat(2)<='1';cat(1)<='1';cat(0)<='1';
        when 8=>cat(3)<='1'; cat(2)<='1';cat(1)<='1';cat(0)<='1';
        when 9=>cat(2)<='1';cat(1)<='1';cat(0)<='1';
        when 10=>cat(1)<='1';cat(0)<='1';
        when 11=>cat(0)<='1';
        when 0=>
      for i in 0 to 5 loop
        cat(i)<=cat_tmp(i);
      end loop;
      end case;
      tmpplus<=tmp+count;
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
end DigitalScanning2_arch;

        