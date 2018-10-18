library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux2 is
	port (
		in0 : in std_logic_vector (15 downto 0);
		in1 : in std_logic_vector (15 downto 0);
		s : in std_logic;
		z : out std_logic_vector (15 downto 0)
	);
end mux2;

architecture behavioral of mux2 is
begin
	process (in0, in1, s)
	begin
		case s is
			when '0' => z <= in0;
			when '1' => z <= in1;
			when others => z <= "UUUUUUUUUUUUUUUU";
		end case;
	end process;
end behavioral;