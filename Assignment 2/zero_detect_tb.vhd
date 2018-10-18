library IEEE;
use IEEE.std_logic_1164.ALL;

entity zero_detect_tb is
end zero_detect_tb;

architecture Behavioral of zero_detect_tb is

    constant delay : time := 10 ns;

    component zero_detect is
        Port ( 
            a : in std_logic_vector(15 downto 0);
            z : out std_logic
        );
    end component;
    
    signal a : std_logic_vector(15 downto 0):= x"0000";
    signal z : std_logic := '0';
        
begin

    uut: zero_detect
        port map (
            a => a,
            z => z
        );
    
    sim : process
    
    begin
        
        a <= x"AAAA";
        wait for delay;
        
        a <= x"0000";
        wait for delay;
        
        a <= x"BBBB";
        wait for delay;
        
        a <= x"0000";
        wait for delay;
        
        wait;
    
    end process;
    
end Behavioral;
