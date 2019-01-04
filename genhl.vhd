-- de faup gregoire & estano paul

---------------------------
-- genHL.vhd
-- gregoire de faup & antoine delavoypierre
---------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.mes_composants.all;
----------------------------

entity genHL is
  port(clk,reset : in std_logic;
        ENREAD,ENWRITE : out std_logic);
End genHL;


architecture genHL of genHL is
signal temp8: std_logic_vector(7 downto 0);
signal temp : std_logic;
signal raz: std_logic;

begin 
    -- instanciation du compteur decompteur
  compteur : compteur_decompteur_N generic map (8)
            port map( '1', raz, clk, '1', temp8);
  temp <= '1' when temp8 = "11000111" else '0';
  ENREAD <= temp;
  ENWRITE <= not temp;
  raz <= temp or reset;
  
  
 end genHL;