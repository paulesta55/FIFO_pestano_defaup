-- de faup gregoire & estano paul

LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
ENTITY ram_2pmxnbits_tb  IS 
  GENERIC (
    M  : NATURAL   := 4 ;  
    N  : NATURAL   := 8 ); 
END ; 
 
ARCHITECTURE ram_2pmxnbits_tb_arch OF ram_2pmxnbits_tb IS
  SIGNAL Dout   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL OE   :  STD_LOGIC  ; 
  SIGNAL RW_n   :  STD_LOGIC  ; 
  SIGNAL Adr   :  std_logic_vector (M - 1 downto 0)  ; 
  SIGNAL Din   :  std_logic_vector (N - 1 downto 0)  ; 
  SIGNAL CS_n   :  STD_LOGIC  ; 
  COMPONENT RAM_2pMxNbits  
    GENERIC ( 
      M  : NATURAL ; 
      N  : NATURAL  );  
    PORT ( 
      Dout  : out std_logic_vector (N - 1 downto 0) ; 
      OE  : in STD_LOGIC ; 
      RW_n  : in STD_LOGIC ; 
      Adr  : in std_logic_vector (M - 1 downto 0) ; 
      Din  : in std_logic_vector (N - 1 downto 0) ; 
      CS_n  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : RAM_2pMxNbits  
    GENERIC MAP ( 
      M  => M  ,
      N  => N   )
    PORT MAP ( 
      Dout   => Dout  ,
      OE   => OE  ,
      RW_n   => RW_n  ,
      Adr   => Adr  ,
      Din   => Din  ,
      CS_n   => CS_n   ) ; 
      process  begin
        -------write test-------
        CS_n <= '0';
        RW_n <= '0';
        Adr <= "0010";
        Din <= "10101010";
        wait for 20 ns;
        Adr <= "0011";
        Din <= "11111111";
        wait for 20 ns;
        RW_n <= '1';
        OE <= '1';
        Adr <= "0010";
        wait for 20 ns;
        Adr <= "0011";
        wait;
      end process;
END ; 

