LIBRARY ieee  ; 
LIBRARY work  ; 
USE ieee.std_logic_1164.all  ; 
USE work.mes_composants.all  ; 
ENTITY genaddr_tb  IS 
  GENERIC (
    M  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE genaddr_tb_arch OF genaddr_tb IS
  SIGNAL selread   :  STD_LOGIC  ; 
  SIGNAL incwrite   :  STD_LOGIC  ; 
  SIGNAL Adrg   :  std_logic_vector (M - 1 downto 0)  ; 
  SIGNAL incread   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  COMPONENT genaddr  
    GENERIC ( 
      M  : NATURAL  );  
    PORT ( 
      selread  : in STD_LOGIC ; 
      incwrite  : in STD_LOGIC ; 
      Adrg  : out std_logic_vector (M - 1 downto 0) ; 
      incread  : in STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : genaddr  
    GENERIC MAP ( 
      M  => M   )
    PORT MAP ( 
      selread   => selread  ,
      incwrite   => incwrite  ,
      Adrg   => Adrg  ,
      incread   => incread  ,
      clk   => clk  ,
      reset   => reset   ) ;

  process begin
    clk <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
  end process;
  
  process begin
    reset <= '0';
    incread <= '1';
    incwrite <= '0';
    selread <= '0';
    wait for 100 ns;
    incwrite <= '1';
    incread <= '0';
    selread <= '1';
    wait for 100 ns;
    reset <= '1';
    wait for 25 ns;
    reset <= '0';
    wait for 100 ns;
  end process;

END ; 

