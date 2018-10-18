library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity reg is
	port (
		d : in std_logic_vector(15 downto 0);
		load, clk : in std_logic;
		q : out std_logic_vector(15 downto 0)
	);

end reg;

architecture behavioral of reg is

begin
	process (clk)
	begin
		if (rising_edge(clk)) then
			if load = '1' then
				q <= d after 5 ns;
			end if;
		end if;
	end process;

end behavioral;