library ieee;
use ieee.std_logic_1164.all;

entity LCD_toplvl is 
	port (clk, rst : in std_logic;
			RS, RW, E : out std_logic;
			data : out std_logic_vector(7 downto 0));
end entity;

architecture LCD_toplvl_ARC of LCD_toplvl is
	component CNT12 is 
	port (clk, rst : in std_logic;
			ov : out std_logic;
			count : out std_logic_vector(11 downto 0));
	end component;
	component LCD is 
	port (clk, rst, go : in std_logic;
			cnt : in std_logic_vector(11 downto 0);
			RS, RW, E : out std_logic;
			data : out std_logic_vector(7 downto 0));
	end component;
	
	signal cont : std_logic_vector(11 downto 0);
	signal flag : std_logic; 
	
	begin 
	I0 : CNT12 port map (clk, rst, flag, cont);
	I1 : LCD port map (clk, rst, flag, cont, RS, RW, E, data);
end architecture;