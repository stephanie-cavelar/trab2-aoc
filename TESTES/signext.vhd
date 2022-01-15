-- signal extender

library IEEE; use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity signext is -- sign extender
 port(a: in STD_LOGIC_VECTOR(15 downto 0);
 y: out STD_LOGIC_VECTOR(31 downto 0));
end;
architecture behave of signext is
begin
 y <= X"ffff" & a when a(15)='1' else X"0000" & a;
end;
