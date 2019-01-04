-- de faup gregoire & estano paul

------------------------------------
--compteur_decompteur_N.vhd
------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity compteur_decompteur_N is
  generic (N : natural := 8  );
  port (UpDown, reset, clk, EN: in std_logic;
        q : out std_logic_vector (N-1 downto 0)
  );
end  compteur_decompteur_N;
-------------------------------------

architecture comp of compteur_decompteur_N is
signal tmp: std_logic_vector (N-1 downto 0):= (others => '0');
begin
  q <= tmp;
  process(reset,clk)
    begin
      if EN = '1' then
        if clk = '1' and clk'event then
          if reset = '1' then tmp <= (others => '0');
          else
           if UpDown ='1' then tmp <=tmp + '1';
           elsif UpDown ='0' then tmp <=tmp - '1';
           end if;
          end if;  
        end if;
      end if;

end process;

end comp;