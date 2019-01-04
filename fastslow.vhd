-- de faup gregoire & estano paul

---------------------------
-- fastslow.vhd
-- gregoire de faup & Paul Estano
---------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.mes_composants.all;

entity fastslow is
  generic(M : natural := 4);
  port (reset, clk, incread, incwrite : in std_logic;
        fast, slow : out std_logic
        );
end fastslow;

architecture fastslow of fastslow is
signal EN : std_logic;
signal comptOut : std_logic_vector(M-1 downto 0);

begin
EN <= incread XOR incwrite;
compteur_write : compteur_decompteur_N generic map (M)
            port map( incwrite, reset, clk, EN, comptOut);
fast <= comptOut(M-1)  NOR comptOut(M-2);  
slow <= comptOut(M-1)  AND comptOut(M-2);
end fastslow;