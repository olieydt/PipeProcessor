

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.pkg.all;

entity registers_lib is
	port (
		clock : in std_logic;
		rd1 : out std_logic_vector(31 downto 0);
		rd2 : out std_logic_vector(31 downto 0);
		rr1 : in std_logic_vector(4 downto 0);
		rr2 : in std_logic_vector(4 downto 0);
		--alu_lh_w : in std_logic;

		--alu_lo_in : in std_logic_vector(31 downto 0);
		--alu_hi_in : in std_logic_vector(31 downto 0);

		writeEnable : in std_logic;
		wr : in std_logic_vector(4 downto 0);
		register_array : out registers(0 to 33);
		wd : in std_logic_vector(31 downto 0)
		--alu_hi_out : out std_logic_vector(31 downto 0);
		--alu_lo_out : out std_logic_vector(31 downto 0);
		--clock : in std_logic
	);
end registers_lib;

architecture behavioral of registers_lib is 
	--type registers is array(0 to 33) of std_logic_vector(31 downto 0);
	signal reg : registers(0 to 33) := ((others=> (others=>'0')));
	signal rd1_t, rd2_t, alu_lo_out_t, alu_hi_out_t : std_logic_vector(31 downto 0);
	--signal clock : std_logic;
begin

--rd1 <= rd1_t;
--rd2 <= rd2_t;
--alu_lo_out <= alu_lo_out_t;
--alu_hi_out <= alu_hi_out_t;
	process(clock)

	begin
		--wait for active clock edge
		--register 0 is hardwired to 0
		--if (clock'event and clock = '1') then
			if(falling_edge(clock)) then
				rd1 <= reg(to_integer(unsigned(rr1)));
				rd2 <= reg(to_integer(unsigned(rr2)));
				register_array <= reg;
			--alu_lo_out_t <= reg(32);
			--alu_hi_out_t <= reg(33);

			elsif (writeEnable = '1' and to_integer(unsigned(wr)) /= 0 and rising_edge(clock)) then
				reg(to_integer(unsigned(wr))) <= wd;
				--if(to_integer(unsigned(rr1)) = to_integer(unsigned(wr))) then
				--	rd1 <= wd;
					--rd1 <= reg(to_integer(unsigned(rr1)));
				--else
				--	rd1 <= reg(to_integer(unsigned(rr1)));
				--end if;
				--if(to_integer(unsigned(rr2)) = to_integer(unsigned(wr))) then
				--	rd2 <= wd;
					--rd2 <= reg(to_integer(unsigned(rr2)));
				--else
				--	rd2 <= reg(to_integer(unsigned(rr2)));
				--end if;
				--
			end if;
				--if rr1 = wr then
					--rd1_t <= wd;
				--end if;
				
				--if rr2 = wr then
					--rd2_t <= wd;
				--end if;


				--if alu_lh_w = '1' then
				--	reg(32) <= alu_lo_in;
				--	reg(33) <= alu_hi_in;
				--end if;
		--end if;
	end process;
end behavioral;
