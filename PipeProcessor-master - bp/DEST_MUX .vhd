library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DEST_MUX is
port(
	control : in std_logic;
	A : in std_logic_vector(4 downto 0);
	B : in std_logic_vector(4 downto 0);
	output : out std_logic_vector(4 downto 0)
);
end DEST_MUX;

architecture arch of DEST_MUX is

begin

  output <= A when control = '1' else
            B;

end arch;
