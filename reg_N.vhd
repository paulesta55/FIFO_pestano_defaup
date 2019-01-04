-- de faup gregoire & estano paul

------------------------------------
--reg_N.vhd
------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.CHECK_PKG.all;
-------------------------------------
entity reg_N is
  generic(--t_setup 	: time := 5 ns;
  --t_hold: time := 15 ns;
  N: natural := 8); 
  port(reset, clk: in std_logic;
    D: in std_logic_vector(N-1 downto 0);
    Q: out std_logic_vector(N-1 downto 0));
end reg_N;

architecture regN1 of reg_N is 
BEGIN
--check_setup(clk,D,t_setup);
--check_hold(clk,D,t_hold);
  process(clk, reset)
    begin
      if reset = '1' then
        Q <= (others => '0');
      else
        if( clk = '1' and clk'event) then
        Q <= D;
        end if;
      end if;
    end process;
end regN1;