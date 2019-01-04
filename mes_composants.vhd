-- de faup gregoire & estano paul

--mes_composants.vhd
library ieee;
use ieee.std_logic_1164.all;
----------------------------------
package mes_composants is

component FIFO is 
  generic(N: natural := 8;
  M : natural := 4
--  t_hold: time := 1 ns;
--  t_setup: time := 1 ns
);
  port(Din : in std_logic_vector(N-1 downto 0);
    clk, reset, Req : in std_logic;
    Ack, HL, fast, slow : out std_logic;
    Data_out : out std_logic_vector(N-1 downto 0));
  end component;

component div2
generic (N : natural :=10);
  port(clk_in,reset : in std_logic;
        clk_out : out std_logic);
end component;

component div2_N
generic (N : natural :=8);
  port(clk_in,reset : in std_logic;
        clk_out : out std_logic);
end component;

component RAM_2pMxNbits
generic (M: natural := 4; N : natural := 8);
  port (OE, RW_n, CS_n: in std_logic;
        Din: in std_logic_vector(N-1 downto 0);
        Adr: in std_logic_vector( M - 1 downto 0);
        Dout: out std_logic_vector(N-1 downto 0));
end component;

component compteur_decompteur_N
generic (N : natural := 8);
  port (UpDown, reset, clk, EN: in std_logic;
        q : out std_logic_vector (N-1 downto 0)
  );
end component;

component genHL
  port(clk,reset : in std_logic;
        ENREAD,ENWRITE : out std_logic);
end component;

component mux2xN_1xN
generic (N : natural := 8);
  port (In1, In2 : in std_logic_vector (N-1 downto 0);
        sel : in std_logic;
        Sort : out std_logic_vector (N-1 downto 0)
  );
End component;

component genaddr
  generic(M : natural := 8);
  port (reset, clk, incread, incwrite, selread : in std_logic;
            Adrg : out std_logic_vector(M-1 downto 0)
            );
end component;

component fastslow
  generic(M : natural := 4);
  port (reset, clk, incread, incwrite : in std_logic;
        fast, slow : out std_logic);
  end component;
  
component complement_a_2 is
generic (N: natural := 8);
port (nombre: in std_logic_vector( N-1 downto 0);
	sortie: out std_logic_vector( N-1 downto 0));
end component;

component SEQ is
  generic (N : natural := 8  );
  port (ENW, reset, clk, ENR,REQ: in std_logic;
        Ack,CS_n,RW_n,OE,Selread,HL,incread,incwrite : out std_logic
  );
end  component;

component reg_N is
  generic(
  --t_setup 	: time := 5 ns;
  --t_hold: time := 15 ns;
  N: natural := 8); 
  port(reset, clk: in std_logic;
    D: in std_logic_vector(N-1 downto 0);
    Q: out std_logic_vector(N-1 downto 0));
end component;

end mes_composants;