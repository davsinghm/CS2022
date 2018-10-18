library IEEE;
use IEEE.std_logic_1164.ALL;

entity register_file_tb is
end register_file_tb;

architecture Behavioral of register_file_tb is

    constant delay : time := 10 ns;
    constant clk_period : time := 2 ns;

    component register_file is
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
    end component;

    signal write : std_logic := '0';
    signal d_address : std_logic_vector(2 downto 0) := "000";
    signal a_address : std_logic_vector(2 downto 0) := "000";
    signal b_address : std_logic_vector(2 downto 0) := "000";
    signal d_data : std_logic_vector(15 downto 0) := x"0000";
    
    signal a_data : std_logic_vector(15 downto 0) := x"0000";
    signal b_data : std_logic_vector(15 downto 0) := x"0000";
    signal clk : std_logic;

begin

    uut: register_file
        port map (
            write => write,
            d_address => d_address,
            a_address => a_address,
            b_address => b_address,
            d_data => d_data,
            a_data => a_data,
            b_data => b_data,
            clk => clk
        );

    clock : process
    begin
        clk <= '0';
        wait for clk_period / 2;

        clk <= '1';
        wait for clk_period / 2;

    end process;
    
    sim :process
    begin

        wait for delay;

        write <= '1';

        wait for delay;
        d_address <= "000";
        d_data <= x"AAAA";

        wait for delay;
        d_address <= "001";
        d_data <= x"BBBB";

        wait for delay;
        d_address <= "010";
        d_data <= x"CCCC";

        wait for delay;
        d_address <= "011";
        d_data <= x"DDDD";

        wait for delay;
        d_address <= "100";
        d_data <= x"EEEE";

        wait for delay;
        d_address <= "101";
        d_data <= x"9999";

        wait for delay;
        d_address <= "110";
        d_data <= x"8888";

        wait for delay;
        d_address <= "111";
        d_data <= x"7777";
        
        wait for delay;
        a_address <= "000";
        b_address <= "001";
        
        wait for delay;
        a_address <= "010";
        b_address <= "011";

        wait for delay;
        a_address <= "100";
        b_address <= "101";

        wait for delay;
        a_address <= "110";
        b_address <= "111";

        wait;
    
    end process;
    
end Behavioral;