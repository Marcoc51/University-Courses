--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:28:48 05/15/2022
-- Design Name:   
-- Module Name:   D:/New folder/hhh/testy.vhd
-- Project Name:  hhh
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: my_circ
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testy IS
END testy;
 
ARCHITECTURE behavior OF testy IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT my_circ
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         op_cel : IN  std_logic_vector(3 downto 0);
         c_in : IN  std_logic_vector(0 downto 0);
         Disp_0 : OUT  std_logic_vector(6 downto 0);
         Disp_1 : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal op_cel : std_logic_vector(3 downto 0) := (others => '0');
   signal c_in : std_logic_vector(0 downto 0) := (others => '0');

 	--Outputs
   signal Disp_0 : std_logic_vector(6 downto 0);
   signal Disp_1 : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: my_circ PORT MAP (
          A => A,
          B => B,
          op_cel => op_cel,
          c_in => c_in,
          Disp_0 => Disp_0,
          Disp_1 => Disp_1
        );

   -- Clock process definitions
   process
   begin
	A <= "00001010";
B <= "01010010";
c_in <= "1";

op_cel <= "0000";
wait for 100 ns;

op_cel <= "0001";
wait for 100 ns;

op_cel <= "0010";
wait for 100 ns;

op_cel <= "0011";
wait for 100 ns;

op_cel <= "0100";
wait for 100 ns;

op_cel <= "0101";
wait for 100 ns;

op_cel <= "0111";
wait for 100 ns;

op_cel <= "1000";
wait for 100 ns;

op_cel <= "1001";
wait for 100 ns;

   end process;
 

  

END;
