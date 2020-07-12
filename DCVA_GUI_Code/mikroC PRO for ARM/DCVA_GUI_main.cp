#line 1 "D:/›T‹/MikroC TEZ/DCVA_GUI_LAST_TEZ/DCVA_GUI_LAST/DCVA_GUI_Code/mikroC PRO for ARM/DCVA_GUI_main.c"
#line 1 "d:/›t‹/mikroc tez/dcva_gui_last_tez/dcva_gui_last/dcva_gui_code/mikroc pro for arm/dcva_gui_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct CircleButton {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCircleButton;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

typedef struct RadioButton {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Checked;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 unsigned int Background_Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TRadioButton;

typedef struct ProgressBar {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Transparent;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 unsigned int Background_Color;
 unsigned int Min;
 unsigned int Max;
 unsigned int Position;
 char Show_Position;
 char Show_Percentage;
 char Smooth;
 char Rounded;
 char Corner_Radius;
} TProgressBar;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int CircleButtonsCount;
 TCircleButton * const code *CircleButtons;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 unsigned int RadioButtonsCount;
 TRadioButton * const code *RadioButtons;
 unsigned int ProgressBarsCount;
 TProgressBar * const code *ProgressBars;
};

extern TScreen Screen1;
extern TLabel Label1;
extern TCircleButton CircleButton1;
extern TLabel Label4;
extern TLabel Label6;
extern TLabel Label5;
extern TButton_Round ButtonRound1;
extern TImage Image1;
extern TButton_Round * const code Screen1_Buttons_Round[1];
extern TLabel * const code Screen1_Labels[4];
extern TImage * const code Screen1_Images[1];
extern TCircleButton * const code Screen1_CircleButtons[1];

extern TScreen Screen2;
extern TLabel Label2;
extern TLabel * const code Screen2_Labels[1];

extern TScreen Screen3;
extern TLabel Label3;
extern TCircleButton CircleButton2;
extern TLabel * const code Screen3_Labels[1];
extern TCircleButton * const code Screen3_CircleButtons[1];

extern TScreen Screen4;
extern TLabel Label7;
extern TLabel * const code Screen4_Labels[1];

extern TScreen Screen5;
extern TRadioButton RadioButton1;
extern TRadioButton RadioButton2;
extern TRadioButton RadioButton3;
extern TRadioButton RadioButton4;
extern TRadioButton RadioButton5;
extern TRadioButton RadioButton6;
extern TRadioButton RadioButton7;
extern TRadioButton RadioButton8;
extern TLabel Label8;
extern TLabel * const code Screen5_Labels[1];
extern TRadioButton * const code Screen5_RadioButtons[8];

extern TScreen Screen6;
extern TLabel Label9;
extern TCircleButton CircleButton3;
extern TLabel * const code Screen6_Labels[1];
extern TCircleButton * const code Screen6_CircleButtons[1];

extern TScreen Screen7;
extern TProgressBar ProgressBar1;
extern TLabel Label10;
extern TLabel Label11;
extern TLabel * const code Screen7_Labels[2];
extern TProgressBar * const code Screen7_ProgressBars[1];

extern TScreen Screen8;
extern TBox Diagram8_Box6;
extern TBox Diagram8_Box5;
extern TBox Diagram8_Box4;
extern TBox Diagram8_Box3;
extern TBox Diagram8_Box2;
extern TLabel Diagram8_S2L2;
extern TBox Diagram8_Box1;
extern TLabel Diagram8_S2L4;
extern TLabel Diagram8_S2L5;
extern TLabel Diagram8_S2L6;
extern TLabel Diagram8_S2L7;
extern TLabel Diagram8_S2L8;
extern TLabel Diagram8_S2L1;
extern TLabel * const code Screen8_Labels[7];
extern TBox * const code Screen8_Boxes[6];




void DCVA_START();
void DCVA_TEST();
void DCVA_TRAINING();
void J_E_2();
void J_E_3();
void J_E_4();
void J_E_5();
void J_E_6();
void J_E_7();
void J_E_8();
void J_E_9();
void Show_database();




extern char Label1_Caption[];
extern char CircleButton1_Caption[];
extern char Label4_Caption[];
extern char Label6_Caption[];
extern char Label5_Caption[];
extern char ButtonRound1_Caption[];
extern char Image1_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char CircleButton2_Caption[];
extern char Label7_Caption[];
extern char RadioButton1_Caption[];
extern char RadioButton2_Caption[];
extern char RadioButton3_Caption[];
extern char RadioButton4_Caption[];
extern char RadioButton5_Caption[];
extern char RadioButton6_Caption[];
extern char RadioButton7_Caption[];
extern char RadioButton8_Caption[];
extern char Label8_Caption[];
extern char Label9_Caption[];
extern char CircleButton3_Caption[];
extern char ProgressBar1_Caption[];
extern char Label10_Caption[];
extern char Label11_Caption[];
extern char Diagram8_Box6_Caption[];
extern char Diagram8_Box5_Caption[];
extern char Diagram8_Box4_Caption[];
extern char Diagram8_Box3_Caption[];
extern char Diagram8_Box2_Caption[];
extern char Diagram8_S2L2_Caption[];
extern char Diagram8_Box1_Caption[];
extern char Diagram8_S2L4_Caption[];
extern char Diagram8_S2L5_Caption[];
extern char Diagram8_S2L6_Caption[];
extern char Diagram8_S2L7_Caption[];
extern char Diagram8_S2L8_Caption[];
extern char Diagram8_S2L1_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawCircleButton(TCircleButton *ACircle_button);
void DrawBox(TBox *ABox);
void DrawRadioButton(TRadioButton *ARadioButton);
void DrawProgressBar(TProgressBar *AProgressBar);
void UpdatePBPosition(TProgressBar *AProgressBar);
void Check_TP();
void Start_TP();
#line 22 "D:/›T‹/MikroC TEZ/DCVA_GUI_LAST_TEZ/DCVA_GUI_LAST/DCVA_GUI_Code/mikroC PRO for ARM/DCVA_GUI_main.c"
void main() {

 Start_TP();

 while (1) {
 Check_TP();

 }
}
