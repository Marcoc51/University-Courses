----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:31:52 05/15/2022 
-- Design Name: 
-- Module Name:    des - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_circ is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           op_cel : in STD_LOGIC_VECTOR (3 downto 0);
           c_in : in STD_LOGIC_VECTOR (0 downto 0);
           Disp_0 : out STD_LOGIC_VECTOR (6 downto 0);
           Disp_1 : out STD_LOGIC_VECTOR (6 downto 0));
end my_circ;

architecture Behavioral of my_circ is
Signal result: STD_LOGIC_VECTOR (7 downto 0);
Signal bcd_0, bcd_1: std_logic_vector(3 downto 0);


begin

    With op_cel select
result <= std_logic_vector(unsigned(A) + unsigned(B)) when "0001",
                 std_logic_vector(unsigned(A) - unsigned(B))  when "0010",
                 A AND B  when "0011",
                 A OR B when "0100",
                 std_logic_vector(unsigned( NOT B) +1) when "0101",  
                 std_logic_vector(unsigned( NOT A) + 1) when "0111",
                 std_logic_vector(unsigned(A) + 1) when "1000",
                 A NOR B when "1001",
                 std_logic_vector(unsigned(A) + unsigned(B) + unsigned(c_in)) when "1010",
	     (others => '0') when others;
--  result <= "00110011";
bcd_1 <= result(7) & result(6) & result(5) & result(4);
bcd_0 <= result(3) & result(2) & result(1) & result(0);


with bcd_1 select
Disp_1 <= "1111110" when "0000",
        "0110000" when "0001", 
        "1101101" when "0010", 
        "1111001" when "0011", 
        "0110011" when "0100", 
        "1011011" when "0101", 
        "1011111" when "0110", 
        "1110000" when "0111", 
        "1111111" when "1000", 
        "1111011" when "1001", 
        "1111101" when "1010",
         "0011111" when "1011",
         "1001110" when "1100",
         "0111101" when "1101", 
         "1001111" when "1110", 
         "1000111" when "1111", 
        (others => '0') when others;
        
        
        with bcd_0 select
        Disp_0 <= "1111110" when "0000",
                "0110000" when "0001", 
                "1101101" when "0010", 
                "1111001" when "0011", 
                "0110011" when "0100", 
                "1011011" when "0101", 
                "1011111" when "0110", 
                "1110000" when "0111", 
                "1111111" when "1000", 
                "1111011" when "1001", 
                "1111101" when "1010",
               "0011111" when "1011",
                "1001110" when "1100",
                "0111101" when "1101", 
                "1001111" when "1110", 
                "1000111" when "1111", 
                (others => '0') when others;
        



end Behavioral;


