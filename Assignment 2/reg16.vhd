library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg16 is
    port (
        d : in std_logic_vector(15 downto 0);
        load, clk : in std_logic;
        q : out std_logic_vector(15 downto 0)
    );

end reg16;

architecture Behavioral of reg16 is

    constant gate_delay : time := 1 ns;

begin

    process (clk)
    begin
        if (rising_edge(clk)) then
            if load = '1' then
                q <= d after gate_delay;
            end if;
        end if;
    end process;

end Behavioral;
