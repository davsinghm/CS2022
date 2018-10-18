library IEEE;
use IEEE.std_logic_1164.ALL;

entity datapath is
    port (
        write : in std_logic;
        d_address : in std_logic_vector(2 downto 0);
        a_address : in std_logic_vector(2 downto 0);
        b_address : in std_logic_vector(2 downto 0);
        constant_in : in std_logic_vector(15 downto 0);
        mb_sel : in std_logic;
        data_in : in std_logic_vector(15 downto 0);
        md_sel : in std_logic;
        fs : in std_logic_vector(4 downto 0);
        clk : in std_logic;
        address_out : out std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0);
        v, c, n, z : out std_logic
    );
end datapath;

architecture Behavioral of datapath is

    component register_file
        port (
            write : in std_logic;
            d_address : in std_logic_vector(2 downto 0); -- dest address (dest register)
            a_address : in std_logic_vector(2 downto 0);
            b_address : in std_logic_vector(2 downto 0);
            d_data : in std_logic_vector(15 downto 0); -- dest data (dest register's data)
            a_data : out std_logic_vector(15 downto 0); -- data from register a
            b_data : out std_logic_vector(15 downto 0); -- data from register b
            clk : in std_logic
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

    component function_unit
        port (
            a, b : in std_logic_vector(15 downto 0);
            fs : in std_logic_vector(4 downto 0);
            f : out std_logic_vector(15 downto 0);
            v, c, n, z : out std_logic
        );
    end component;

    signal d_data, a_data, b_data : std_logic_vector(15 downto 0);
    signal mux_b_z : std_logic_vector(15 downto 0);
    signal f : std_logic_vector(15 downto 0);

begin

    rf : register_file
        port map (
            write => write,
            d_address => d_address,
            a_address => a_address,
            b_address => b_address,
            d_data => d_data,
            a_data => a_data,
            b_data => b_data,
            clk => clk
        );

    mux_b : mux2_16bit
        port map (
            in0 => b_data,
            in1 => constant_in,
            s => mb_sel,
            z => mux_b_z
        );

    fu : function_unit
        port map (
            a => a_data,
            b => mux_b_z,
            fs => fs,
            f => f,
            v => v,
            c => c,
            n => n,
            z => z
        );

    mux_d : mux2_16bit
        port map (
            in0 => f,
            in1 => data_in,
            s => md_sel,
            z => d_data
        );

    data_out <= mux_b_z;
    address_out <= a_data;

end Behavioral;
