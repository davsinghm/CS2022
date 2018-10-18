library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity function_unit is
    port (
        a, b : in std_logic_vector(15 downto 0);
        fs : in std_logic_vector(4 downto 0);
        f : out std_logic_vector(15 downto 0);
        v, c, n, z : out std_logic
    );
end function_unit;

architecture Behavioral of function_unit is

    component alu
        port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            c_in : in std_logic;
            g_sel : in std_logic_vector(2 downto 0);
            c_out : out std_logic;
            v : out std_logic;
            g : out std_logic_vector(15 downto 0)
        );
    end component;

    component shifter
        port (
            b : in std_logic_vector(15 downto 0);
            s : in std_logic_vector(1 downto 0);
            il, ir : in std_logic;
            h : out std_logic_vector(15 downto 0)
        );
    end component;

    component mux2_16bit
        port (
            in0, in1 : in std_logic_vector(15 downto 0);
            s : in std_logic;
            z : out std_logic_vector(15 downto 0)
        );
    end component;

    component zero_detect
        port (
            a : in std_logic_vector(15 downto 0);
            z : out std_logic
        );
    end component;

    signal g, h : std_logic_vector(15 downto 0);

begin

    al : alu
        port map (
            a => a,
            b => b,
            c_in => fs(0),
            g_sel => fs(3 downto 1),
            c_out => c,
            v => v,
            g => g
        );

    ls : shifter
        port map (
            b => b,
            s => fs(3 downto 2),
            il => '0',
            ir => '0',
            h => h
        );

    mux_mf: mux2_16bit
        port map (
            in0 => g,
            in1 => h,
            s => fs(4),
            z => f
        );

    zd: zero_detect
        port map (
            a => g,
            z => z
        );

    n <= g(15);

end Behavioral;
