-- 4.18: flopr_sync
-- synchronously resettable flip flop
-- 
library IEEE; use IEEE.STD_LOGIC_1164.all;

entity flopr is -- flip-flop with synchronous reset
 generic(width: integer := 32);
 port(clk, reset: in STD_LOGIC;
 d: in STD_LOGIC_VECTOR(width-1 downto 0);
 q: out STD_LOGIC_VECTOR(width-1 downto 0));
end;


architecture synchronous of flopr is
begin
  process(clk) begin
    if rising_edge(clk) then
      if (reset= '1') then q <= X"00000000";
      else q <= d;
      end if;
    end if;
  end process;
end;
