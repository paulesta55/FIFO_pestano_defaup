-- de faup gregoire & estano paul
--------------------------------------------------------------------------
-- complement_a_2.vhd
--------------------------------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all ;
use work.mes_fonctions.all�;

entity complement_a_2 is
generic (N�: natural �:= 8)�;
port (nombre�: in std_logic_vector( N-1 downto 0)�;
	sortie�: out std_logic_vector( N-1 downto 0))�;
end complement_a_2�;

architecture archi_complement_a_2 of complement_a_2 is
begin
sortie <= cpl2(nombre, N)�;
end archi_complement_a_2�;
--------------------------------------------------------------------------