-- de faup gregoire & estano paul

LIBRARY ieee  ; 
LIBRARY work  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE work.CHECK_PKG.all  ; 
ENTITY reg_n_tb  IS 
  GENERIC (
    t_setup  : TIME   := 5 ns ;  
    N  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE reg_n_tb_arch OF reg_n_tb IS
  SIGNAL D   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL Q   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL reset   :  STD_LOGIC  ; 
  COMPONENT reg_N  
    GENERIC ( 
      t_setup  : TIME ; 
      N  : NATURAL  );  
    PORT ( 
      D  : in std_logic_vector (N - 1 downto 0) ; 
      Q  : out std_logic_vector (N - 1 downto 0) ; 
      clk  : in STD_LOGIC ; 
      reset  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : reg_N  
    GENERIC MAP ( 
      t_setup  => t_setup  ,
      N  => N   )
    PORT MAP ( 
      D   => D  ,
      Q   => Q  ,
      clk   => clk  ,
      reset   => reset   ) ; 
      process
        begin
          clk <= '0';
          wait for 20 ns;
          clk <= '1';
          wait for 20 ns;
        end process;
        process
          begin
            D <= "00000000";
            wait for 10 ns;
            D <= "10000000"; 
            wait for 24 ns;
            D <= "01000000";
            wait for 22 ns;
            D <= "00000010";
            wait for 24 ns;
           end process; 
END ; 

