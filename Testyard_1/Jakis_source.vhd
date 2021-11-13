----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:49:46 11/12/2021 
-- Design Name: 
-- Module Name:    Jakis_source - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Jakis_source is

--	Port (
--		Clk : in STD_LOGIC;
--		LED : out STD_LOGIC_VECTOR(7 DOWNTO 0)
--	);

Port ( 
       --Switch   : in STD_LOGIC_VECTOR(3 downto 0);
	    LED      : out STD_LOGIC_VECTOR(7 downto 0);
		 --DPSwitch : in STD_LOGIC_VECTOR(1 downto 0)
		 Clk : in STD_LOGIC
);

end Jakis_source;

architecture Behavioral of Jakis_source is

--constant LICZNIK_LIMIT : integer := 5000000;
--signal licznik : unsigned(24 downto 0);
--signal mryganie : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

--signal szyna_buf_wejsc : STD_LOGIC_VECTOR(3 downto 0);
--signal szyna_buf_adresow : STD_LOGIC_VECTOR(1 downto 0);

signal rej_przesuwny : STD_LOGIC_VECTOR(7 downto 0) := X"01";

constant LICZNIK_LIMIT : integer := 12000000;

signal licznik : STD_LOGIC_VECTOR(24 downto 0);


begin
--process(Clk)
--	begin
--		if rising_edge(Clk) then
--			if licznik = LICZNIK_LIMIT then
--				licznik <= b"0000000000000000000000000";
--				mryganie <= not mryganie;
--				
--			else
--				licznik <= licznik + 1;
--			end if;
--		end if;
--end process;
--
--LED <= mryganie;



zliczanie_przesuwanie : process(Clk)
begin
	if rising_edge(Clk) then
		if licznik = LICZNIK_LIMIT then
			licznik <= (others => '0');
			rej_przesuwny <= rej_przesuwny(0) & rej_przesuwny(7 downto 1);
		else
			licznik <= licznik + 1;
		end if;
	end if;
end process zliczanie_przesuwanie;

LED <= rej_przesuwny;

end Behavioral;

