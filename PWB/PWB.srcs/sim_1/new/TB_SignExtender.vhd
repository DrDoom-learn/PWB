----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2022 10:20:44
-- Design Name: 
-- Module Name: TB_SignExtender - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SignExtender_tb is
end;

architecture bench of SignExtender_tb is

  component SignExtender
  port (
  IR: in std_logic_vector (15 downto 0);
  Extended_8: out std_logic_vector ( 7 downto 0)
  );
  end component;

  signal IR: std_logic_vector (15 downto 0);
  signal Extended_8: std_logic_vector ( 7 downto 0) ;

begin

  uut: SignExtender port map ( IR         => IR,
                               Extended_8 => Extended_8 );

  stimulus: process
  begin
  
    IR <= "0000000001100000";
    wait for 10 ns;
    IR <= "0000000101001000";
    wait for 10 ns;

    wait;
  end process;


end;