
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity MUXASYNC is
port(
	control : in std_logic_vector(1 downto 0);
	A : in std_logic_vector(31 downto 0);
	B : in std_logic_vector(31 downto 0);
	C : in std_logic_vector(31 downto 0);
	D : in std_logic_vector(31 downto 0);
	output : out std_logic_vector(31 downto 0)
);
end MUXASYNC;

architecture arch of MUXASYNC is

--signal control_t: std_logic;

begin

output <= A when control = "00" else
          
 	B when control = "01" else

	C when control = "10" else
	
	D when control = "11";
end arch;

