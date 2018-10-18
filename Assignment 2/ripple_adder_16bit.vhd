library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder_16bit is
    port (
        a : in std_logic_vector(15 downto 0);
        b : in std_logic_vector(15 downto 0);
        c_in : in std_logic;
        s : out std_logic_vector(15 downto 0);
        c_out : out std_logic;
        v : out std_logic
    );
end ripple_adder_16bit;

architecture Behavioral of ripple_adder_16bit is
    
    constant gate_level : time := 1 ns;
    
    signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16 : std_logic;

    component full_adder
        port (
            a, b : in std_logic;
            c_in : in std_logic;
            s : out std_logic;
            c_out : out std_logic
        );
    end component;
    
begin
    fa00: full_adder
        port map (
            a => a(0), b => b(0),
            c_in => c_in,
            s => s(0),
            c_out => c1
        );
    
    fa01: full_adder
        port map (
            a => a(1), b => b(1),
            c_in => c1,
            s => s(1),
            c_out => c2
        );
                
    fa02: full_adder
        port map (
            a => a(2), b => b(2),
            c_in => c2,
            s => s(2),
            c_out => c3
        );
        
    fa03: full_adder
        port map (
            a => a(3), b => b(3),
            c_in => c3,
            s => s(3),
            c_out => c4
        );
                                
    fa04: full_adder
        port map (
            a => a(4), b => b(4),
            c_in => c4,
            s => s(4),
            c_out => c5
        );
    
    fa05: full_adder
        port map (
            a => a(5), b => b(5),
            c_in => c5,
            s => s(5),
            c_out => c6
        );

    fa06: full_adder
        port map (
            a => a(6), b => b(6),
            c_in => c6,
            s => s(6),
            c_out => c7
        );

    fa07: full_adder
        port map (
            a => a(7), b => b(7),
            c_in => c7,
            s => s(7),
            c_out => c8
        );
        
    fa08: full_adder
        port map (
            a => a(8), b => b(8),
            c_in => c8,
            s => s(8),
            c_out => c9
        );
    fa09: full_adder
        port map (
            a => a(9), b => b(9),
            c_in => c9,
            s => s(9),
            c_out => c10
        );
        
    fa10: full_adder
        port map (
            a => a(10), b => b(10),
            c_in => c10,
            s => s(10),
            c_out => c11
        );
                    
    fa11: full_adder
        port map (
            a => a(11), b => b(11),
            c_in => c11,
            s => s(11),
            c_out => c12
        );
        
    fa12: full_adder
        port map (
            a => a(12), b => b(12),
            c_in => c12,
            s => s(12),
            c_out => c13
        );

    fa13: full_adder
        port map (
            a => a(13), b => b(13),
            c_in => c13,
            s => s(13),
            c_out => c14
        );
        
    fa14: full_adder
        port map (
            a => a(14), b => b(14),
            c_in => c14,
            s => s(14),
            c_out => c15
        );
            
    fa15: full_adder
        port map (
            a => a(15), b => b(15),
            c_in => c15,
            s => s(15),
            c_out => c16
        );
        
    c_out <= c16;
    v <= c15 xor c16;
        
end Behavioral;
