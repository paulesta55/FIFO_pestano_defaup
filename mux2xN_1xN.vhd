-- de faup gregoire & estano paul

------------------------------------
--mux2xN_1xN.vhd
------------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------

entity mux2xN_1xN is
  generic (N : natural := 8);
  port (In1, In2 : in std_logic_vector (N-1 downto 0);
        sel : in std_logic;
        Sort : out std_logic_vector (N-1 downto 0)
  );
end  mux2xN_1xN;
-------------------------------------
architecture mux2xN_1xN of mux2xN_1xN is
begin
Sort <= In2 when sel = '1' else In1;
end mux2xN_1xN;