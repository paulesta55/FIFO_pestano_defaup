-- de faup gregoire & estano paul

LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
ENTITY mux2xn_1xn_tb  IS 
  GENERIC (
    N  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE mux2xn_1xn_tb_arch OF mux2xn_1xn_tb IS
  SIGNAL Sort   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL sel   :  STD_LOGIC  ; 
  SIGNAL In1   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL In2   :  std_logic_vector (N - 1 downto 0)  ; 
  COMPONENT mux2xN_1xN  
    GENERIC ( 
      N  : NATURAL  );  
    PORT ( 
      Sort  : out std_logic_vector (N - 1 downto 0) ; 
      sel  : in STD_LOGIC ; 
      In1  : in std_logic_vector (N - 1 downto 0) ; 
      In2  : in std_logic_vector (N - 1 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : mux2xN_1xN  
    GENERIC MAP ( 
      N  => N   )
    PORT MAP ( 
      Sort   => Sort  ,
      sel   => sel  ,
      In1   => In1  ,
      In2   => In2   ) ;

  process begin
    In1 <= "11111111";
    In2 <= "00000000";
    sel <= '0';
    wait for 10 ns;
    In2 <= "11111111";
    In1 <= "00000000";
    wait for 10 ns;
    sel <= '1';
    wait for 10 ns;
    In1 <= "11111111";
    In2 <= "00000000";
    wait for 10 ns;
  end process;

END ; 

