library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_Control is
port(
  clock : in std_logic;
  op_code : in std_logic_vector(5 downto 0);
  funct : in std_logic_vector(5 downto 0);
  control : out std_logic_vector(4 downto 0)
);

end ALU_Control;

architecture arch of ALU_Control is

begin

process(clock)

begin
  
  if(rising_edge(clock)) then
    if((op_code = "000000" and funct = "100000") or op_code = "001000") then --ADD & ADDI
      control <= "00000";
    elsif(op_code = "000000" and funct = "100010") then --sub
      control <= "00001";
    elsif(op_code = "000000" and funct = "011000") then --mult
      control <= "00010";
    elsif(op_code = "000000" and funct = "011010") then --div
      control <= "00011";
    elsif((op_code = "000000" and funct = "100100") or op_code = "001100") then --and andi
      control <= "00100";
    elsif((op_code = "000000" and funct = "100101") or op_code = "001101") then --or ori
      control <= "00101";
    elsif(op_code = "000000" and funct = "100111") then --nor
      control <= "00110";
    elsif((op_code = "000000" and funct = "100110") or op_code = "001110") then --xor xori
      control <= "00111";
    elsif(op_code = "000000" and funct = "000000") then --shift left
      control <= "01000";
    elsif(op_code = "000000" and funct = "000010") then --shift right
      control <= "01001";
    elsif(op_code = "000000" and funct = "000011") then --shift arith
      control <= "01010";
      elsif(op_code = "000100") then --branch on equal
      control <= "01011";
      elsif(op_code = "000101") then --branch on not equal
      control <= "01100";
      elsif(op_code = "001010" and funct = "000011") then --set on less than (and immediate)
      control <= "01101";
    end if;
    
  end if; 
end process;

end arch;