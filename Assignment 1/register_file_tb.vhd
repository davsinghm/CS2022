library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity register_file_tb is
end;

architecture testbench of register_file_tb is

	component register_file
		port (
			src_s0 : in std_logic;
			src_s1 : in std_logic;
			src_s2 : in std_logic;
			dest_a0 : in std_logic;
			dest_a1 : in std_logic;
			dest_a2 : in std_logic;
			clk : in std_logic;
			data_src : in std_logic;
			data : in std_logic_vector(15 downto 0);
			register0 : out std_logic_vector(15 downto 0);
			register1 : out std_logic_vector(15 downto 0);
			register2 : out std_logic_vector(15 downto 0);
			register3 : out std_logic_vector(15 downto 0);
			register4 : out std_logic_vector(15 downto 0);
			register5 : out std_logic_vector(15 downto 0);
			register6 : out std_logic_vector(15 downto 0);
			register7 : out std_logic_vector(15 downto 0)
		);
	end component;

	signal src_s0 : std_logic;
	signal src_s1 : std_logic;
	signal src_s2 : std_logic;
	signal dest_a0 : std_logic;
	signal dest_a1 : std_logic;
	signal dest_a2 : std_logic;
	signal clk : std_logic;
	signal data_src : std_logic;
	signal data : std_logic_vector(15 downto 0);
	signal register0 : std_logic_vector(15 downto 0);
	signal register1 : std_logic_vector(15 downto 0);
	signal register2 : std_logic_vector(15 downto 0);
	signal register3 : std_logic_vector(15 downto 0);
	signal register4 : std_logic_vector(15 downto 0);
	signal register5 : std_logic_vector(15 downto 0);
	signal register6 : std_logic_vector(15 downto 0);
	signal register7 : std_logic_vector(15 downto 0);

begin
	uut : register_file
	port map(
		src_s0 => src_s0, 
		src_s1 => src_s1, 
		src_s2 => src_s2, 
		dest_a0 => dest_a0, 
		dest_a1 => dest_a1, 
		dest_a2 => dest_a2, 
		clk => clk, 
		data_src => data_src, 
		data => data, 
		register0 => register0, 
		register1 => register1, 
		register2 => register2, 
		register3 => register3, 
		register4 => register4, 
		register5 => register5, 
		register6 => register6, 
		register7 => register7 
	);
	clk_prc : process
	begin
		clk <= '1';
		wait for 5 ns;

		clk <= '0';
		wait for 5 ns;

	end process;

	stimulus : process
	begin
		data_src <= '0';

		data <= x"AEBF";
		dest_a0 <= '0';
		dest_a1 <= '0';
		dest_a2 <= '0';
		wait for 10 ns;

		data <= x"BDDB";
		dest_a0 <= '1';
		dest_a1 <= '0';
		dest_a2 <= '0';
		wait for 10 ns;

		data <= x"FFFF";
		dest_a0 <= '0';
		dest_a1 <= '1';
		dest_a2 <= '0';
		wait for 10 ns;

		data <= x"0000";
		dest_a0 <= '1';
		dest_a1 <= '1';
		dest_a2 <= '0';
		wait for 10 ns;

		data <= x"BBCA";
		dest_a0 <= '0';
		dest_a1 <= '0';
		dest_a2 <= '1';
		wait for 10 ns;

		data <= x"BDDB";
		dest_a0 <= '1';
		dest_a1 <= '0';
		dest_a2 <= '1';
		wait for 10 ns;

		data <= x"1110";
		dest_a0 <= '0';
		dest_a1 <= '1';
		dest_a2 <= '1';
		wait for 10 ns;

		data <= x"1111";
		dest_a0 <= '1';
		dest_a1 <= '1';
		dest_a2 <= '1';
		wait for 10 ns;
		
		data_src <= '0';

		src_s0 <= '0';
		src_s1 <= '0';
		src_s2 <= '0';

		dest_a0 <= '1';
		dest_a1 <= '0';
		dest_a2 <= '0';
		wait for 10 ns;

		src_s0 <= '1';
		src_s1 <= '0';
		src_s2 <= '0';

		dest_a0 <= '0';
		dest_a1 <= '1';
		dest_a2 <= '0';
		wait for 10 ns;

		src_s0 <= '0';
		src_s1 <= '1';
		src_s2 <= '0';

		dest_a0 <= '1';
		dest_a1 <= '1';
		dest_a2 <= '0';
		wait for 10 ns;

		src_s0 <= '1';
		src_s1 <= '1';
		src_s2 <= '0';

		dest_a0 <= '0';
		dest_a1 <= '0';
		dest_a2 <= '1';
		wait for 10 ns;

		src_s0 <= '0';
		src_s1 <= '0';
		src_s2 <= '1';

		dest_a0 <= '1';
		dest_a1 <= '0';
		dest_a2 <= '1';
		wait for 10 ns;

		src_s0 <= '1';
		src_s1 <= '0';
		src_s2 <= '1';

		dest_a0 <= '0';
		dest_a1 <= '1';
		dest_a2 <= '1';
		wait for 10 ns;

		src_s0 <= '0';
		src_s1 <= '1';
		src_s2 <= '1';

		dest_a0 <= '1';
		dest_a1 <= '1';
		dest_a2 <= '1';
		wait for 10 ns;

		wait;
	end process;
end;