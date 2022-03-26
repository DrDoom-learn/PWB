library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MicroprogramController_tb is
end;

architecture bench of MicroprogramController_tb is

  component MicroprogramController
    Port ( 
  RESET: in std_logic;
  CLK: in std_logic;
  Address_In: in std_logic_vector ( 7 downto 0); Address_Out: out std_logic_vector ( 7 downto 0); 
  Instruction_In: in std_logic_vector (15 downto 0); 
  Constant_Out: out std_logic_vector ( 7 downto 0); 
  V,C,N,Z: in std_logic;
  DX,AX,BX,FS: out std_logic_vector( 3 downto 0); 
  MB,MD,RW,MM,MW: out std_logic);
  end component;

  signal RESET: std_logic;
  signal CLK: std_logic;
  signal Address_In: std_logic_vector ( 7 downto 0);
  signal Address_Out: std_logic_vector ( 7 downto 0);
  signal Instruction_In: std_logic_vector (15 downto 0);
  signal Constant_Out: std_logic_vector ( 7 downto 0);
  signal V,C,N,Z: std_logic;
  signal DX,AX,BX,FS: std_logic_vector( 3 downto 0);
  signal MB,MD,RW,MM,MW: std_logic;

-- Clock period definitions
   constant Clk_period : time := 1 ns;
begin

  uut: MicroprogramController port map ( RESET          => RESET,
                                         CLK            => CLK,
                                         Address_In     => Address_In,
                                         Address_Out    => Address_Out,
                                         Instruction_In => Instruction_In,
                                         Constant_Out   => Constant_Out,
                                         V              => V,
                                         C              => C,
                                         N              => N,
                                         Z              => Z,
                                         DX             => DX,
                                         AX             => AX,
                                         BX             => BX,
                                         FS             => FS,
                                         MB             => MB,
                                         MD             => MD,
                                         RW             => RW,
                                         MM             => MM,
                                         MW             => MW );

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
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;