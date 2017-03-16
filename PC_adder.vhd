library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY PC_adder IS 
	port(
		PC: in std_logic_vector(31 downto 0);
		adder_out: out std_logic_vector(31 downto 0)
	);
end PC_adder;

ARCHITECTURE behavior OF PC_adder IS 

	signal next_t: std_logic_vector(31 downto 0) := "00000000000000000000000000000100";

BEGIN
process(PC)
begin
	adder_out <= std_logic_vector(unsigned(PC) + unsigned(next_t));
end process;
end behavior;
