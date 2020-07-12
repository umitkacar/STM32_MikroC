typedef struct divstruct {
             int quot;
             int rem;
 } div_t;

typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct  Button_Round {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  TTextAlign    TextAlign;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          Corner_Radius;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton_Round;

typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

typedef struct  Image {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  const char    *Picture_Name;
  char          Visible;
  char          Active;
  char          Picture_Type;
  char          Picture_Ratio;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TImage;

typedef struct RadioButton {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Checked;
  char          Transparent;
  char          *Caption;
  TTextAlign    TextAlign;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  unsigned int  Background_Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TRadioButton;

typedef struct ProgressBar {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  unsigned int  Background_Color;
  unsigned int  Min;
  unsigned int  Max;
  unsigned int  Position;
  char          Show_Position;
  char          Show_Percentage;
  char          Smooth;
  char          Rounded;
  char          Corner_Radius;
} TProgressBar;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned short         ObjectsCount;
  unsigned int           Buttons_RoundCount;
  TButton_Round          * const code *Buttons_Round;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           ImagesCount;
  TImage                 * const code *Images;
  unsigned int           RadioButtonsCount;
  TRadioButton              * const code *RadioButtons;
  unsigned int           ProgressBarsCount;
  TProgressBar              * const code *ProgressBars;
};

extern   TScreen                MainScreen1;
extern   TLabel                 Label1;
extern   TButton_Round          Test_ButtonRound1;
extern   TButton_Round          Training_ButtonRound1;
extern   TButton_Round          Database_Show_ButtonRound1;
extern   TRadioButton                 CP_2_RadioButton1;
extern   TRadioButton                 CP_3_RadioButton1;
extern   TRadioButton                 CP_4_RadioButton1;
extern   TRadioButton                 CP_5_RadioButton1;
extern   TProgressBar                 Success_ProgressBar1;
extern   TLabel                 Label2;
extern   TLabel                 Label3;
extern   TButton_Round          * const code Screen1_Buttons_Round[3];
extern   TLabel                 * const code Screen1_Labels[3];
extern   TRadioButton               * const code Screen1_RadioButtons[4];
extern   TProgressBar               * const code Screen1_ProgressBars[1];


extern   TScreen                DatabaseScreen2;
extern   TLabel                 Label4;
extern   TLabel                 * const code Screen2_Labels[1];


extern   TScreen                TrainingScreen3;
extern   TImage               Image1;
extern   TLabel                 Label5;
extern   TLabel                 * const code Screen3_Labels[1];
extern   TImage                 * const code Screen3_Images[1];


extern   TScreen                TestScreen4;
extern   TLabel                 Label6;
extern   TLabel                 * const code Screen4_Labels[1];



/////////////////////////
// Events Code Declarations
void CP_2();
void CP_3();
void CP_4();
void CP_5();
void Database_Show();
void Test();
void Training();
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
extern char Label1_Caption[];
extern char Test_ButtonRound1_Caption[];
extern char Training_ButtonRound1_Caption[];
extern char Database_Show_ButtonRound1_Caption[];
extern char CP_2_RadioButton1_Caption[];
extern char CP_3_RadioButton1_Caption[];
extern char CP_4_RadioButton1_Caption[];
extern char CP_5_RadioButton1_Caption[];
extern char Success_ProgressBar1_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char Image1_Caption[];
extern char Label5_Caption[];
extern char Label6_Caption[];
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawRadioButton(TRadioButton *ARadioButton);
void DrawProgressBar(TProgressBar *AProgressBar);
void UpdatePBPosition(TProgressBar *AProgressBar);
void Check_TP();
void Start_TP();
div_t div(int number, int denom);


