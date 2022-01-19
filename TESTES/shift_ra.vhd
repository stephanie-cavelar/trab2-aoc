library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- Needed for shifts

entity shift_ra is
  port(
		 a: in std_logic_vector(31 downto 0);
		 n: in std_logic_vector(5 downto 0);
		 y: out std_logic_vector(31 downto 0)
		);
end ;
 
architecture behave of shift_ra is
begin
	
	y   <= std_logic_vector(shift_right(signed(a), to_integer(signed(n))));

end architecture behave;

