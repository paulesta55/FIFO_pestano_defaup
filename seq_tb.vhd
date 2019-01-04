-- de faup gregoire & estano paul

LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
ENTITY seq_tb  IS 
  GENERIC (
    N  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE seq_tb_arch OF seq_tb IS
  SIGNAL REQ   :  STD_LOGIC  ; 
  SIGNAL Selread   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  SIGNAL CS_n   :  STD_LOGIC  ; 
  SIGNAL HL   :  STD_LOGIC  ; 
  SIGNAL incwrite   :  STD_LOGIC  ; 
  SIGNAL ENR   :  STD_LOGIC  ; 
  SIGNAL Ack   :  STD_LOGIC  ; 
  SIGNAL ENW   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL OE   :  STD_LOGIC  ; 
  SIGNAL RW_n   :  STD_LOGIC  ; 
  SIGNAL incread   :  STD_LOGIC  ; 
  COMPONENT SEQ  
    GENERIC ( 
      N  : NATURAL  );  
    PORT ( 
      REQ  : in STD_LOGIC ; 
      Selread  : out STD_LOGIC ; 
      reset  : in STD_LOGIC ; 
      CS_n  : out STD_LOGIC ; 
      HL  : out STD_LOGIC ; 
      incwrite  : out STD_LOGIC ; 
      ENR  : in STD_LOGIC ; 
      Ack  : out STD_LOGIC ; 
      ENW  : in STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      OE  : out STD_LOGIC ; 
      RW_n  : out STD_LOGIC ; 
      incread  : out STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : SEQ  
    GENERIC MAP ( 
      N  => N   )
    PORT MAP ( 
      REQ   => REQ  ,
      Selread   => Selread  ,
      reset   => reset  ,
      CS_n   => CS_n  ,
      HL   => HL  ,
      incwrite   => incwrite  ,
      ENR   => ENR  ,
      Ack   => Ack  ,
      ENW   => ENW  ,
      clk   => clk  ,
      OE   => OE  ,
      RW_n   => RW_n  ,
      incread   => incread   ) ; 
       PROCESS BEGIN
      clk <= '1';  WAIT FOR 20 ns;
      clk <= '0';  WAIT FOR 20 ns;
    END PROCESS;
    PROCESS BEGIN
      reset <= '1';WAIT FOR 40 ns;
      reset <= '0';
      REQ <= '0';
      ENW <= '1'; WAIT FOR 80 ns;
      ENR <= '1'; WAIT FOR 40 ns;
      ENR <= '0'; WAIT FOR 40 ns;
      Req <= '1';WAIT FOR 40 ns;
      ENR <= '1'; WAIT FOR 40 ns;
      ENR <= '0'; WAIT;
    END PROCESS;
      
END ; 

