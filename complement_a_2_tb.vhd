-- de faup gregoire & estano paul

LIBRARY ieee  ; 
LIBRARY work  ; 
USE ieee.std_logic_1164.all  ; 
USE work.mes_fonctions.all  ; 
ENTITY complement_a_2_tb  IS 
  GENERIC (
    N  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE complement_a_2_tb_arch OF complement_a_2_tb IS
  SIGNAL sortie   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL nombre   :  std_logic_vector (N - 1 downto 0)  ; 
  COMPONENT complement_a_2  
    GENERIC ( 
      N  : NATURAL  );  
    PORT ( 
      sortie  : out std_logic_vector (N - 1 downto 0) ; 
      nombre  : in std_logic_vector (N - 1 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : complement_a_2  
    GENERIC MAP ( 
      N  => N   )
    PORT MAP ( 
      sortie   => sortie  ,
      nombre   => nombre   ) ; 
      process begin
      nombre <= "00000100";
      wait for 40 ns;
      nombre <= "11111100";
      wait;
      end process;
END ; 

