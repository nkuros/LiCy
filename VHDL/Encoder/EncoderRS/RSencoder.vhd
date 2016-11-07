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
-- CREATED		"Sun Nov 06 13:30:11 2016"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY RSencoder IS 
	PORT
	(
		Clock_RSencoder :  IN  STD_LOGIC;
		Initialize_RSencoder :  IN  STD_LOGIC;
		input_RSencoder :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Output :  OUT  STD_LOGIC_VECTOR(0 TO 3)
	);
END RSencoder;

ARCHITECTURE bdf_type OF RSencoder IS 

COMPONENT sinalcontrole
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 control : OUT STD_LOGIC;
		 count : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT gf_mult
	PORT(x : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
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

COMPONENT gf_sum
	PORT(a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 c : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT and4x1
	PORT(b : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 c : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2x1
GENERIC (NB : INTEGER
			);
	PORT(Sel : IN STD_LOGIC;
		 I0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 I1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 O : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT static_13
	PORT(		 o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT static_4
	PORT(		 o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT static_14
	PORT(		 o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT static_8
	PORT(		 o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT static_1
	PORT(		 o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT static_0
	PORT(		 o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_51 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_53 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_54 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_44 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_48 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 
SYNTHESIZED_WIRE_52 <= '1';



b2v_inst : sinalcontrole
PORT MAP(clk => Clock_RSencoder,
		 reset => Initialize_RSencoder,
		 control => SYNTHESIZED_WIRE_53);


b2v_inst10 : gf_mult
PORT MAP(x => SYNTHESIZED_WIRE_51,
		 y => SYNTHESIZED_WIRE_1,
		 o => SYNTHESIZED_WIRE_42);


b2v_inst11 : gf_mult
PORT MAP(x => SYNTHESIZED_WIRE_51,
		 y => SYNTHESIZED_WIRE_3,
		 o => SYNTHESIZED_WIRE_7);


b2v_inst12 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_52,
		 clr => Initialize_RSencoder,
		 clk => Clock_RSencoder,
		 d => SYNTHESIZED_WIRE_5,
		 q => SYNTHESIZED_WIRE_13);


b2v_inst13 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_52,
		 clr => Initialize_RSencoder,
		 clk => Clock_RSencoder,
		 d => SYNTHESIZED_WIRE_7,
		 q => SYNTHESIZED_WIRE_35);


b2v_inst14 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_52,
		 clr => Initialize_RSencoder,
		 clk => Clock_RSencoder,
		 d => SYNTHESIZED_WIRE_9,
		 q => SYNTHESIZED_WIRE_43);


b2v_inst15 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_52,
		 clr => Initialize_RSencoder,
		 clk => Clock_RSencoder,
		 d => SYNTHESIZED_WIRE_11,
		 q => SYNTHESIZED_WIRE_45);


b2v_inst19 : gf_sum
PORT MAP(a => SYNTHESIZED_WIRE_12,
		 b => SYNTHESIZED_WIRE_13,
		 c => SYNTHESIZED_WIRE_23);


b2v_inst2 : and4x1
PORT MAP(b => SYNTHESIZED_WIRE_53,
		 a => SYNTHESIZED_WIRE_15,
		 c => SYNTHESIZED_WIRE_51);


b2v_inst20 : mux2x1
GENERIC MAP(NB => 4
			)
PORT MAP(Sel => SYNTHESIZED_WIRE_53,
		 I0 => SYNTHESIZED_WIRE_54,
		 I1 => input_RSencoder,
		 O => Output);


b2v_inst21 : gf_sum
PORT MAP(a => SYNTHESIZED_WIRE_18,
		 b => SYNTHESIZED_WIRE_19,
		 c => SYNTHESIZED_WIRE_25);


b2v_inst22 : gf_sum
PORT MAP(a => SYNTHESIZED_WIRE_20,
		 b => SYNTHESIZED_WIRE_21,
		 c => SYNTHESIZED_WIRE_27);



b2v_inst24 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_52,
		 clr => Initialize_RSencoder,
		 clk => Clock_RSencoder,
		 d => SYNTHESIZED_WIRE_23,
		 q => SYNTHESIZED_WIRE_19);


b2v_inst25 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_52,
		 clr => Initialize_RSencoder,
		 clk => Clock_RSencoder,
		 d => SYNTHESIZED_WIRE_25,
		 q => SYNTHESIZED_WIRE_21);


b2v_inst26 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_52,
		 clr => Initialize_RSencoder,
		 clk => Clock_RSencoder,
		 d => SYNTHESIZED_WIRE_27,
		 q => SYNTHESIZED_WIRE_29);


b2v_inst27 : gf_sum
PORT MAP(a => SYNTHESIZED_WIRE_28,
		 b => SYNTHESIZED_WIRE_29,
		 c => SYNTHESIZED_WIRE_31);


b2v_inst28 : register4b
PORT MAP(ld => SYNTHESIZED_WIRE_52,
		 clr => Initialize_RSencoder,
		 clk => Clock_RSencoder,
		 d => SYNTHESIZED_WIRE_31,
		 q => SYNTHESIZED_WIRE_54);


b2v_inst29 : gf_mult
PORT MAP(x => SYNTHESIZED_WIRE_51,
		 y => SYNTHESIZED_WIRE_33,
		 o => SYNTHESIZED_WIRE_12);


b2v_inst3 : gf_sum
PORT MAP(a => SYNTHESIZED_WIRE_34,
		 b => SYNTHESIZED_WIRE_35,
		 c => SYNTHESIZED_WIRE_9);


b2v_inst30 : gf_mult
PORT MAP(x => SYNTHESIZED_WIRE_51,
		 y => SYNTHESIZED_WIRE_37,
		 o => SYNTHESIZED_WIRE_18);


b2v_inst31 : gf_mult
PORT MAP(x => SYNTHESIZED_WIRE_51,
		 y => SYNTHESIZED_WIRE_39,
		 o => SYNTHESIZED_WIRE_20);


b2v_inst32 : gf_mult
PORT MAP(x => SYNTHESIZED_WIRE_51,
		 y => SYNTHESIZED_WIRE_41,
		 o => SYNTHESIZED_WIRE_28);


b2v_inst33 : static_13
PORT MAP(		 o => SYNTHESIZED_WIRE_3);


b2v_inst34 : static_13
PORT MAP(		 o => SYNTHESIZED_WIRE_33);


b2v_inst35 : static_13
PORT MAP(		 o => SYNTHESIZED_WIRE_41);


b2v_inst36 : static_4
PORT MAP(		 o => SYNTHESIZED_WIRE_50);


b2v_inst37 : static_14
PORT MAP(		 o => SYNTHESIZED_WIRE_1);


b2v_inst38 : static_8
PORT MAP(		 o => SYNTHESIZED_WIRE_48);


b2v_inst39 : static_1
PORT MAP(		 o => SYNTHESIZED_WIRE_37);


b2v_inst4 : gf_sum
PORT MAP(a => SYNTHESIZED_WIRE_42,
		 b => SYNTHESIZED_WIRE_43,
		 c => SYNTHESIZED_WIRE_11);


b2v_inst40 : static_0
PORT MAP(		 o => SYNTHESIZED_WIRE_39);


b2v_inst5 : gf_sum
PORT MAP(a => SYNTHESIZED_WIRE_44,
		 b => SYNTHESIZED_WIRE_45,
		 c => SYNTHESIZED_WIRE_5);


b2v_inst6 : gf_sum
PORT MAP(a => SYNTHESIZED_WIRE_54,
		 b => input_RSencoder,
		 c => SYNTHESIZED_WIRE_15);


b2v_inst7 : gf_mult
PORT MAP(x => SYNTHESIZED_WIRE_51,
		 y => SYNTHESIZED_WIRE_48,
		 o => SYNTHESIZED_WIRE_44);


b2v_inst8 : gf_mult
PORT MAP(x => SYNTHESIZED_WIRE_51,
		 y => SYNTHESIZED_WIRE_50,
		 o => SYNTHESIZED_WIRE_34);


END bdf_type;