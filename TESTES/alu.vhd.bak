-- alu - An arithmetic Logic Unit
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
    generic (
        W       :       integer := 32
    );
    port (
        CONTROL : in    std_logic_vector(3 downto 0);
        SRC1    : in    std_logic_vector(W - 1 downto 0);
        SRC2    : in    std_logic_vector(W - 1 downto 0);
        RESULT  : out   std_logic_vector(W - 1 downto 0);
        ZERO    : out   std_logic
    );
end ALU;

-- Define the architecture for this entity.
-- Consider the following operations to calculate the value or RESULT:
--      CONTROL             RESULT
--      0000                SRC1 and SRC2 
--      0001                SRC1 or SRC2
--      0010                SRC1 + SRC2
--      0110                SRC1 - SRC2
--      0111                SRC1 < SRC2 ? 1 : 0
--      1100                NOT( SRC1 or SRC2 )

architecture arch of ALU is

signal SRESULT : std_logic_vector(W - 1 downto 0);
begin
	  ZERO <= '1' when SRESULT(W-1 downto 0) = x"00000000" else '0'; 
	 
	 process(CONTROL, SRC1, SRC2)
	 begin
	 case(CONTROL) is
	 when "0000" => SRESULT <= SRC1 AND SRC2;	 
	 when "0001" => SRESULT <= SRC1 OR SRC2;	 
	 when "0010" => SRESULT <= SRC1 + SRC2;	 
	 when "0011" => SRESULT <= SRC1 - SRC2;	 
	 when "0100" => if (SRC1 < SRC2) then SRESULT <= x"00000001";
						 else 					SRESULT <= x"00000000";
						 end if;
	 
	 
	 when others --"0101"
	 => SRESULT <= NOT(SRC1 OR SRC2);
	 
	 --when others => 
	 
	 end case;
	 
	 end process;
	 
	 RESULT <= SRESULT;
	 
end arch;