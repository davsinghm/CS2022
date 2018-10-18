library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file is
    port (
        write : in std_logic;
        d_address : in std_logic_vector(2 downto 0); -- dest address (dest register)
        a_address : in std_logic_vector(2 downto 0);
        b_address : in std_logic_vector(2 downto 0);
        d_data : in std_logic_vector(15 downto 0); -- dest data (dest register's data)
        a_data : out std_logic_vector(15 downto 0); -- data from register a
        b_data : out std_logic_vector(15 downto 0); -- data from register b
        clk : in std_logic
    );
end register_file;

architecture Behavioral of register_file is

    component reg16
        port (
            d : in std_logic_vector(15 downto 0);
            load : in std_logic;
            clk : in std_logic;
            q : out std_logic_vector(15 downto 0)
        );
    end component;

    component decoder_3to8
        port (
            a : in std_logic_vector(2 downto 0);
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

    component mux8_16_bit
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

    component mux8_16bit
        port (
            in0 : in std_logic_vector(15 downto 0);
            in1 : in std_logic_vector(15 downto 0);
            in2 : in std_logic_vector(15 downto 0);
            in3 : in std_logic_vector(15 downto 0);
            in4 : in std_logic_vector(15 downto 0);
            in5 : in std_logic_vector(15 downto 0);
            in6 : in std_logic_vector(15 downto 0);
            in7 : in std_logic_vector(15 downto 0);
            s : in std_logic_vector(2 downto 0);
            z : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal ld_reg0, ld_reg1, ld_reg2, ld_reg3, ld_reg4, ld_reg5, ld_reg6, ld_reg7 : std_logic;
    signal dec_q0, dec_q1, dec_q2, dec_q3, dec_q4, dec_q5, dec_q6, dec_q7 : std_logic;
    signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q : std_logic_vector(15 downto 0);

begin

    dest_dec : decoder_3to8
        port map(
            a => d_address, 
            q0 => dec_q0, 
            q1 => dec_q1, 
            q2 => dec_q2, 
            q3 => dec_q3, 
            q4 => dec_q4, 
            q5 => dec_q5, 
            q6 => dec_q6, 
            q7 => dec_q7
        );

    r0 : reg16
        port map(
            d => d_data, 
            load => ld_reg0, 
            clk => clk, 
            q => reg0_q
        );

    r1 : reg16
        port map(
            d => d_data, 
            load => ld_reg1, 
            clk => clk, 
            q => reg1_q
        );

    r2 : reg16
        port map(
            d => d_data, 
            load => ld_reg2, 
            clk => clk, 
            q => reg2_q
        );

    r3 : reg16
        port map(
            d => d_data, 
            load => ld_reg3, 
            clk => clk, 
            q => reg3_q
        );

    r4 : reg16
        port map(
            d => d_data, 
            load => ld_reg4, 
            clk => clk, 
            q => reg4_q
        );

    r5 : reg16
        port map(
            d => d_data, 
            load => ld_reg5, 
            clk => clk, 
            q => reg5_q
        );

    r6 : reg16
        port map(
            d => d_data, 
            load => ld_reg6, 
            clk => clk,
            q => reg6_q
        );

    r7 : reg16
        port map(
            d => d_data, 
            load => ld_reg7, 
            clk => clk, 
            q => reg7_q
        );

    mux8_a : mux8_16bit
        port map(
            in0 => reg0_q,
            in1 => reg1_q,
            in2 => reg2_q,
            in3 => reg3_q,
            in4 => reg4_q,
            in5 => reg5_q,
            in6 => reg6_q,
            in7 => reg7_q,
            s => a_address,
            z => a_data
        );

    mux8_b : mux8_16bit
        port map(
            in0 => reg0_q,
            in1 => reg1_q,
            in2 => reg2_q,
            in3 => reg3_q,
            in4 => reg4_q,
            in5 => reg5_q,
            in6 => reg6_q,
            in7 => reg7_q,
            s => b_address,
            z => b_data
        );
    
    ld_reg0 <= write and dec_q0;
    ld_reg1 <= write and dec_q1;
    ld_reg2 <= write and dec_q2;
    ld_reg3 <= write and dec_q3;
    ld_reg4 <= write and dec_q4;
    ld_reg5 <= write and dec_q5;
    ld_reg6 <= write and dec_q6;
    ld_reg7 <= write and dec_q7;

end Behavioral;
