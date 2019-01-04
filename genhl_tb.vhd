-- de faup gregoire & estano paul

LIBRARY ieee  ; 
LIBRARY work  ; 
USE ieee.std_logic_1164.all  ; 
USE work.mes_composants.all  ; 
ENTITY genhl_tb  IS 
END ; 
 
ARCHITECTURE genhl_tb_arch OF genhl_tb IS
  SIGNAL ENWRITE   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL ENREAD   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  COMPONENT genHL  
    PORT ( 
      ENWRITE  : out STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      ENREAD  : out STD_LOGIC ; 
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : genHL  
    PORT MAP ( 
      ENWRITE   => ENWRITE  ,
      clk   => clk  ,
      ENREAD   => ENREAD  ,
      reset   => reset   ) ;
  
    PROCESS BEGIN 
      clk <= '0';  WAIT FOR 10 ns;
      clk <= '1';  WAIT FOR 10 ns;
    END PROCESS;
    
    process begin
      reset <= '0'; 
      wait for 4000 ns;
      wait for 100 ns;
      reset <= '1';
      wait for 100 ns;
      end process;
END ; 

