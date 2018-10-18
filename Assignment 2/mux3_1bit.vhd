library IEEE;
use IEEE.std_logic_1164.ALL;

entity mux3_1bit is
    port (
        in0 : in std_logic;
        in1 : in std_logic;
        in2 : in std_logic;
        s : in std_logic_vector(1 downto 0);
        z : out std_logic
    );
end mux3_1bit;

architecture Behavioral of mux3_1bit is

    constant gate_delay : time := 1 ns;

begin

    with s select
    z <=  in0 after gate_delay when "00",
          in1 after gate_delay when "01",
          in2 after gate_delay when "10",
          'U' after gate_delay when others;

end Behavioral;