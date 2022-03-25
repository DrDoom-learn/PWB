----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2022 11:01:44
-- Design Name: 
-- Module Name: MicroprogramController - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MicroprogramController is
  Port ( 
RESET: in std_logic;
CLK: in std_logic;
Address_In: in std_logic_vector ( 7 downto 0); Address_Out: out std_logic_vector ( 7 downto 0); 
Instruction_In: in std_logic_vector (15 downto 0); 
Constant_Out: out std_logic_vector ( 7 downto 0); 
V,C,N,Z: in std_logic;
DX,AX,BX,FS: out std_logic_vector( 3 downto 0); 
MB,MD,RW,MM,MW: out std_logic);
end MicroprogramController;

architecture Behavioral of MicroprogramController is

signal ILsig: std_logic;
signal PSsig: std_logic_vector(1 downto 0);
signal Offsetsig: std_logic_vector(7 downto 0);
signal  IRsig: std_logic_vector (15 downto 0);


component ProgramCounter is
    Port(
    RESET: in std_logic;
    CLK: in std_logic;
    Address_In: in std_logic_vector (7 downto 0);
    PS: in std_logic_vector (1 downto 0);
    Offset: in std_logic_vector (7 downto 0);
    PC: out std_logic_vector (7 downto 0));
end component;

component InstructionRegister is
Port(
    RESET: in std_logic;
    CLK: in std_logic;
    Instruction_In: in std_logic_vector (15 downto 0);
    IL: in std_logic;
    IR: out std_logic_vector (15 downto 0)
);
end component;

component Instruction_Decoder is
Port(
    RESET: in std_logic;
    CLK: in std_logic;
    IR: in std_logic_vector (15 downto 0);
    V,C,N,Z: in std_logic;
    PS: out std_logic_vector ( 1 downto 0);
    IL: out std_logic;
    DX,AX,BX,FS: out std_logic_vector ( 3 downto 0);
    MB,MD,RW,MM,MW: out std_logic
    );
end component;

component SignExtender is
Port(
    IR: in std_logic_vector (15 downto 0);
    Extended_8: out std_logic_vector ( 7 downto 0)
);
end component;

component ZeroFiller is
Port(
    IR: in std_logic_vector (15 downto 0); 
    ZeroFilled_8: out std_logic_vector ( 7 downto 0)
    );
end component;

begin

PC: ProgramCounter PORT MAP(RESET => RESET,CLK => CLK, Address_In => Address_In,PS => PSsig,Offset => Offsetsig, PC => Address_Out );
ID: Instruction_Decoder PORT MAP(RESET => RESET, CLK => CLK, IR => IRsig, V => V, C => C, N => N, Z => Z, PS => PSsig, IL => ILsig,DX => DX,AX => AX,BX => BX,FS => FS,MB => MB,MD => MD,RW => RW,MM => MM,MW => MW);
IR: InstructionRegister PORT MAP(RESET => RESET, CLK => CLK, Instruction_In => Instruction_In, IL => ILsig, IR => IRsig);
SignExt: SignExtender PORT MAP(IR => IRsig, Extended_8 => Offsetsig);
ZF: ZeroFiller PORT MAP(IR => IRsig ,ZeroFilled_8 => Constant_out);

end Behavioral;



