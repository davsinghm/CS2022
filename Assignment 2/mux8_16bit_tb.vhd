library IEEE;
use IEEE.std_logic_1164.ALL;

entity mux8_16bit_tb is
end;

architecture Behavioral of mux8_16bit_tb is

    constant delay : time := 10 ns;

    component mux8_16bit
        port (
            in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic_vector(15 downto 0);
            s : in std_logic_vector(2 downto 0);
            z : out std_logic_vector(15 downto 0)
        );
    end component;

    signal in0 : std_logic_vector(15 downto 0) := x"AAAA";
    signal in1 : std_logic_vector(15 downto 0) := x"BBBB";
    signal in2 : std_logic_vector(15 downto 0) := x"CCCC";
    signal in3 : std_logic_vector(15 downto 0) := x"DDDD";
    signal in4 : std_logic_vector(15 downto 0) := x"EEEE";
    signal in5 : std_logic_vector(15 downto 0) := x"FFFF";
    signal in6 : std_logic_vector(15 downto 0) := x"9999";
    signal in7 : std_logic_vector(15 downto 0) := x"8888";
    signal s : std_logic_vector(2 downto 0);
    signal z : std_logic_vector(15 downto 0);

begin

    uut : mux8_16bit
        port map(
            in0 => in0, 
            in1 => in1, 
            in2 => in2, 
            in3 => in3, 
            in4 => in4, 
            in5 => in5, 
            in6 => in6, 
            in7 => in7, 
            s => s, 
            z => z 
        );

    sim : process

    begin

        wait for delay;
        s <= "000";

        wait for delay;
        s <= "001";
        
        wait for delay;
        s <= "010";
        
        wait for delay;
        s <= "011";
        
        wait for delay;
        s <= "100";
        
        wait for delay;
        s <= "101";
        
        wait for delay;
        s <= "110";
        
        wait for delay;
        s <= "111";
        
        wait;

    end process;

end;