library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_detect is
    port (
        a : in std_logic_vector(15 downto 0);
        z : out std_logic
    );
end zero_detect;

architecture Behavioral of zero_detect is

    constant gate_delay : time := 1 ns;

begin

    z <= not (a(15) or a(14) or a(13) or a(12) or a(11) or a(10)
                    or a(9)  or a(8)  or a(7)  or a(6)  or a(5)
                    or a(4)  or a(3)  or a(2)  or a(1)  or a(0)) after gate_delay;

end Behavioral;
