library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity alu is
 port(A, B: in STD_LOGIC_VECTOR(31 downto 0);
 F: in STD_LOGIC_VECTOR(2 downto 0);
 Y: out STD_LOGIC_VECTOR(31 downto 0));

end;
architecture synth of alu is
 signal S, Bout: STD_LOGIC_VECTOR(31 downto 0);
begin
 Bout <= (not B) when (F(2) = '1') else B;
 S <= A + Bout + F(2);
 process(A,B,F) begin
 case F(1 downto 0) is
 when "00" => Y <= A and Bout;
 when "01" => Y <= A or Bout;
 when "10" => Y <= S;
 when "11" => Y <=
 ("0000000000000000000000000000000" & S(31));
 when others => Y <= X"00000000";
 end case;
 end process;
 
end;