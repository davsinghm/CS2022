library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_16bit is
    port (
        in0 : in std_logic_vector(15 downto 0);
        in1 : in std_logic_vector(15 downto 0);
        in2 : in std_logic_vector(15 downto 0);
        in3 : in std_logic_vector(15 downto 0);
        in4 : in std_logic_vector(15 downto 0);
        in5 : in std_logic_vector(15 downto 0);
        in6 : in std_logic_vector(15 downto 0);
        in7 : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(2 downto 0);
        z : out std_logic_vector(15 downto 0)
    );
end mux8_16bit;

architecture Behavioral of mux8_16bit is

    constant gate_delay : time := 1 ns;

begin

    with s select
    z <= in0 after gate_delay when "000",
         in1 after gate_delay when "001",
         in2 after gate_delay when "010",
         in3 after gate_delay when "011",
         in4 after gate_delay when "100",
         in5 after gate_delay when "101",
         in6 after gate_delay when "110",
         in7 after gate_delay when "111",
         "UUUUUUUUUUUUUUUU" after gate_delay when others;

end Behavioral;
