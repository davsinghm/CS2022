library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity reg_tb is
end;

architecture testbench of reg_tb is
	component reg
		port (
			d : in std_logic_vector(15 downto 0);
			load, clk : in std_logic;
			q : out std_logic_vector(15 downto 0)
		);
	end component;

	signal d : std_logic_vector(15 downto 0);
	signal load, clk : std_logic;
	signal q : std_logic_vector(15 downto 0);

	constant clock_period : time := 10 ns;
	signal stop_clk : boolean;

begin
	uut : reg
	port map(
		d => d, 
		load => load, 
		clk => clk, 
		q => q
	);

	stimulus : process
	begin
		d <= x"1010";
		load <= '1';
		wait for 100ns;
		stop_clk <= true;
		wait;
	end process;

	clocking : process
	begin
		while not stop_clk loop
		clk <= '0', '1' after clock_period / 2;
		wait for clock_period;
	end loop;
	wait;
	end process;
end;