LIBRARY ieee;
USE ieee.std_logic_1164.all;
use STD.textio.all; 
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;

entity mem_stage is 
port( 
	clock                  : in std_logic;
	addr                   : in std_logic_vector(31 downto 0);
	addr_out               : out std_logic_vector(31 downto 0);
	write_data             : in std_logic_vector(31 downto 0);
	mem_r                  : in std_logic;
	mem_w                  : in std_logic;
	mem_toReg              : in std_logic;
	zero                   : in std_logic;
	branch                 : in std_logic;
	mux_instrStage_control : out std_logic;
	mem_toReg_out          : out std_logic;
	selected_dest_mem      : in std_logic_vector(4 downto 0);
	selected_dest_mem_out  : out std_logic_vector(4 downto 0);	
	regWrite_mem           : in std_logic;
	regWrite_mem_out       : out std_logic;
	read_data              : out std_logic_vector(31 downto 0)
);
end mem_stage;

architecture behav of mem_stage is
	
COMPONENT memory IS
        GENERIC(
            ram_size : INTEGER := 32768
        );
        PORT (
            clock: IN STD_LOGIC;
            writedata: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            address: IN INTEGER RANGE 0 TO ram_size-1;
            memwrite: IN STD_LOGIC := '0';
            memread: IN STD_LOGIC := '0';
            readdata: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
            --waitrequest: OUT STD_LOGIC
        );
END COMPONENT;

signal m_addr, memwrite, memread: integer;
signal mem_write, mem_read: std_logic;
signal REG_readdata, readdata: STD_LOGIC_VECTOR (31 DOWNTO 0);
signal REG_addrout: STD_LOGIC_VECTOR (31 DOWNTO 0);
signal REG_mem_toRegout: std_logic;
signal REG_selected_dest_memout: STD_LOGIC_VECTOR (4 DOWNTO 0);
signal REG_regWrite_memout: std_logic;


BEGIN

m_addr <= to_integer(unsigned(addr));

mux_instrStage_control <= (zero and branch);

mem: memory port map (clock, write_data, m_addr, mem_w, mem_r, readdata);

process (clock)
begin
	if (mem_read='1') then 
		if (falling_edge(clock)) then
			REG_readdata <= readdata;
			REG_addrout <= addr;
			REG_mem_toRegout <= mem_toReg;
			REG_selected_dest_memout <= selected_dest_mem;
			REG_regWrite_memout <= regWrite_mem;
		elsif(rising_edge(clock)) then
			read_data <= REG_readdata;
			addr_out <= REG_addrout;
			mem_toReg_out <= REG_mem_toRegout;
			selected_dest_mem_out <= REG_selected_dest_memout;
			regWrite_mem_out <= REG_regWrite_memout;
		end if;
	end if;
END PROCESS;

END behav;