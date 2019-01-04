-- de faup gregoire & estano paul

LIBRARY ieee  ; 
LIBRARY work  ; 
USE ieee.std_logic_1164.all  ; 
USE work.mes_composants.all  ; 
ENTITY div2_n_tb  IS 
  GENERIC (
    N  : NATURAL   := 10 ); 
END ; 
 
ARCHITECTURE div2_n_tb_arch OF div2_n_tb IS
  SIGNAL clk_in   :  STD_LOGIC  ; 
  SIGNAL clk_out   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  COMPONENT div2_N  
    GENERIC ( 
      N  : NATURAL  );  
    PORT ( 
      clk_in  : in STD_LOGIC ; 
      clk_out  : out STD_LOGIC ; 
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : div2_N  
    GENERIC MAP ( 
      N  => N   )
    PORT MAP ( 
      clk_in   => clk_in  ,
      clk_out   => clk_out  ,
      reset   => reset   ) ; 
      PROCESS BEGIN
         
      clk_in <= '0';  WAIT FOR 20 ns;
      clk_in <= '1';  WAIT FOR 20 ns;
    END PROCESS;
    process begin
      reset <= '1'; wait for 100 ns;
      reset <='0'; wait;
      end process;
END ; 

