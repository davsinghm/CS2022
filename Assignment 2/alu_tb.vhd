library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_tb is
end;

architecture Behavioral of alu_tb is

    constant delay : time := 20 ns;

    component alu is
        port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            c_in : in std_logic;
            g_sel : in std_logic_vector(2 downto 0);
            c_out : out std_logic;
            v : out std_logic;
            g : out std_logic_vector(15 downto 0)
        );
    end component;

    signal a : std_logic_vector(15 downto 0);
    signal b : std_logic_vector(15 downto 0);
    signal c_in : std_logic;
    signal g_sel : std_logic_vector(2 downto 0);

    signal c_out : std_logic;
    signal v : std_logic;
    signal g : std_logic_vector(15 downto 0);
        
begin

    uut: alu
        port map (
            a => a,
            b => b,
            c_in => c_in,
            g_sel => g_sel,
            c_out => c_out,
            v => v,
            g => g
        );

    sim : process
    begin
        
        a <= x"FFAA";
        b <= x"000F";
        g_sel <= "000";
        c_in <= '0';
        
        wait for delay;
        g_sel <= "000";
        c_in <= '1';
        
        wait for delay;
        g_sel <= "001";
        c_in <= '0';
                
        wait for delay;
        g_sel <= "001";
        c_in <= '1';
        
        wait for delay;
        g_sel <= "010";
        c_in <= '0';

        wait for delay;
        g_sel <= "010";
        c_in <= '1';

        wait for delay;
        g_sel <= "011";
        c_in <= '0';

        wait for delay;
        g_sel <= "011";
        c_in <= '1';
        
        wait for delay;
        g_sel <= "100";
        c_in <= '0';

        wait for delay;
        g_sel <= "101";

        wait for delay;
        g_sel <= "110";

        wait for delay;
        g_sel <= "111";

        wait;
       
end process;
    
end Behavioral;