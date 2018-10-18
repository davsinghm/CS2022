library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_16bit_tb is
end mux2_16bit_tb;

architecture Behavioral of mux2_16bit_tb is 

    constant delay : time := 10 ns;
    
    component mux2_16bit
        port (
            in0 : in std_logic_vector(15 downto 0);
            in1 : in std_logic_vector(15 downto 0);
            s : in std_logic;
            z : out std_logic_vector(15 downto 0)
        );
    end component;
 
    signal in0 : std_logic_vector(15 downto 0) := x"EEEE";
    signal in1 : std_logic_vector(15 downto 0) := x"DDDD";
    signal s : std_logic := 'U';
    signal z : std_logic_vector(15 downto 0);

begin

    uut : mux2_16bit
        port map (
            in0 => in0, 
            in1 => in1, 
            s => s,
            z => z
        );

    sim : process

    begin
    
        wait for delay;
        s <= '0';
    
        wait for delay;
        s <= '1';
    
        wait;
    
    end process;

end;