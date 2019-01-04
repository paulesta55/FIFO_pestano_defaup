-- de faup gregoire & estano paul

----------------------------------
--SEQ.vhd
----------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SEQ is
  generic (N : natural := 8  );
  port (ENW, reset, clk, ENR,REQ: in std_logic;
        Ack,CS_n,RW_n,OE,Selread,HL,incread,incwrite : out std_logic
  );
end  SEQ;

architecture Mealy of SEQ is
  type state_type is (Rest,R1,R2,W,WT);
    signal state : state_type;
    
begin
process(clk,reset) begin
  if reset = '1' then state <= Rest; Ack <= '1'; Selread <= '0'; OE <= '1'; RW_n <='1'; CS_n <= '1'; incread <= '0'; incwrite <= '0'; HL <= '0';
  end if;
  if clk'event then
    if clk='1' then
      
      case state is
      when Rest => Ack <='1';
      if ENR = '1' 
          then state <= R1; HL <= '1'; RW_n <= '1'; CS_n <= '0'; Selread <= '0'; incread <= '1'; OE <= '1';
      elsif ENW = '1' and Req = '0' 
         then state <= W; RW_n <= '0'; Selread <= '1';  CS_n <= '0'; incwrite <= '1';
     else state <= Rest;
     end if;
      when R1 => state <= Rest; HL <= '0'; OE <='0'; incread <= '1'; CS_n <= '1'; incread <='0';
      when W => Ack <='0'; incwrite <= '0'; CS_n <= '1'; state <= WT;
      when WT => incwrite <= '0' ; incread <= '0';
      if ENR = '1' 
        then state <= R2; HL <= '1'; RW_n <= '1'; CS_n <= '0'; Selread <= '0'; incread  <= '1'; OE <= '1';
      elsif Req ='1' 
        then state <= Rest; 
      else
        state <= WT;
    end if;
  when R2 => state <= WT; CS_n <= '1'; incread <= '0'; HL <= '0'; OE <= '0';
    
  
  end case;
end if;
end if;
end process;
end Mealy;

architecture Moore of seq is
  type state_type is (Rest,R1,R2,W,WT);
    signal state : state_type;
  begin
  process(clk, reset) begin
  if reset = '1' then state <= Rest; Ack <= '1'; Selread <= '0'; OE <= '1'; RW_n <='1'; CS_n <= '1'; incread <= '0'; incwrite <= '0'; HL <= '0';
  
  else 
  if clk'event and clk='1'then
   
      case state is
      when Rest => Ack <='1';OE<='0';incread <= '0'; incwrite <= '0'; HL<='0';CS_n<='1';
      if ENR = '1' 
          then state <= R1;
      elsif ENW = '1' and Req = '0' 
          then state <= W; 
      else state <= Rest;
       end if;
      when R1 => state <= Rest; HL <= '1'; OE <='1'; CS_n <= '0'; incread <='1'; Selread <= '0'; RW_n <= '1'; 
      when W => Ack <='0'; incwrite <= '1'; CS_n <= '0'; state <= WT; incread <= '0'; Selread <= '1'; RW_n <= '0';
      when WT => incwrite <= '0' ; incread <= '0'; CS_n <= '1'; HL<= '0'; OE <= '0';
      if ENR = '1' 
        then state <= R2; 
      elsif Req ='1' 
        then state <= Rest; 
      else
        state <= WT; 
    end if;
  when R2 => state <= WT; HL <= '1'; RW_n <= '1'; CS_n <= '0'; Selread <= '0'; incread  <= '1'; OE <= '1';
    end case;
end if;  
  end if;
  end process;
end Moore;