library IEEE;
use IEEE.std_logic_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is

    constant delay : time := 10 ns;

    component full_adder
        port (
            a, b : in std_logic;
            c_in : in std_logic;
            s : out std_logic;
            c_out : out std_logic
        );
    end component;

    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal c_in : std_logic := '0';

    signal s : std_logic;
    signal c_out : std_logic;

begin

    uut : full_adder
        port map (
            a => a,
            b => b,
            c_in => c_in,
            s => s,
            c_out => c_out
        );

    sim : process

    begin

        wait for delay;
        a <= '0';
        b <= '0';
        c_in <= '1';

        wait for delay;
        a <= '0';
        b <= '1';
        c_in <= '0';

        wait for delay;
        a <= '0';
        b <= '1';
        c_in <= '1';

        wait for delay;
        a <= '1';
        b <= '0';
        c_in <= '0';

        wait for delay;
        a <= '1';
        b <= '0';
        c_in <= '1';

        wait for delay;
        a <= '1';
        b <= '1';
        c_in <= '0';

        wait for delay;
        a <= '1';
        b <= '1';
        c_in <= '1';
        
        wait;

    end process;

end Behavioral;
