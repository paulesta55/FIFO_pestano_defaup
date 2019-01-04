---------------------------
-- FIFO.vhd
-- gregoire de faup & Paul Estano
---------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.mes_composants.all;

entity FIFO is 
  generic(N: natural := 8;
  M : natural := 4
  --t_hold: time := 1 ns;
  --t_setup: time := 1 ns
  );
  port(Din : in std_logic_vector(N-1 downto 0);
    clk, reset, Req : in std_logic;
    Ack, HL, fast, slow : out std_logic;
    Data_out : out std_logic_vector(N-1 downto 0));
  end FIFO;
  
  architecture fifo1 of FIFO is
    signal regN_out : std_logic_vector(N-1 downto 0);
    signal comp2_out : std_logic_vector(N-1 downto 0);
    signal ENR: std_logic;
    signal ENW: std_logic;
    signal OE: std_logic;
    signal CS_n: std_logic;
    signal RW_n: std_logic;
    signal incread: std_logic;
    signal incwrite: std_logic;
    signal Selread: std_logic;
    signal Addr: std_logic_vector(M-1 downto 0);
    begin
      regN : reg_N --generic map(t_setup, t_hold,N)
      port map(reset, clk, Din,regN_out);
        
      comp2 : complement_a_2 generic map(N)
      port map(regN_out,comp2_out);
        
      genHLI : genHL port map(clk, reset, ENR,ENW);
      
      seqI: SEQ generic map(N)
      port map(ENW, reset, clk, ENR, Req,Ack ,CS_n ,RW_n ,OE ,Selread,HL,incread,incwrite);
        
      
      genaddrI: genaddr generic map(M)
      port map(reset, clk, incread, incwrite, Selread, Addr);
      
      ram : RAM_2pMxNbits generic map(M,N)
      port map(OE,RW_n,CS_n,comp2_out,Addr,Data_out);
        
      fs : fastslow generic map(M)
      port map(reset, clk, incread, incwrite, fast, slow);
      
      end fifo1;
    