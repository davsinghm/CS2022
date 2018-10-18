library IEEE;
use IEEE.std_logic_1164.ALL;

entity function_unit_tb is
end;

architecture Behavioral of function_unit_tb is

    constant delay : time := 20 ns;

    component function_unit is
        port (
            a, b : in std_logic_vector(15 downto 0);
            fs : in std_logic_vector(4 downto 0);
            f : out std_logic_vector(15 downto 0);
            v, c, n, z : out std_logic
        );
    end component;
    
    signal a, b : std_logic_vector(15 downto 0);
    signal fs : std_logic_vector(4 downto 0);
    
    signal f : std_logic_vector(15 downto 0);
    signal v, c, n, z : std_logic;
        
begin

    uut: function_unit
        port map (
            a => a,
            b => b,
            fs => fs,
            f => f,
            v => v,
            c => c,
            n => n, 
            z => z
        );
    
    sim : process
    begin

        -- arithmetic
        fs <= "00000";
        a <= x"00AA";
        b <= x"00BB";
        wait for delay;
        
        fs <= "00001";
        a <= x"00AA";
        b <= x"00BB";
        wait for delay;
        
        fs <= "00010";
        a <= x"0002";
        b <= x"0001";
        wait for delay;
        
        fs <= "00011";
        a <= x"7FFE";
        b <= x"0001";
        wait for delay;
        
        fs <= "00100";
        a <= x"0001";
        b <= x"FFFC";
        wait for delay;
        
        fs <= "00101";
        a <= x"000F";
        b <= x"FFFE";
        wait for delay;
        
        fs <= "00110";
        a <= x"000A";
        b <= x"000B";
        wait for delay;
        
        fs <= "00111";
        a <= x"000A";
        b <= x"000B";
        wait for delay;
        
        -- logic
        fs <= "01000";
        a <= x"F0CF";
        b <= x"ABCD";
        wait for delay;
        
        fs <= "01010";
        a <= x"FF00";
        b <= x"A0EE";
        wait for delay;
        
        fs <= "01100";
        a <= x"FFFF";
        b <= x"ABCD";
        wait for delay;
        
        fs <= "01110";
        a <= x"AA11";
        b <= x"FFFF";
        wait for delay;
        
        -- shifter
        fs <= "10000";
        a <= x"000A";
        b <= x"000B";
        wait for delay;
        
        fs <= "10100";
        a <= x"000A";
        b <= x"000B";
        wait for delay;
        
        fs <= "11000";
        a <= x"000A";
        b <= x"000B";
        wait for delay;
     wait;
end process;
    
end Behavioral;
