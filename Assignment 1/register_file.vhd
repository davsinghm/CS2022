library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity register_file is
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
end register_file;

architecture behavioral of register_file is

	component reg
		port (
			d : in std_logic_vector(15 downto 0);
			load : in std_logic;
			clk : in std_logic;
			q : out std_logic_vector(15 downto 0)
		);
	end component;

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

	component mux8
		port (
			in0 : in std_logic_vector(15 downto 0);
			in1 : in std_logic_vector(15 downto 0);
			in2 : in std_logic_vector(15 downto 0);
			in3 : in std_logic_vector(15 downto 0);
			in4 : in std_logic_vector(15 downto 0);
			in5 : in std_logic_vector(15 downto 0);
			in6 : in std_logic_vector(15 downto 0);
			in7 : in std_logic_vector(15 downto 0);
			s0, s1, s2 : in std_logic;
			z : out std_logic_vector(15 downto 0)
		);
	end component;

	component mux2
		port (
			in0 : in std_logic_vector (15 downto 0);
			in1 : in std_logic_vector (15 downto 0);
			s : in std_logic;
			z : out std_logic_vector (15 downto 0)
		);
	end component;
	signal ld_register0, ld_register1, ld_register2, ld_register3, ld_register4, ld_register5, ld_register6, ld_register7 : std_logic;
	signal register0_q, register1_q, register2_q, register3_q, register4_q, register5_q, register6_q, register7_q,
	data_src_mux_out, src_reg : std_logic_vector(15 downto 0);
begin

	register_0 : reg
	port map(
		d => data_src_mux_out, 
		load => ld_register0, 
		clk => clk, 
		q => register0_q
	);

	register_1 : reg
	port map(
		d => data_src_mux_out, 
		load => ld_register1, 
		clk => clk, 
		q => register1_q
	);

	register_2 : reg
	port map(
		d => data_src_mux_out, 
		load => ld_register2, 
		clk => clk, 
		q => register2_q
	);

	register_3 : reg
	port map(
		d => data_src_mux_out, 
		load => ld_register3, 
		clk => clk, 
		q => register3_q
	);

	register_4 : reg
	port map(
		d => data_src_mux_out, 
		load => ld_register4, 
		clk => clk, 
		q => register4_q
	);

	register_5 : reg
	port map(
		d => data_src_mux_out, 
		load => ld_register5, 
		clk => clk, 
		q => register5_q
	);

	register_6 : reg
	port map(
		d => data_src_mux_out, 
		load => ld_register6, 
		clk => clk, 
		q => register6_q
	);

	register_7 : reg
	port map(
		d => data_src_mux_out, 
		load => ld_register7, 
		clk => clk, 
		q => register7_q
	);

	dest_decoder : decoder
	port map(
		a0 => dest_A0, 
		a1 => dest_A1, 
		a2 => dest_A2, 
		q0 => ld_register0, 
		q1 => ld_register1, 
		q2 => ld_register2, 
		q3 => ld_register3, 
		q4 => ld_register4, 
		q5 => ld_register5, 
		q6 => ld_register6, 
		q7 => ld_register7
	);

	data_src_mux2 : mux2
	port map(
		in0 => data, 
		in1 => src_reg,
		s => data_src,
		z => data_src_mux_out
	);

	inst_mux8 : mux8
	port map(
		in0 => register0_q, 
		in1 => register1_q, 
		in2 => register2_q, 
		in3 => register3_q, 
		in4 => register4_q, 
		in5 => register5_q, 
		in6 => register6_q, 
		in7 => register7_q, 
		s0 => src_s0, 
		s1 => src_s1, 
		s2 => src_s2, 
		z => src_reg
	);
	
	register0 <= register0_q;
	register1 <= register1_q;
	register2 <= register2_q;
	register3 <= register3_q;
	register4 <= register4_q;
	register5 <= register5_q;
	register6 <= register6_q;
	register7 <= register7_q;
end behavioral;