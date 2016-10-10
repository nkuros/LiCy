-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"
-- CREATED		"Sun Oct 09 22:43:00 2016"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY RSIntegration IS 
	PORT
	(
		Clock :  IN  STD_LOGIC;
		Reset :  IN  STD_LOGIC;
		IniciaSyn :  IN  STD_LOGIC;
		Input :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Mensagem :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Registra :  OUT  STD_LOGIC;
		di :  OUT  STD_LOGIC;
		loadS :  OUT  STD_LOGIC;
		loadB :  OUT  STD_LOGIC;
		loadC :  OUT  STD_LOGIC;
		clearS :  OUT  STD_LOGIC;
		clearB :  OUT  STD_LOGIC;
		clearC :  OUT  STD_LOGIC;
		MuxSel :  OUT  STD_LOGIC;
		Nerror :  OUT  STD_LOGIC;
		pin_name1 :  OUT  STD_LOGIC;
		Impar :  OUT  STD_LOGIC;
		Count_4 :  OUT  STD_LOGIC;
		Count_8 :  OUT  STD_LOGIC;
		B_0 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B_1 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B_2 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B_3 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B_mux :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Decod :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DS_reg :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Lambda1 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Lambda2 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Lambda3 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Lambda4 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Omega0 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Omega1 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Omega2 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Omega3 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Omega4 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		S0 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		S1 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		S2 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		S3 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		S4 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Syn0 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Syn1 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Syn2 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Syn3 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Syn4 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Syn5 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Syn6 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Syn7 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		SyndromeOut :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Test_state :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END RSIntegration;

ARCHITECTURE bdf_type OF RSIntegration IS 

COMPONENT berlemas
	PORT(Clock : IN STD_LOGIC;
		 Reset : IN STD_LOGIC;
		 Impar : IN STD_LOGIC;
		 Count4 : IN STD_LOGIC;
		 Count8 : IN STD_LOGIC;
		 Inicia : IN STD_LOGIC;
		 Input : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Registra : OUT STD_LOGIC;
		 di : OUT STD_LOGIC;
		 loadS : OUT STD_LOGIC;
		 loadB : OUT STD_LOGIC;
		 loadC : OUT STD_LOGIC;
		 clearS : OUT STD_LOGIC;
		 clearB : OUT STD_LOGIC;
		 clearC : OUT STD_LOGIC;
		 MuxSel : OUT STD_LOGIC;
		 Nerror : OUT STD_LOGIC;
		 B_0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B_1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B_2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B_3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B_mux : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 DS_reg : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Lambda1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Lambda2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Lambda3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Lambda4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Omega : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Test_state : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT berlekamp_counter
	PORT(clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 Impar : OUT STD_LOGIC;
		 Count_4 : OUT STD_LOGIC;
		 Count_8 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT syn8x4
	PORT(reset : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 Sin0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Sin1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Sin2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Sin3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Sin4 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Sin5 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Sin6 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Sin7 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT syndromecontroller
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 inicia : IN STD_LOGIC;
		 startSReg : OUT STD_LOGIC;
		 startBerle : OUT STD_LOGIC;
		 load : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT register4b
	PORT(ld : IN STD_LOGIC;
		 clr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT syndrome
	PORT(Clear : IN STD_LOGIC;
		 Clock : IN STD_LOGIC;
		 Input : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S6 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S7 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT chienforney
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 inicia : IN STD_LOGIC;
		 Input : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Lamb0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Lamb1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Lamb2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Lamb3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Omega0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Omega1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Omega2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Omega3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 pin_name1 : OUT STD_LOGIC;
		 Decod : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_44 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 
Registra <= SYNTHESIZED_WIRE_31;
loadS <= SYNTHESIZED_WIRE_40;
clearS <= SYNTHESIZED_WIRE_41;
Impar <= SYNTHESIZED_WIRE_0;
Count_4 <= SYNTHESIZED_WIRE_1;
Count_8 <= SYNTHESIZED_WIRE_2;
Lambda1 <= SYNTHESIZED_WIRE_32;
Lambda2 <= SYNTHESIZED_WIRE_33;
Lambda3 <= SYNTHESIZED_WIRE_34;
Lambda4 <= SYNTHESIZED_WIRE_35;
Omega0 <= SYNTHESIZED_WIRE_45;
Omega1 <= SYNTHESIZED_WIRE_44;
Omega2 <= SYNTHESIZED_WIRE_43;
Omega3 <= SYNTHESIZED_WIRE_42;
Syn0 <= SYNTHESIZED_WIRE_8;
Syn1 <= SYNTHESIZED_WIRE_9;
Syn2 <= SYNTHESIZED_WIRE_10;
Syn3 <= SYNTHESIZED_WIRE_11;
Syn4 <= SYNTHESIZED_WIRE_12;
Syn5 <= SYNTHESIZED_WIRE_13;
Syn6 <= SYNTHESIZED_WIRE_14;
Syn7 <= SYNTHESIZED_WIRE_15;
SyndromeOut <= SYNTHESIZED_WIRE_4;



b2v_inst : berlemas
PORT MAP(Clock => Clock,
		 Reset => Reset,
		 Impar => SYNTHESIZED_WIRE_0,
		 Count4 => SYNTHESIZED_WIRE_1,
		 Count8 => SYNTHESIZED_WIRE_2,
		 Inicia => SYNTHESIZED_WIRE_3,
		 Input => SYNTHESIZED_WIRE_4,
		 Registra => SYNTHESIZED_WIRE_31,
		 di => di,
		 loadS => SYNTHESIZED_WIRE_40,
		 loadB => loadB,
		 loadC => loadC,
		 clearS => SYNTHESIZED_WIRE_41,
		 clearB => clearB,
		 clearC => clearC,
		 MuxSel => MuxSel,
		 Nerror => Nerror,
		 B_0 => B_0,
		 B_1 => B_1,
		 B_2 => B_2,
		 B_3 => B_3,
		 B_mux => B_mux,
		 DS_reg => DS_reg,
		 Lambda1 => SYNTHESIZED_WIRE_32,
		 Lambda2 => SYNTHESIZED_WIRE_33,
		 Lambda3 => SYNTHESIZED_WIRE_34,
		 Lambda4 => SYNTHESIZED_WIRE_35,
		 Omega => SYNTHESIZED_WIRE_18,
		 S0 => S0,
		 S1 => S1,
		 S2 => S2,
		 S3 => S3,
		 S4 => S4,
		 Test_state => Test_state);


b2v_inst1 : berlekamp_counter
PORT MAP(clock => Clock,
		 enable => SYNTHESIZED_WIRE_5,
		 Impar => SYNTHESIZED_WIRE_0,
		 Count_4 => SYNTHESIZED_WIRE_1,
		 Count_8 => SYNTHESIZED_WIRE_2);


b2v_inst10 : syn8x4
PORT MAP(reset => Reset,
		 clk => Clock,
		 start => SYNTHESIZED_WIRE_6,
		 load => SYNTHESIZED_WIRE_7,
		 Sin0 => SYNTHESIZED_WIRE_8,
		 Sin1 => SYNTHESIZED_WIRE_9,
		 Sin2 => SYNTHESIZED_WIRE_10,
		 Sin3 => SYNTHESIZED_WIRE_11,
		 Sin4 => SYNTHESIZED_WIRE_12,
		 Sin5 => SYNTHESIZED_WIRE_13,
		 Sin6 => SYNTHESIZED_WIRE_14,
		 Sin7 => SYNTHESIZED_WIRE_15,
		 S_out => SYNTHESIZED_WIRE_4);


b2v_inst11 : syndromecontroller
PORT MAP(clock => Clock,
		 reset => Reset,
		 inicia => IniciaSyn,
		 startSReg => SYNTHESIZED_WIRE_6,
		 startBerle => SYNTHESIZED_WIRE_3,
		 load => SYNTHESIZED_WIRE_7);


b2v_inst2 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_40,
		 clr => SYNTHESIZED_WIRE_41,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_18,
		 q => SYNTHESIZED_WIRE_42);


b2v_inst3 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_40,
		 clr => SYNTHESIZED_WIRE_41,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_42,
		 q => SYNTHESIZED_WIRE_43);


b2v_inst4 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_40,
		 clr => SYNTHESIZED_WIRE_41,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_43,
		 q => SYNTHESIZED_WIRE_44);


b2v_inst5 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_40,
		 clr => SYNTHESIZED_WIRE_41,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_44,
		 q => SYNTHESIZED_WIRE_45);


b2v_inst6 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_40,
		 clr => SYNTHESIZED_WIRE_41,
		 clk => Clock,
		 d => SYNTHESIZED_WIRE_45,
		 q => Omega4);


b2v_inst7 : syndrome
PORT MAP(Clear => Reset,
		 Clock => Clock,
		 Input => Input,
		 S0 => SYNTHESIZED_WIRE_8,
		 S1 => SYNTHESIZED_WIRE_9,
		 S2 => SYNTHESIZED_WIRE_10,
		 S3 => SYNTHESIZED_WIRE_11,
		 S4 => SYNTHESIZED_WIRE_12,
		 S5 => SYNTHESIZED_WIRE_13,
		 S6 => SYNTHESIZED_WIRE_14,
		 S7 => SYNTHESIZED_WIRE_15);


b2v_inst8 : chienforney
PORT MAP(clock => Clock,
		 reset => Reset,
		 inicia => SYNTHESIZED_WIRE_31,
		 Input => Mensagem,
		 Lamb0 => SYNTHESIZED_WIRE_32,
		 Lamb1 => SYNTHESIZED_WIRE_33,
		 Lamb2 => SYNTHESIZED_WIRE_34,
		 Lamb3 => SYNTHESIZED_WIRE_35,
		 Omega0 => SYNTHESIZED_WIRE_45,
		 Omega1 => SYNTHESIZED_WIRE_44,
		 Omega2 => SYNTHESIZED_WIRE_43,
		 Omega3 => SYNTHESIZED_WIRE_42,
		 pin_name1 => pin_name1,
		 Decod => Decod);


SYNTHESIZED_WIRE_5 <= NOT(Reset);



END bdf_type;