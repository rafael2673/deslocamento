library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity deslocamento is
    port (
        clk: in std_logic;
        clear: in std_logic;
        SW: in std_logic_vector(3 downto 0);
        ledR: out std_logic_vector(7 downto 0);
		  ledG: out std_logic_vector(7 downto 0)
    );
end deslocamento;

architecture behavior of deslocamento is

	component contador is
		 port (inicio: in std_logic_vector(2 downto 0);
				 incrementa, decrementa: in std_logic;
				 valor: out std_logic_vector(2 downto 0));
	end component;
	component registrador_3_bits is
		port (ck, clr, set: in  std_logic;
				d: in std_logic_vector(2 downto 0);
				q : out std_logic_vector(2 downto 0)
				);
	end component;
	component ck_div is
		port (ck_in : in  std_logic;
				ck_out: out std_logic);
	end component;
	component mux_8x1_8_bits is
		port (S: in std_logic_vector(2 downto 0);
				saida: out std_logic_vector(7 downto 0));
	end component;


signal clk_div: std_logic;
signal led_green, led_red: std_logic_vector(2 downto 0):= "000";
signal led_green_register, led_red_register: std_logic_vector(2 downto 0):="000";
    
begin

	CLK_DIV0: ck_div port map(clk, clk_div);
	contador_green: contador port map(led_green_register, SW(3), SW(0), led_green);
	register_green: registrador_3_bits port map(clk_div, clear, '1', led_green, led_green_register);
	contador_red: contador port map(led_red_register, SW(2), SW(1), led_red);
	register_red: registrador_3_bits port map(clk_div, clear, '1', led_red, led_red_register);
	mux_green: mux_8x1_8_bits port map(led_green_register, ledG);
	mux_red: mux_8x1_8_bits port map(led_red_register, ledR);
end behavior;
