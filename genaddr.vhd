-- de faup gregoire & estano paul

---------------------------
-- genaddr.vhd
-- gregoire de faup & antoine delavoypierre
---------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.mes_composants.all;

entity genaddr is
  generic(M : natural := 8);
  port (reset, clk, incread, incwrite, selread : in std_logic;
            Adrg : out std_logic_vector(M-1 downto 0)
            );
end genaddr;
------------------------------------------------------

architecture genaddr of genaddr is

signal SIG_1: std_logic_vector(M-1 downto 0);
signal SIG_2: std_logic_vector(M-1 downto 0);

begin
compteuur_read : compteur_decompteur_N generic map (M)
            port map( '1', reset, clk, incread, SIG_1);
              
compteur_write : compteur_decompteur_N generic map (M)
            port map( '1', reset, clk, incwrite, SIG_2);

Adrg <= SIG_2 when selread = '1' else SIG_1;

--mux : mux2xN_1xN generic map (M)
--            port map( SIG_1, SIG_2, selread, Adrg);

end genaddr;

