_main:
;DCVA_GUI_main.c,22 :: 		void main() {
;DCVA_GUI_main.c,24 :: 		Start_TP();
BL	_Start_TP+0
;DCVA_GUI_main.c,26 :: 		while (1) {
L_main0:
;DCVA_GUI_main.c,27 :: 		Check_TP();
BL	_Check_TP+0
;DCVA_GUI_main.c,29 :: 		}
IT	AL
BAL	L_main0
;DCVA_GUI_main.c,30 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
