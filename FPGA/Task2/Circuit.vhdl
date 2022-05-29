library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity CU is
port (
RST: in std_logic;
CLK: in std_logic;
disp_1, disp_2: out std_logic_vector (6 downto 0)
);
end CU;
architecture Behavioral of CU is
signal r_reg, r_next: unsigned (7 downto 0);
signal Counter_Out: std_logic_vector (7 downto 0);
signal BCD_1, BCD_2: std_logic_vector (3 downto 0);
begin
process (CLK, RST)
begin
if (RST = '1') then
r_reg <= (others => '0');
elsif (rising_edge(CLK)) then
if (r_reg < (255)) then
r_reg <= r_next;
else
r_reg <= (others => '0');
end if;
end if;
end process;
r_next <= r_reg + 1;
Counter_Out <= std_logic_vector(r_reg);
BCD_2 <= Counter_Out(3) & Counter_Out(2) & Counter_Out(1) & Counter_Out(0);
BCD_1 <= Counter_Out(7) & Counter_Out(6) & Counter_Out(5) & Counter_Out(4);
with BCD_2 select
disp_2 <= "1111110" when "0000",
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
with BCD_1 select
disp_1 <= "1111110" when "0000",
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