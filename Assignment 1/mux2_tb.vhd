library ieee;
use ieee.std_logic_1164.all;

entity mux2_tb is
end mux2_tb;

architecture testbench of mux2_tb is 
	component mux2
		port (
			in0 : in std_logic_vector (15 downto 0);
			in1 : in std_logic_vector (15 downto 0);
			s : in std_logic;
			z : out std_logic_vector (15 downto 0)
		);
	end component;
 
	signal in0 : std_logic_vector(15 downto 0) := (others => '0');
	signal in1 : std_logic_vector(15 downto 0) := (others => '0');
	signal s : std_logic;
	signal z : std_logic_vector(15 downto 0);

begin
	uut : mux2
	port map(
		in0 => in0, 
		in1 => in1, 
		s => s,
		z => z
	);

	stimulus : process
	begin
		in0 <= x"EEEE";
		in1 <= x"DDDD";

		s <= 'U';
		wait for 10 ns;
		s <= '0';
		wait for 10 ns;
		s <= '1';
		wait;
	end process;

end;