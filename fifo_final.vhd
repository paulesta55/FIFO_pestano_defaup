---------------------------
-- fifo_final.vhd
-- gregoire de faup & Paul Estano
---------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.mes_composants.all;
use work.mes_composants_data_supply.all;

entity fifo_final is 
  generic(N: natural := 8;
  M : natural := 4
  --t_hold: time := 1 ns;
  --t_setup: time := 1 ns
  );
  port(
  clk, reset, start : in std_logic;
  HL : out std_logic;
    Data_out : out std_logic_vector(N-1 downto 0));
  end fifo_final;

architecture fifo_final_1 of fifo_final is
  signal Din : std_logic_vector(N - 1 downto 0);
  signal req : std_logic;
 signal fast: std_logic;
  signal slow : std_logic;
  signal Ack : std_logic;
   
  begin
    data_sup : data_supply port map(clk, reset, Ack, start, req, Din);
      fifo_int : FIFO generic map(N,M)
      port map(Din,clk,reset, req, Ack, HL, fast, slow, Data_out);
 end fifo_final_1; 