library ieee;
use ieee.std_logic_1164.all;

entity LCD is 
	port (clk, rst, go : in std_logic;
			cnt : in std_logic_vector(11 downto 0);
			RS, RW, E : out std_logic;
			data : out std_logic_vector(7 downto 0));
end entity;

architecture LCD_ARC of LCD is

	type edos is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, w8);
	signal edo, edof, edox, edoy : edos := S0;
	
	begin 
				 
	P1 : process (clk, rst, go)
		begin
		if rst = '0' then
			edo <= S0;
			edoy <= S0;
		elsif clk'event and clk = '1' then 
			if go = '1' then
				edo <= edof;
				edoy <= edox;
			end if;
		end if;
	end process;
	
	P2 : process (clk, edo)
		begin
		case edo is
			when S0 => RS <= '0';
						  RW <= '0';
						  E <= '0';
						  data <= X"00";
						  edox <= S1;
						  edof <= w8;
						  
			when S1 => RS <= '0';
						  RW <= '0';
						  E <= '1';
						  data <= X"38";
						  edox <= S2;
						  edof <= w8;
						  
			when S2 => RS <= '0';
						  RW <= '0';
						  E <= '1';
						  data <= X"38";
						  edox <= S3;
						  edof <= w8;
						  
			when S3 => RS <= '0';
						  RW <= '0';
						  E <= '1';
						  data <= X"38";
						  edox <= S4;
						  edof <= w8;
						  
			when S4 => RS <= '0';
						  RW <= '0';
						  E <= '1';
						  data <= X"0D";
						  edox <= S5;
						  edof <= w8;
						  
			when S5 => RS <= '0';
						  RW <= '0';
						  E <= '1';
						  data <= X"01";
						  edox <= S6;
						  edof <= w8;
						  
			when S6 => RS <= '0';
						  RW <= '0';
						  E <= '1';
						  data <= X"06";
						  edox <= S7;
						  edof <= w8;
						  
			when S7 => RS <= '0';
						  RW <= '0';
						  E <= '1';
						  data <= X"80";
						  edox <= S8;
						  edof <= w8;
						  
			when S8 => RS <= '1';
						  RW <= '0';
						  E <= '1';
						  data <= X"48";
						  edox <= S9;
						  edof <= w8;
						  
			when S9 => RS <= '1';
						  RW <= '0';
						  E <= '1';
						  data <= X"4F";
						  edox <= S10;
						  edof <= w8;
			
			when S10 => RS <= '1';
							RW <= '0';
							E <= '1';
							data <= X"4C";
							edox <= S11;
							edof <= w8;
			
			when S11 => RS <= '1';
							RW <= '0';
							E <= '1';
							data <= X"41";
							edox <= S12;
							edof <= w8;
			
			when S12 => RS <= '1';
							RW <= '0';
							E <= '1';
							data <= X"21";
							edox <= S13;
							edof <= w8;
			
			when S13 => RS <= '0';
							RW <= '0';
							E <= '1';
							data <= X"C5";
							edox <= S14;
							edof <= w8;
							
			when S14 => RS <= '1';
							RW <= '0';
							E <= '1';
							data <= X"4A";
							edox <= S11;
							edof <= w8;
							
			when S15 => RS <= '1';
							RW <= '0';
							E <= '1';
							data <= X"46";
							edox <= S16;
							edof <= w8;
							
			when S16 => RS <= '1';
							RW <= '0';
							E <= '1';
							data <= X"53";
							edox <= S17;
							edof <= w8;
						
			when S17 => RS <= '1';
							RW <= '0';
							E <= '1';
							data <= X"43";
							edox <= S18;
							edof <= w8;
							
			when S18 => RS <= '1';
							RW <= '0';
							E <= '1';
							data <= X"10";
							edox <= S7;
							edof <= w8;
							
			when w8 => RS <= '0';
						  RW <= '0';
						  E <= '0';
						  data <= X"00";
						  edof <= edoy;
						  
			when others => null;
		end case;
	end process;
end architecture;