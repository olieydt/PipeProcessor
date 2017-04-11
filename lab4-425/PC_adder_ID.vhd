library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY PC_adder_ID IS 
	port(
		PC: in std_logic_vector(31 downto 0);
		immediate : in std_logic_vector(31 downto 0);
		adder_out: out std_logic_vector(31 downto 0)
	);
end PC_adder_ID;

ARCHITECTURE behavior OF PC_adder_ID IS 


BEGIN
--process(PC)
--begin
	adder_out <= std_logic_vector(signed(PC) + signed(immediate));
--end process;
end behavior;
