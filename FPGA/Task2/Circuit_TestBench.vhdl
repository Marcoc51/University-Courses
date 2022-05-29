library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity BT is
end BT;
architecture behavioral of BT is
component CU
port (
RST: in std_logic;
CLK: in std_logic;
disp_1, disp_2: out std_logic_vector (6 downto 0)
);
end component;
signal RST_Test: std_logic;
signal CLK_Test: std_logic;
signal Disp1_Test, Disp2_Test: std_logic_vector (6 downto 0);
begin
uut: CU port map (
RST => RST_Test,
CLK => CLK_Test,
disp_1 => Disp1_Test,
disp_2 => Disp2_Test
);
clk_process: process
begin
CLK_Test <= '0';
wait for 100 ns;
CLK_Test <= '1';
wait for 100 ns;
end process;
stim_process: process
begin
RST_Test <= '1';
wait for 200 ns;
RST_Test <= '0';
wait;
end process;
end Behavioral;