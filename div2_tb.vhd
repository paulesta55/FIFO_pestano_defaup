-- de faup gregoire & estano paul

LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
ENTITY div2_tb  IS 
END ; 
 
ARCHITECTURE div2_tb_arch OF div2_tb IS
  SIGNAL clk_in   :  STD_LOGIC  ; 
  SIGNAL clk_out   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  COMPONENT div2  
      PORT ( 
      
      clk_in  : in STD_LOGIC ; 
      clk_out  : out STD_LOGIC ; 
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : div2  
  
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

