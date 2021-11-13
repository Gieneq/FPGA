----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:12 11/12/2021 
-- Design Name: 
-- Module Name:    muliplexer_4_1A - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity muliplexer_4_1A is

Port ( 
       Switch   : in STD_LOGIC_VECTOR(3 downto 0);
	    LED      : out STD_LOGIC_VECTOR(7 downto 0);
		 DPSwitch : in STD_LOGIC_VECTOR(1 downto 0)
);

end muliplexer_4_1A;

architecture Behavioral of muliplexer_4_1A is

begin

LED(0) <= (not Switch(0)) and (not Switch(1));
with szyna_buf_adresow select
	LED(0) <= szyna_buf_wejsc(0) when "00",
				 szyna_buf_wejsc(1) when "01",
				 szyna_buf_wejsc(2) when "10",
				 szyna_buf_wejsc(3) when others;
				 
--	szyna_buf_wejsc <= not Switch;
--	szyna_buf_adresow <= not DPSwitch;

end Behavioral;

