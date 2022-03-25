library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity InstructionRegister_tb is
end;

architecture bench of InstructionRegister_tb is

  component InstructionRegister
  port (
  RESET: in std_logic;
  CLK: in std_logic;
  Instruction_In: in std_logic_vector (15 downto 0);
  IL: in std_logic;
  IR: out std_logic_vector (15 downto 0)
  );
  end component;

  signal RESET: std_logic;
  signal CLK: std_logic;
  signal Instruction_In: std_logic_vector (15 downto 0);
  signal IL: std_logic;
  signal IR: std_logic_vector (15 downto 0) ;

-- Clock period definitions
   constant Clk_period : time := 1 ns;

begin

  uut: InstructionRegister port map ( RESET          => RESET,
                                      CLK            => CLK,
                                      Instruction_In => Instruction_In,
                                      IL             => IL,
                                      IR             => IR );


-- Clock process definitions
   Clk_process: process
   begin
        clk <= '0';
        wait for Clk_period/2;
        clk <= '1';
        wait for Clk_period/2;
   end process;



  stimulus: process
  begin
  IL <= '0';
  Instruction_In <= x"0000";
  reset <= '1';
  wait for Clk_period;
  reset <= '0';
  wait for Clk_period;
  Instruction_In <= x"00FA";
  IL <= '1';
  wait for Clk_period;
  IL <= '0';
  wait for Clk_period;
  Reset <= '1';
  Wait for Clk_period;
  Reset <= '0';
  Wait for Clk_period;

    wait;
  end process;


end;
  