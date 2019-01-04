-- de faup gregoire & estano paul

LIBRARY ieee  ; 
LIBRARY work  ; 
USE ieee.std_logic_1164.all  ; 
USE work.mes_composants.all  ; 
ENTITY fastslow_tb  IS 
  GENERIC (
    M  : NATURAL   := 4 ); 
END ; 
 
ARCHITECTURE fastslow_tb_arch OF fastslow_tb IS
  SIGNAL slow   :  STD_LOGIC  ; 
  SIGNAL incwrite   :  STD_LOGIC  ; 
  SIGNAL fast   :  STD_LOGIC  ; 
  SIGNAL incread   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  COMPONENT fastslow  
    GENERIC ( 
      M  : NATURAL  );  
    PORT ( 
      slow  : out STD_LOGIC ; 
      incwrite  : in STD_LOGIC ; 
      fast  : out STD_LOGIC ; 
      incread  : in STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : fastslow  
    GENERIC MAP ( 
      M  => M   )
    PORT MAP ( 
      slow   => slow  ,
      incwrite   => incwrite  ,
      fast   => fast  ,
      incread   => incread  ,
      clk   => clk  ,
      reset   => reset   ) ;
      PROCESS BEGIN
      clk <= '1';  WAIT FOR 20 ns;
      clk <= '0';  WAIT FOR 20 ns;
    END PROCESS;
    PROCESS BEGIN
          reset <= '0';
            incread <= '0';
           incwrite <= '1'; WAIT FOR 480 ns;
           incread <= '1'; WAIT FOR 80 ns;
           incwrite <= '0'; WAIT FOR 400 ns;
           
           reset <= '1'; WAIT FOR 40 ns;
            reset <= '0'; incwrite <= '1'; incread <= '0';
            WAIT;
    END PROCESS; 
END ; 

