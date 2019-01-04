-- de faup gregoire & estano paul

------------------------------------
--RAM_2pMxNbits.vhd
------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-------------------------------------
entity RAM_2pMxNbits is
  generic (M: natural := 4; N : natural := 8  );
  port (OE, RW_n, CS_n: in std_logic;
        Din: in std_logic_vector(N-1 downto 0);
        Adr: in std_logic_vector( M - 1 downto 0);
        Dout: out std_logic_vector(N-1 downto 0));
end  RAM_2pMxNbits;
-------------------------------------

architecture ram of RAM_2pMxNbits is
  
type memo is array(2**M -1 downto 0) of std_logic_vector(N-1 downto 0);
signal data : memo;

begin
  process( CS_n, Adr, Din, RW_n, OE)
    begin
      if CS_n='0' then
       --------valid memory------------
        if RW_n = '1' then  ----------read----------
          if OE = '0' then
            Dout <= (others => 'Z');
          else 
            Dout <= data(conv_integer(adr));
          end if;
      
        elsif RW_n = '0' then ---------write---------
          data(conv_integer(adr)) <= Din;
        end if;
      else
        --------invalid memory--------
        Dout <= (others => 'Z'); -----high Z-------
      end if;
  end process;
end ram;

