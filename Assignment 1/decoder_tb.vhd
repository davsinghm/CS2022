library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity decoder_tb is
end;

architecture testbench of decoder_tb is

	component decoder
		port (
			a0 : in std_logic;
			a1 : in std_logic;
			a2 : in std_logic;
			q0 : out std_logic;
			q1 : out std_logic;
			q2 : out std_logic;
			q3 : out std_logic;
			q4 : out std_logic;
			q5 : out std_logic;
			q6 : out std_logic;
			q7 : out std_logic
		);
	end component;

	signal a0 : std_logic;
	signal a1 : std_logic;
	signal a2 : std_logic;
	signal q0 : std_logic;
	signal q1 : std_logic;
	signal q2 : std_logic;
	signal q3 : std_logic;
	signal q4 : std_logic;
	signal q5 : std_logic;
	signal q6 : std_logic;
	signal q7 : std_logic;

begin
	uut : decoder
	port map(
		a0 => a0, 
		a1 => a1, 
		a2 => a2, 
		q0 => q0, 
		q1 => q1, 
		q2 => q2, 
		q3 => q3, 
		q4 => q4, 
		q5 => q5, 
		q6 => q6, 
		q7 => q7 
	);

	stimulus : process
	begin
		-- Put initialisation code here
		wait for 10 ns; 
		A0 <= '0';
		A1 <= '0';
		A2 <= '0';
		wait for 10 ns; 
 
		A0 <= '1';
		A1 <= '0';
		A2 <= '0';
 
		wait for 10 ns; 
		A0 <= '0';
		A1 <= '1';
		A2 <= '0';
 
		wait for 10 ns; 
		A0 <= '1';
		A1 <= '1';
		A2 <= '0';
 
		wait for 10 ns; 
		A0 <= '0';
		A1 <= '0';
		A2 <= '1';
 
		wait for 10 ns; 
		A0 <= '1';
		A1 <= '0';
		A2 <= '1';
 
		wait for 10 ns; 
		A0 <= '0';
		A1 <= '1';
		A2 <= '1';
 
		wait for 10 ns; 
		A0 <= '1';
		A1 <= '1';
		A2 <= '1';

		wait;
	end process;
end;