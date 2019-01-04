-- de faup gregoire & estano paul

LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
ENTITY compteur_decompteur_n_tb  IS 
  GENERIC (
    N  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE compteur_decompteur_n_tb_arch OF compteur_decompteur_n_tb IS
  SIGNAL q   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL UpDown   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ;
  SIGNAL EN   :  STD_LOGIC  ;
  
  COMPONENT compteur_decompteur_N  
    GENERIC ( 
      N  : NATURAL  );  
    PORT ( 
      q  : out std_logic_vector (N - 1 downto 0) ; 
      UpDown  : in STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      EN  : in STD_LOGIC ;
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : compteur_decompteur_N  
    GENERIC MAP ( 
      N  => N   )
    PORT MAP ( 
      q   => q  ,
      UpDown   => UpDown  ,
      clk   => clk  ,
      reset   => reset,
      EN => EN   ) ;
      
    PROCESS BEGIN 
      clk <= '0';  WAIT FOR 20 ns;
      clk <= '1';  WAIT FOR 20 ns;
    END PROCESS;
    
    process begin
      EN <= '1';
      reset <= '0';
      UpDown <= '1'; --comptage
      wait for 160 ns;
      reset <= '1';
      UpDown <= '0'; --decomptage
      wait for 25 ns;
      reset <='0';
      wait for 100 ns;
      EN <= '0'; wait;
      end process;
END ; 

