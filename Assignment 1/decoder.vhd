library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity decoder is
	port (
		a0 : in std_logic;
		a1 : in std_logic;
		a2 : in std_logic;
		q0 : out std_logic;
		q1 : out std_logic;
		q2 : out std_logic;
		q3 : out std_logic;
		q4 : out std_logic;
		q5 : out std_logic;
		q6 : out std_logic;
		q7 : out std_logic
	);
end decoder;

architecture behavioral of decoder is
begin
	q0 <= ((not a0) and (not a1) and (not a2)) after 5ns;
	q1 <= ((not a0) and (not a1) and a2) after 5ns;
	q2 <= ((not a0) and a1 and (not a2)) after 5ns;
	q3 <= ((not a0) and a1 and a2) after 5ns;
	q4 <= (a0 and (not a1) and (not a2)) after 5ns;
	q5 <= (a0 and (not a1) and a2) after 5ns;
	q6 <= (a0 and a1 and (not a2)) after 5ns;
	q7 <= (a0 and a1 and a2) after 5ns;
end behavioral;