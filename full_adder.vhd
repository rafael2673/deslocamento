library ieee ;
use ieee.std_logic_1164 .all;

entity full_adder is
	port(A, B, Ci: in std_logic;
		  S, Co: out std_logic);
end full_adder;

architecture soma of full_adder is
begin
	S <=	(A xor B xor Ci);
	Co <= ((A and B) or (A and Ci) or (B and Ci));
end soma;