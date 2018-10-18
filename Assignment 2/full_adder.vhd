library IEEE;
use IEEE.std_logic_1164.ALL;

entity full_adder is
    port (
        a, b : in std_logic;
        c_in : in std_logic;
        s : out std_logic;
        c_out : out std_logic
        );
end full_adder;

architecture Behavioral of full_adder is

    constant gate_delay : time := 1 ns;

begin

    s <= (a xor b) xor c_in after gate_delay;
    c_out <= ((a xor b) and c_in) or (a and b) after gate_delay;

end Behavioral;
