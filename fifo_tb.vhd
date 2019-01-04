-- de faup gregoire & estano paul

LIBRARY ieee  ; 
LIBRARY work  ; 
USE ieee.std_logic_1164.all  ; 
USE work.mes_composants.all  ; 
ENTITY fifo_tb  IS 
  GENERIC (
    t_setup  : TIME   := 1 ns ;  
    M  : NATURAL   := 4 ;  
    t_hold  : TIME   := 1 ns ;  
    N  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE fifo_tb_arch OF fifo_tb IS
  SIGNAL HL   :  STD_LOGIC  ; 
  SIGNAL Req   :  STD_LOGIC  ; 
  SIGNAL Data_out   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL slow   :  STD_LOGIC  ; 
  SIGNAL fast   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL Ack   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  SIGNAL Din   :  std_logic_vector (N - 1 downto 0)  ; 
  COMPONENT FIFO  
    GENERIC ( 
      t_setup  : TIME ; 
      M  : NATURAL ; 
      t_hold  : TIME ; 
      N  : NATURAL  );  
    PORT ( 
      HL  : out STD_LOGIC ; 
      Req  : in STD_LOGIC ; 
      Data_out  : out std_logic_vector (N - 1 downto 0) ; 
      slow  : out STD_LOGIC ; 
      fast  : out STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      Ack  : out STD_LOGIC ; 
      reset  : in STD_LOGIC ; 
      Din  : in std_logic_vector (N - 1 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : FIFO  
    GENERIC MAP ( 
      t_setup  => t_setup  ,
      M  => M  ,
      t_hold  => t_hold  ,
      N  => N   )
    PORT MAP ( 
      HL   => HL  ,
      Req   => Req  ,
      Data_out   => Data_out  ,
      slow   => slow  ,
      fast   => fast  ,
      clk   => clk  ,
      Ack   => Ack  ,
      reset   => reset  ,
      Din   => Din   ) ; 
      PROCESS BEGIN
      clk <= '0';  WAIT FOR 20 ns;
      clk <= '1';  WAIT FOR 20 ns;
    END PROCESS;
    PROCESS BEGIN
      Req <= '1';
      reset <= '0';
      Din <= "00000000";
      WAIT FOR 20 ns;
      Req <= '0';
      WAIT FOR 240 ns;
      Req <= '1';
      WAIT FOR 240 ns;
      Din <= "00000001";
      WAIT FOR 20 ns;
      Req <= '0';
      WAIT FOR 240 ns;
      Req <= '1';
      WAIT FOR 240 ns;
      Din <= "00000010";
      WAIT FOR 20 ns;
      Req <= '0';
      WAIT FOR 240 ns;
      Req <= '1';
      
      WAIT ;
    END PROCESS;
END ; 

