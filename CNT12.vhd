library ieee;
use ieee.std_logic_1164.all;

entity CNT12 is 
	port (clk, rst : in std_logic;
			ov : out std_logic;
			count : out std_logic_vector(11 downto 0));
end entity;

architecture CNT12_ARC of CNT12 is
	component masuno12 is 
	port (A : in std_logic_vector(11 downto 0);
			ov : out std_logic;
			Z : out std_logic_vector(11 downto 0));
	end component;
	
	signal D, Q : std_logic_vector(11 downto 0);
	signal O : std_logic;
	
	begin 
	I0 : masuno12 port map (Q, O, D);
	count <= Q;
	
	P1 : process(clk, rst)
		begin
		if rst = '0' then
			Q <= "000000000000";
		elsif clk'event and clk = '1' then
			Q <= D;
			ov <= O;
		end if;
	end process;
end architecture;