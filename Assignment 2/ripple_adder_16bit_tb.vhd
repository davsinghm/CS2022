library IEEE;
use IEEE.std_logic_1164.ALL;

entity ripple_adder_16bit_tb is
end ripple_adder_16bit_tb;
 
architecture Behavioral of ripple_adder_16bit_tb is 
    
    constant delay : time := 50 ns;
    
    component ripple_adder_16bit
        port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            c_in : in std_logic;
            s : out std_logic_vector(15 downto 0);
            c_out : out std_logic;
            v : out std_logic
        );
    end component;

    signal a : std_logic_vector(15 downto 0);
    signal b : std_logic_vector(15 downto 0);
    signal c_in : std_logic;

    signal s : std_logic_vector(15 downto 0);
    signal c_out : std_logic;
    signal v : std_logic;
 
begin
 
    uut: ripple_adder_16bit
        port map (
            a => a,
            b => b,
            c_in => c_in,
            s => s,
            c_out => c_out,
            v => v
        );

    sim : process

    begin

        wait for delay;

        a <= x"AAAA";
        b <= x"0000";
        c_in <= '0';

        wait for delay;
        a <= x"AAA0";
        b <= x"0000";
        c_in <= '1';

        wait for delay;
        a <= x"1100";
        b <= x"0001";
        c_in <= '0';
        
        wait for delay;
        a <= x"1100";
        b <= x"0001";
        c_in <= '1';
        
        wait for delay;
        a <= x"FFFE";
        b <= x"0001";
        c_in <= '1';

        wait;
   
   end process;

end;
