library IEEE;
use IEEE.std_logic_1164.ALL;

entity decoder_3to8_tb is
end;

architecture Behavioral of decoder_3to8_tb is

    constant delay : time := 10ns;

    component decoder_3to8
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
    end component;

    signal a : std_logic_vector(2 downto 0);
    signal q0, q1, q2, q3, q4, q5, q6, q7 : std_logic;

begin
    uut : decoder_3to8
        port map(
            a => a,
            q0 => q0, 
            q1 => q1, 
            q2 => q2, 
            q3 => q3, 
            q4 => q4, 
            q5 => q5, 
            q6 => q6, 
            q7 => q7 
        );

    sim : process
    begin

        wait for delay;
        a <= "000";

        wait for delay;
        a <= "001";

        wait for delay;
        a <= "010";

        wait for delay;
        a <= "011";

        wait for delay;
        a <= "100";

        wait for delay;
        a <= "101";

        wait for delay;
        a <= "110";

        wait for delay;
        a <= "111";

        wait;
    end process;

end;