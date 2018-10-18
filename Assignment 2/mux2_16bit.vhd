library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_16bit is
    port (
        in0 : in std_logic_vector (15 downto 0);
        in1 : in std_logic_vector (15 downto 0);
        s : in std_logic;
        z : out std_logic_vector (15 downto 0)
    );
end mux2_16bit;

architecture Behavioral of mux2_16bit is

    constant gate_delay : time := 1 ns;

begin

    with s select
    z <= in0 after gate_delay when '0',
         in1 after gate_delay when '1',
         "UUUUUUUUUUUUUUUU" after gate_delay when others;

end Behavioral;