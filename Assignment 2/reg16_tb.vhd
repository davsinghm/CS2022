library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL; 
use IEEE.numeric_std.ALL;

entity reg16_tb is
end;

architecture Behavioral of reg16_tb is

    constant clock_period : time := 10 ns;
    constant clock_stop_delay : time := 50ns;

    component reg16
        port (
            d : in std_logic_vector(15 downto 0);
            load, clk : in std_logic;
            q : out std_logic_vector(15 downto 0)
        );
    end component;

    signal d : std_logic_vector(15 downto 0);
    signal load, clk : std_logic;
    signal q : std_logic_vector(15 downto 0);

    signal stop_clk : boolean;

begin

    uut : reg16
        port map (
            d => d, 
            load => load, 
            clk => clk, 
            q => q
        );

    sim : process
    begin

        d <= x"1010";
        load <= '1';
        wait for clock_stop_delay;
        stop_clk <= true;

        wait;

    end process;

    clock : process
    begin
        
        while not stop_clk
        loop
            clk <= '0', '1' after clock_period / 2;
            wait for clock_period;
        end loop;

        wait;
    
    end process;
end;