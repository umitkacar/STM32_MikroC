_main:
;PCA_FLDA_GUI_main.c,21 :: 		void main() {
SUB	SP, SP, #4
;PCA_FLDA_GUI_main.c,23 :: 		Start_TP();
BL	_Start_TP+0
;PCA_FLDA_GUI_main.c,25 :: 		while (1) {
L_main0:
;PCA_FLDA_GUI_main.c,26 :: 		Check_TP();
BL	_Check_TP+0
;PCA_FLDA_GUI_main.c,28 :: 		}
IT	AL
BAL	L_main0
;PCA_FLDA_GUI_main.c,30 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
