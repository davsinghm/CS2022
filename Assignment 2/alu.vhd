library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
    port (
        a : in std_logic_vector(15 downto 0);
        b : in std_logic_vector(15 downto 0);
        c_in : in std_logic;
        g_sel : in std_logic_vector(2 downto 0);
        c_out : out std_logic;
        v : out std_logic;
        g : out std_logic_vector(15 downto 0)
    );
end alu;

architecture Behavioral of alu is

    constant delay : time := 1 ns;

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

    component logic_unit
        port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            s : in std_logic_vector(1 downto 0);
            z : out std_logic_vector(15 downto 0)
        );
    end component;

    component mux2_16bit
        port (
            in0 : in std_logic_vector (15 downto 0);
            in1 : in std_logic_vector (15 downto 0);
            s : in std_logic;
            z : out std_logic_vector (15 downto 0)
        );
    end component;

    signal y, arith_z, logic_z : std_logic_vector(15 downto 0);

begin

    ra : ripple_adder_16bit
        port map (
            a => a,
            b => y,
            c_in => c_in,
            s => arith_z,
            c_out => c_out,
            v => v
        );

    lu : logic_unit
        port map (
            a => a,
            b => b,
            s => g_sel(1 downto 0),
            z => logic_z
        );

    mux2: mux2_16bit
        port map (
            in0 => arith_z,
            in1 => logic_z,
            s => g_sel(2),
            z => g
        );
    
    with g_sel(1 downto 0) select
        y <= x"0000" after delay when "00",
                   b after delay when "01",
               not b after delay when "10",
             x"FFFF" after delay when "11",
             "UUUUUUUUUUUUUUUU" after delay when others;

end Behavioral;
