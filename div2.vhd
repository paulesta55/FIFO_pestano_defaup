-- de faup gregoire & estano paul

------------------------------------
--div2.vhd
------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity div2 is
generic (delay : TIME:= 10 ns);
  port(clk_in,reset : in std_logic;
        clk_out : out std_logic);
End div2;
---------------------------------

Architecture div2 of div2 is
signal temp: std_logic :='0';
begin
 
-----------------------------------

Process(clk_in,reset)
Begin
  if reset ='1' then clk_out <='0'; temp<='0';
  else
    if clk_in='1' and clk_in'event then temp <= not temp; 
    clk_out<=temp after delay;
    end if;
  end if;
end process;
--------------------------------------
end div2;
