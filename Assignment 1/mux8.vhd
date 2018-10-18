library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux8 is
	port (
		in0 : in std_logic_vector (15 downto 0);
		in1 : in std_logic_vector (15 downto 0);
		in2 : in std_logic_vector (15 downto 0);
		in3 : in std_logic_vector (15 downto 0);
		in4 : in std_logic_vector (15 downto 0);
		in5 : in std_logic_vector (15 downto 0);
		in6 : in std_logic_vector (15 downto 0);
		in7 : in std_logic_vector (15 downto 0);
		s0, s1, s2 : in std_logic;
		z : out std_logic_vector (15 downto 0)
	);
end mux8;

architecture behavioral of mux8 is
begin
	z <= in0 after 5 ns when s2 = '0' and s1 = '0' and s0 = '0' else
	     in1 after 5 ns when s2 = '0' and s1 = '0' and s0 = '1' else
	     in2 after 5 ns when s2 = '0' and s1 = '1' and s0 = '0' else
	     in3 after 5 ns when s2 = '0' and s1 = '1' and s0 = '1' else
	     in4 after 5 ns when s2 = '1' and s1 = '0' and s0 = '0' else
	     in5 after 5 ns when s2 = '1' and s1 = '0' and s0 = '1' else
	     in6 after 5 ns when s2 = '1' and s1 = '1' and s0 = '0' else
	     in7 after 5 ns when s0 = '1' and s1 = '1' and s0 = '1' else
	     "UUUUUUUUUUUUUUUU" after 5 ns;
end behavioral;