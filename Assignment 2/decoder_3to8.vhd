library IEEE;
use IEEE.std_logic_1164.ALL;

entity decoder_3to8 is
    port (
        a : in std_logic_vector(2 downto 0);
        q0 : out std_logic;
        q1 : out std_logic;
        q2 : out std_logic;
        q3 : out std_logic;
        q4 : out std_logic;
        q5 : out std_logic;
        q6 : out std_logic;
        q7 : out std_logic
    );
end decoder_3to8;

architecture Behavioral of decoder_3to8 is

    constant gate_delay : time := 1 ns;

begin

    q0 <= ((not a(2)) and (not a(1)) and (not a(0))) after gate_delay;
    q1 <= ((not a(2)) and (not a(1)) and      a(0))  after gate_delay;
    q2 <= ((not a(2)) and      a(1)  and (not a(0))) after gate_delay;
    q3 <= ((not a(2)) and      a(1)  and      a(0))  after gate_delay;
    q4 <=      (a(2)  and (not a(1)) and (not a(0))) after gate_delay;
    q5 <=      (a(2)  and (not a(1)) and      a(0))  after gate_delay;
    q6 <=      (a(2)  and      a(1)  and (not a(0))) after gate_delay;
    q7 <=      (a(2)  and      a(1)  and      a(0))  after gate_delay;

end Behavioral;