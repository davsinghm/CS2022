library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_unit is
    port (
        a : in std_logic_vector(15 downto 0);
        b : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(1 downto 0);
        z : out std_logic_vector(15 downto 0)
    );
end logic_unit;

architecture Behavioral of logic_unit is

    constant gate_delay : time := 1 ns;

begin
    
    with s select
    z <= (a and b) after gate_delay when "00",
         (a or b)  after gate_delay when "01",
         (a xor b) after gate_delay when "10",
         (not a)   after gate_delay when others;

end Behavioral;
