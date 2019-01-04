-- de faup gregoire & estano paul

--div2_N.vhd
library ieee;
use ieee.std_logic_1164.all;
use work.mes_composants.all;
----------------------------

entity div2_N is
generic (N : natural :=10);
  port(clk_in,reset : in std_logic;
        clk_out : out std_logic);
End div2_N;


architecture div2_N of div2_N is
signal P: std_logic_vector(0 to N);
begin
  div2_p_N: for i in 0 to N-1 generate
  div: div2 port map( P(i),reset, P(i+1));
  end generate div2_p_N;
  P(0) <= clk_in;
  clk_out <= P(N);
end div2_N;