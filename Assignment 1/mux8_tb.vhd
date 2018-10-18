library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux8_tb is
end;

architecture testbench of mux8_tb is

	component mux8
		port (
			in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic_vector(15 downto 0);
			s0, s1, s2 : in std_logic;
			z : out std_logic_vector(15 downto 0)
		);
	end component;

	signal in0, in1, in2, in3, in4, in5, in6, in7 : std_logic_vector(15 downto 0);
	signal s0, s1, s2 : std_logic;
	signal z : std_logic_vector(15 downto 0);

begin
	uut : mux8
	port map(
		in0 => in0, 
		in1 => in1, 
		in2 => in2, 
		in3 => in3, 
		in4 => in4, 
		in5 => in5, 
		in6 => in6, 
		in7 => in7, 
		s0 => s0, 
		s1 => s1, 
		s2 => s2, 
		z => z 
	);

	stimulus : process
	begin
		in0 <= x"FFFF";
		in1 <= x"EEEE";
		in2 <= x"DDDD";
		in3 <= x"CCCC";
		in4 <= x"BBBB";
		in5 <= x"AAAA";
		in6 <= x"9999";
		in7 <= x"8888";

		wait for 5 ns;
		s2 <= '0';
		s1 <= '0';
        s0 <= '0';
		wait for 5 ns; 
		s2 <= '0';
		s1 <= '0';
        s0 <= '1';
		wait for 5 ns; 
        s2 <= '0';
        s1 <= '1';
        s0 <= '0';
		wait for 5 ns; 
        s2 <= '0';
        s1 <= '1';
        s0 <= '1';
		wait for 5 ns; 
        s2 <= '1';
        s1 <= '0';
        s0 <= '0';
		wait for 5 ns; 
        s2 <= '1';
        s1 <= '0';
        s0 <= '1';
        wait for 5 ns; 
        s2 <= '1';
        s1 <= '1';
        s0 <= '0';
		wait for 5 ns; 
		s2 <= '1';
		s1 <= '1';
        s0 <= '1';
		wait;
	end process;
end;