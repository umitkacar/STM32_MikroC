#line 1 "X:/›T‹/MikroC TEZ/MAKALE_GUI/PCA_FLDA_GUI_Code/mikroC PRO for ARM/PCA_FLDA_GUI_events_code.c"
#line 1 "x:/›t‹/mikroc tez/makale_gui/pca_flda_gui_code/mikroc pro for arm/pca_flda_gui_objects.h"
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
 char Active;
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
 unsigned short ObjectsCount;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int CircleButtonsCount;
 TCircleButton * const code *CircleButtons;
 unsigned int RadioButtonsCount;
 TRadioButton * const code *RadioButtons;
 unsigned int ProgressBarsCount;
 TProgressBar * const code *ProgressBars;
};

extern TScreen Screen1;
extern TLabel Label1;
extern TLabel Label2;
extern TLabel Label3;
extern TLabel Label4;
extern TCircleButton CircleButton1;
extern TLabel * const code Screen1_Labels[4];
extern TCircleButton * const code Screen1_CircleButtons[1];


extern TScreen Screen2;
extern TButton_Round ButtonRound1;
extern TButton_Round ButtonRound2;
extern TLabel Label8;
extern TButton_Round ButtonRound8;
extern TButton_Round * const code Screen2_Buttons_Round[3];
extern TLabel * const code Screen2_Labels[1];


extern TScreen Screen3;
extern TButton_Round ButtonRound4;
extern TLabel Label7;
extern TLabel Label5;
extern TButton_Round * const code Screen3_Buttons_Round[1];
extern TLabel * const code Screen3_Labels[2];


extern TScreen Screen5;
extern TLabel Label6;
extern TRadioButton RadioButton7;
extern TRadioButton RadioButton8;
extern TRadioButton RadioButton9;
extern TRadioButton RadioButton10;
extern TRadioButton RadioButton11;
extern TRadioButton RadioButton1;
extern TRadioButton RadioButton2;
extern TLabel * const code Screen4_Labels[1];
extern TRadioButton * const code Screen4_RadioButtons[7];


extern TScreen Screen6;
extern TLabel Label9;
extern TLabel Label10;
extern TCircleButton CircleButton2;
extern TLabel * const code Screen5_Labels[2];
extern TCircleButton * const code Screen5_CircleButtons[1];


extern TScreen Screen7;
extern TLabel Label11;
extern TLabel * const code Screen6_Labels[1];


extern TScreen Screen8;
extern TLabel Label12;
extern TButton_Round ButtonRound5;
extern TButton_Round * const code Screen7_Buttons_Round[1];
extern TLabel * const code Screen7_Labels[1];


extern TScreen Screen9;
extern TLabel Label13;
extern TLabel * const code Screen8_Labels[1];


extern TScreen Screen10;
extern TCircleButton CircleButton3;
extern TLabel Label14;
extern TProgressBar ProgressBar1;
extern TLabel Label15;
extern TLabel * const code Screen9_Labels[2];
extern TCircleButton * const code Screen9_CircleButtons[1];
extern TProgressBar * const code Screen9_ProgressBars[1];


extern TScreen Screen11;
extern TLabel Label16;
extern TLabel Label17;
extern TLabel Label18;
extern TButton_Round ButtonRound6;
extern TButton_Round * const code Screen10_Buttons_Round[1];
extern TLabel * const code Screen10_Labels[3];


extern TScreen Screen12;
extern TLabel Label19;
extern TLabel Label31;
extern TLabel * const code Screen11_Labels[2];


extern TScreen Screen13;
extern TLabel Label20;
extern TLabel Label21;
extern TLabel Label22;
extern TButton_Round ButtonRound7;
extern TButton_Round * const code Screen12_Buttons_Round[1];
extern TLabel * const code Screen12_Labels[3];


extern TScreen Screen14;
extern TLabel Label23;
extern TLabel Label24;
extern TLabel Label25;
extern TRadioButton RadioButton12;
extern TRadioButton RadioButton13;
extern TRadioButton RadioButton14;
extern TRadioButton RadioButton15;
extern TRadioButton RadioButton16;
extern TRadioButton RadioButton17;
extern TLabel * const code Screen13_Labels[3];
extern TRadioButton * const code Screen13_RadioButtons[6];


extern TScreen Screen15;
extern TLabel Label26;
extern TLabel Label27;
extern TLabel Label28;
extern TCircleButton CircleButton4;
extern TLabel * const code Screen14_Labels[3];
extern TCircleButton * const code Screen14_CircleButtons[1];


extern TScreen Screen16;
extern TLabel Label29;
extern TLabel Label30;
extern TLabel * const code Screen15_Labels[2];


extern TScreen Screen17;
extern TLabel Label32;
extern TLabel Label33;
extern TLabel Label34;
extern TCircleButton CircleButton5;
extern TLabel * const code Screen16_Labels[3];
extern TCircleButton * const code Screen16_CircleButtons[1];


extern TScreen Screen18;
extern TLabel Label35;
extern TLabel * const code Screen17_Labels[1];


extern TScreen Screen19;
extern TLabel Label36;
extern TProgressBar ProgressBar2;
extern TLabel Label37;
extern TCircleButton CircleButton6;
extern TLabel * const code Screen18_Labels[2];
extern TCircleButton * const code Screen18_CircleButtons[1];
extern TProgressBar * const code Screen18_ProgressBars[1];


extern TScreen Screen20;
extern TLabel Label38;
extern TLabel * const code Screen19_Labels[1];





void DATABASE_SHOW();
void FLDA_CONTINUE();
void FLDA_PART_1_START();
void FLDA_PART_2_START();
void FLDA_RESULTS_MAIN();
void FLDA_SELECT();
void FLDA_TEST();
void J_E_2();
void J_E_3();
void J_E_4();
void J_E_5();
void J_E_6();
void J_E_7();
void J_E_8();
void JACOBI_SELECT();
void PCA_RESULTS_MAIN();
void PCA_SELECT();
void PCA_TEST_START();
void PCA_TRAINING_START();
void QR_SELECT();
void QR1_10();
void QR1_100();
void QR1_15();
void QR1_25();
void QR1_50();
void QR1_75();
void QR2_10();
void QR2_100();
void QR2_15();
void QR2_25();
void QR2_50();
void QR2_75();
void S1_START();




extern char Label1_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char CircleButton1_Caption[];
extern char ButtonRound1_Caption[];
extern char ButtonRound2_Caption[];
extern char Label8_Caption[];
extern char ButtonRound8_Caption[];
extern char ButtonRound4_Caption[];
extern char Label7_Caption[];
extern char Label5_Caption[];
extern char Label6_Caption[];
extern char RadioButton7_Caption[];
extern char RadioButton8_Caption[];
extern char RadioButton9_Caption[];
extern char RadioButton10_Caption[];
extern char RadioButton11_Caption[];
extern char RadioButton1_Caption[];
extern char RadioButton2_Caption[];
extern char Label9_Caption[];
extern char Label10_Caption[];
extern char CircleButton2_Caption[];
extern char Label11_Caption[];
extern char Label12_Caption[];
extern char ButtonRound5_Caption[];
extern char Label13_Caption[];
extern char CircleButton3_Caption[];
extern char Label14_Caption[];
extern char ProgressBar1_Caption[];
extern char Label15_Caption[];
extern char Label16_Caption[];
extern char Label17_Caption[];
extern char Label18_Caption[];
extern char ButtonRound6_Caption[];
extern char Label19_Caption[];
extern char Label31_Caption[];
extern char Label20_Caption[];
extern char Label21_Caption[];
extern char Label22_Caption[];
extern char ButtonRound7_Caption[];
extern char Label23_Caption[];
extern char Label24_Caption[];
extern char Label25_Caption[];
extern char RadioButton12_Caption[];
extern char RadioButton13_Caption[];
extern char RadioButton14_Caption[];
extern char RadioButton15_Caption[];
extern char RadioButton16_Caption[];
extern char RadioButton17_Caption[];
extern char Label26_Caption[];
extern char Label27_Caption[];
extern char Label28_Caption[];
extern char CircleButton4_Caption[];
extern char Label29_Caption[];
extern char Label30_Caption[];
extern char Label32_Caption[];
extern char Label33_Caption[];
extern char Label34_Caption[];
extern char CircleButton5_Caption[];
extern char Label35_Caption[];
extern char Label36_Caption[];
extern char ProgressBar2_Caption[];
extern char Label37_Caption[];
extern char CircleButton6_Caption[];
extern char Label38_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawCircleButton(TCircleButton *ACircle_button);
void DrawRadioButton(TRadioButton *ARadioButton);
void DrawProgressBar(TProgressBar *AProgressBar);
void UpdatePBPosition(TProgressBar *AProgressBar);
void Check_TP();
void Start_TP();
#line 1 "x:/›t‹/mikroc tez/makale_gui/pca_flda_gui_code/mikroc pro for arm/pca_flda_gui_resources.h"
#line 3 "X:/›T‹/MikroC TEZ/MAKALE_GUI/PCA_FLDA_GUI_Code/mikroC PRO for ARM/PCA_FLDA_GUI_events_code.c"
data double PCA_ORJ[50]={
320.119726821557,
366.371977349503,
281.349752268766,
1081.58711882233,
658.441366132844,
362.746584165891,
636.033320811437,
454.997512724422,
249.316734481805,
855.767178668507,
432.321462315564,
815.695464929351,
756.288064856888,
317.507729319928,
770.505148289842,
915.172025784001,
423.799135620894,
882.750699694282,
1162.60348653438,
853.012674367725,
1656.05556859070,
1460.12643338291,
939.304494484877,
1248.11130669369,
888.417062841536,
1616.20475247964,
1200.91586631472,
1241.95873211566,
1473.26531930464,
1165.03500382855,
1673.44400524051,
1371.04385301620,
1324.47268618998,
1418.37893526203,
1510.90159504470,
1360.23987042869,
955.259236333479,
1514.17533414115,
1482.83110973966,
1278.33720907088,
4555.78952022370,
3174.04273337060,
3635.51048109598,
5661.99231859102,
2951.09885136608,
2298.61149436390,
2782.68103470770,
2693.48108995486,
1529.56048333526,
3789.73348687475};
data double FLDA_ORJ[50]={
140.058360032895,
135.415277512236,
129.323323050510,
392.917368383770,
232.322178363788,
129.547309290859,
173.432550121250,
135.526545793462,
88.8199127312127,
393.341150610848,
171.645890967378,
183.973935123906,
132.153468899311,
123.885428220996,
206.903728876146,
139.642739006492,
159.436190482457,
172.460825676529,
311.805419300387,
226.172094741205,
688.032723433533,
665.921757053189,
493.490663726509,
623.521386147689,
484.971271639241,
670.201874502947,
696.497756075878,
684.859762036892,
693.879221448320,
530.703705210679,
878.361875339463,
656.037169943361,
770.381136160248,
651.097465761487,
754.813162743666,
762.964953873957,
630.819539962059,
755.904426597989,
727.046901461264,
680.467352513573,
2201.86841843887,
1656.56483072014,
1238.37078808151,
2212.32266360366,
1441.50580642432,
1090.24411992535,
1501.07295739762,
1317.98760707769,
847.716745027934,
1423.84568232095};
#line 1 "x:/›t‹/mikroc tez/makale_gui/pca_flda_gui_code/mikroc pro for arm/pca_flda_gui_resources.h"
#line 116 "X:/›T‹/MikroC TEZ/MAKALE_GUI/PCA_FLDA_GUI_Code/mikroC PRO for ARM/PCA_FLDA_GUI_events_code.c"
const code char Ear[720000];
data double m_ort[4800];
data double L[100][100];
data double V[100][100];
data double R[100][100];
data double Fisher[50][19];
data double SS[50][50];

data double KTemp[50];
data double MTemp[100];
data double GTemp[100];
data double ProjectedTestImage[50];
data long int RTemp[50];
data long int BTemp[50];

unsigned char txt2[15];
unsigned char txt1[15];
unsigned long int ii,jj,kk,mm,x1,y1,z1,p,q,row,col,k1,q1,q2,a1,ff,N,m1,tt;
unsigned long int WhoseEar;
unsigned long int TrainPicture,TestPicture,ClassNumber,ClassPopulation;
double temp1,temp2,temp3,temp4,temp5,NormFault;
double t,c,s;
double diag_toplam,PCA_TetaC,FLDA_TetaC,EpsilonK,jac_coe;
unsigned int iteration,basla,test_count,accuracy,QR_iteration;
bit convert_pca_flda;

void reset_zero(){
 ii=0;jj=0;kk=0;mm=0;x1=0;y1=0;z1=0;
 p=0;q=0;row=60;col=80;k1=0;q1=50;q2=60;a1=0;
 ff=0; N=50;m1=0;tt=0;
 temp1=0;temp2=0;temp3=0;temp4=0;temp5=0;NormFault=0;t=0;c=0;s=0;diag_toplam=0;
 WhoseEar=0; iteration=0; basla=0;test_count=0;accuracy=0;QR_iteration=0;
 ClassNumber=20;ClassPopulation=5;
 TrainPicture=ClassNumber*ClassPopulation;
 TestPicture=50;FLDA_TetaC=400;PCA_TetaC=1200;EpsilonK=0;jac_coe=0;

 for(ii=0;ii<N;ii++) ProjectedTestImage[ii]=0;
 for(ii=0;ii<row*col;ii++) m_ort[ii]=0;
 for(ii=0;ii<N;ii++) BTemp[ii] = 0;
 for(ii=0;ii<N;ii++) RTemp[ii] = ii;
 for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]=0; MTemp[ii]=0; }
 for(ii=0;ii<N;ii++) KTemp[ii]=0;

 for(y1=0;y1<TrainPicture;y1++){
 for(x1=0;x1<TrainPicture;x1++)
 L[x1][y1] = 0;}

 for(y1=0;y1<(ClassNumber-1);y1++){
 for(x1=0;x1<N;x1++)
 Fisher[x1][y1]=0;}

 for(y1=0;y1<N;y1++){
 for(x1=0;x1<N;x1++)
 SS[x1][y1] = 0;}


 for(y1=0;y1<TrainPicture;y1++){
 for(x1=0;x1<TrainPicture;x1++){
 if (x1==y1) V[x1][y1] = 1;
 else V[x1][y1] = 0;}}

}


void S1_START() {
 DrawScreen(&Screen2);
 reset_zero();
}

void FLDA_SELECT() {
 DrawScreen(&Screen3);
 convert_pca_flda = 1;
}

void PCA_SELECT() {
 DrawScreen(&Screen3);
 convert_pca_flda = 0;
}


void JACOBI_SELECT() {
 DrawScreen(&Screen5);
}


void J_E_2() {
 jac_coe = 0.01;
 if (convert_pca_flda == 0) DrawScreen(&Screen6);
 else DrawScreen(&Screen11);
}

void J_E_3() {
 jac_coe = 0.001;
 if (convert_pca_flda == 0) DrawScreen(&Screen6);
 else DrawScreen(&Screen11);
}

void J_E_4() {
 jac_coe = 0.0001;
 if (convert_pca_flda == 0) DrawScreen(&Screen6);
 else DrawScreen(&Screen11);
}

void J_E_5() {
 jac_coe = 0.00001;
 if (convert_pca_flda == 0) DrawScreen(&Screen6);
 else DrawScreen(&Screen11);
}

void J_E_6() {
 jac_coe = 0.000001;
 if (convert_pca_flda == 0) DrawScreen(&Screen6);
 else DrawScreen(&Screen11);
}

void J_E_7() {
 jac_coe = 0.0000001;
 if (convert_pca_flda == 0) DrawScreen(&Screen6);
 else DrawScreen(&Screen11);
}

void J_E_8() {
 jac_coe = 0.00000001;
 if (convert_pca_flda == 0) DrawScreen(&Screen6);
 else DrawScreen(&Screen11);
}
void projected_images_find (){

 for(ii=0;ii<row*col;ii++){
 temp1 = 0;
 for(x1=0;(x1<TrainPicture);x1++)
 temp1 = temp1 + Ear[row*col*x1+ii];
 m_ort[ii] = temp1/TrainPicture;}

 TFT_Write_Text("MEAN OK", 30, 30);
 TFT_Write_Text("L=A'*A ?", 30, 50);

 for(x1=0;x1<TrainPicture;x1++){
 for(y1=0;y1<TrainPicture;y1++){
 temp1 = 0;
 for(ii=0;ii<row*col;ii++)
 temp1 = temp1 + (ear[row*col*x1 + ii] - m_ort[ii])*(ear[row*col*y1 + ii] - m_ort[ii]);
 L[x1][y1] = temp1;}}

 TFT_Write_Text("L=A'*A OK", 30, 70);

 TFT_Write_Text("JACOBI ITERATION ?", 30, 90);

 temp1 = 0;
 for(y1=0;y1<TrainPicture;y1++){
 for(x1=0;x1<TrainPicture;x1++){
 if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
 temp1 = fabs(L[x1][y1]);
 p=x1;
 q=y1;}}}

 iteration = 0;
 basla = 1;
 while (basla==1){




 t = (L[p][q])/((L[q][q])-(L[p][p]));
 c = 1/(sqrt(t*t+1));
 s = t*c;

 for(y1=0;y1<TrainPicture;y1++){
 temp1 = L[p][y1];
 temp2 = L[q][y1];
 temp3 = temp1*c + temp2*(-s);
 temp4 = temp1*s + temp2*c;
 L[p][y1] = temp3;
 L[q][y1] = temp4;}

 for(x1=0;x1<TrainPicture;x1++){
 temp1 = L[x1][p];
 temp2 = L[x1][q];
 temp3 = temp1*c + temp2*(-s);
 temp4 = temp1*s + temp2*c;
 L[x1][p] = temp3;
 L[x1][q] = temp4;}

 for(x1=0;x1<TrainPicture;x1++){
 temp1 = V[x1][p];
 temp2 = V[x1][q];
 temp3 = temp1*c + temp2*(-s);
 temp4 = temp1*s + temp2*c;
 V[x1][p] = temp3;
 V[x1][q] = temp4;}

 temp1 = 0;
 for(y1=0;y1<TrainPicture;y1++){
 for(x1=0;x1<TrainPicture;x1++){
 if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
 temp1 = fabs(L[x1][y1]);
 p=x1;
 q=y1;}}}

 diag_toplam=0;
 for(x1=0;x1<TrainPicture;x1++) diag_toplam = diag_toplam + L[x1][x1]*L[x1][x1];
 if (fabs(L[p][q]) < jac_coe*sqrt(diag_toplam/TrainPicture)) basla = 0;




 iteration = iteration + 1;
 }

 TFT_Write_Text("JACOBI ITERATION OK", 30, 110);
 TFT_Write_Text("EIGENVECTOR ?", 30, 130);



 temp1 = -1e-10;
 for(y1=0;y1<TrainPicture;y1++){
 for(x1=y1;x1<TrainPicture;x1++){
 if (L[x1][x1] > temp1) {
 temp1 = L[x1][x1];
 ii = x1;}}
 L[ii][ii] = L[y1][y1];
 L[y1][y1] = temp1;
 temp1 = -1e-10;
 for(x1=0;x1<TrainPicture;x1++){
 GTemp[x1] = V[x1][ii];
 V[x1][ii] = V[x1][y1];
 V[x1][y1] = GTemp[x1];}}

 TFT_Write_Text("EIGENVECTOR OK", 30, 150);

 TFT_Write_Text("L=> ProjectedImages", 30, 170);

 for(y1=0;y1<TrainPicture;y1++){
 for(x1=0;x1<TrainPicture;x1++) L[x1][y1] = 0;}

 TFT_Write_Text("ProjectedImages ?", 30, 190);

 for(y1=0;y1<N;y1++){
 for(ii=0;ii<row*col;ii++){
 temp1 = 0;
 for(x1=0;x1<TrainPicture;x1++)
 temp1 = temp1 + (Ear[x1*row*col + ii] - m_ort[ii])*V[x1][y1];
 KTemp[y1] = KTemp[y1] + temp1*temp1;}}

 TFT_Write_Text("NORM KEEP OK", 30, 210);

 for(y1=0;y1<N;y1++){
 for(x1=0;x1<TrainPicture;x1++)
 V[x1][y1] = (V[x1][y1])/(sqrt(KTemp[y1]));}

 TFT_Write_Text("V=V/NORM KEEP OK", 30, 230);

 for(ii=0;ii<TrainPicture;ii++) GTemp[ii]=0;

 for(y1=0;y1<TrainPicture;y1++){
 for(x1=0;x1<TrainPicture;x1++){
 temp1 = 0;
 for(ii=0;ii<row*col;ii++)
 temp1 = temp1 + (Ear[y1*row*col+ii] - m_ort[ii])*(Ear[x1*row*col+ii] - m_ort[ii]);
 GTemp[x1] = temp1;}
 for(x1=0;x1<N;x1++){
 temp2 = 0;
 for(z1=0;z1<TrainPicture;z1++)
 temp2 = temp2 + V[z1][x1]*GTemp[z1];
 L[x1][y1] = temp2;}}

 TFT_Write_Text("ProjectedImages OK",30, 250);
}
void PCA_TRAINING_START() {
 DrawScreen(&Screen7);
 projected_images_find ();
 DrawScreen(&Screen8);
}

void PCA_TEST_START() {
 DrawScreen(&Screen9);
 test_count = 0;
 accuracy = 0;
 NormFault=0;
 for(jj=100;jj<TestPicture+100;jj++) {

 test_count = test_count + 1;
 IntToStr(test_count,txt1);
 TFT_Write_Text(txt1,30,40);
 TFT_Write_Text("TEST IMAGE", 60, 40);

 ii = 0;
 for(y1=0;y1<col;y1++){
 for(x1=0;x1<row;x1++){
 temp5 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
 TFT_Dot(x1+50, y1+60, temp5);
 ii = ii + 1;}}

 for(x1=0;x1<TrainPicture;x1++){
 temp1 = 0;
 for(ii=0;ii<row*col;ii++)
 temp1 = temp1 + (Ear[row*col*x1 + ii] - m_ort[ii])*(Ear[row*col*jj + ii] - m_ort[ii]);
 MTemp[x1] = temp1;}

 for(y1=0;y1<N;y1++){
 temp2 = 0;
 for(x1=0;x1<TrainPicture;x1++)
 temp2 = temp2 + V[x1][y1]*MTemp[x1];
 ProjectedTestImage[y1] = temp2;}

 EpsilonK = 1e+5;
 for(y1=0;y1<TrainPicture;y1++){
 temp4 = 0;
 for(x1=0;x1<N;x1++)
 temp4 = temp4 + (L[x1][y1] - ProjectedTestImage[x1])*(L[x1][y1] - ProjectedTestImage[x1]);
 temp4 = sqrt(temp4);
 if (temp4 < EpsilonK) {
 EpsilonK = temp4;
 WhoseEar = y1;}}


 NormFault = NormFault + (EpsilonK - PCA_ORJ[jj-100])*(EpsilonK - PCA_ORJ[jj-100]);


 if (EpsilonK < PCA_TetaC) {
 if (jj<120) accuracy += 2;
 TFT_Write_Text("This picture is ear", 30, 160);
 TFT_Write_Text("The ear is in the database", 30, 180);
 TFT_Write_Text("EpsilonK", 30, 200);
 FloatToStr(EpsilonK ,txt2);
 TFT_Write_Text(txt2,100,200);
 ii = 0;
 for(y1=0;y1<col;y1++){
 for(x1=0;x1<row;x1++){
 temp5 = TFT_RGBToColor16bit(Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii]);
 TFT_Dot(x1+130, y1+60, temp5);
 ii = ii + 1;}}
 }
 else {
 if (jj>=120) accuracy += 2;
 TFT_Write_Text("This is not in the database", 30, 180);
 TFT_Write_Text("EpsilonK", 30, 200);
 FloatToStr(EpsilonK ,txt2);
 TFT_Write_Text(txt2,100,200);
 }
 Delay_ms(1);
 DrawScreen(&Screen9);

 }
 NormFault = (100*sqrt(NormFault))/(1.296512347478959e+04);
 ProgressBar1.Position = accuracy+1;
 DrawScreen(&Screen10);
 TFT_Write_Text("iteration = >",10,60);
 IntToStr(iteration,txt1);
 TFT_Write_Text(txt1,120,60);
 TFT_Write_Text("Norm Fault = >",10,100);
 FloatToStr(NormFault,txt2);
 TFT_Write_Text(txt2,120,100);

}

void PCA_RESULTS_MAIN() {
 DrawScreen(&Screen1);
}

void FLDA_PART_1_START() {
 DrawScreen(&Screen12);
 projected_images_find ();
 DrawScreen(&Screen13);
}

void FLDA_PART_2_START() {
 DrawScreen(&Screen14);
}
void QR2_10() {
 QR_iteration = 10;
 DrawScreen(&Screen15);
}

void QR2_15() {
 QR_iteration = 15;
 DrawScreen(&Screen15);
}

void QR2_25() {
 QR_iteration = 25;
 DrawScreen(&Screen15);
}

void QR2_50() {
 QR_iteration = 50;
 DrawScreen(&Screen15);
}

void QR2_75() {
 QR_iteration = 75;
 DrawScreen(&Screen15);
}

void QR2_100() {
 QR_iteration = 100;
 DrawScreen(&Screen15);
}

void FLDA_CONTINUE() {
 DrawScreen(&Screen16);
 TFT_Write_Text("Sw ?", 30, 50);

 for(ii=0;ii<ClassNumber;ii++){

 for(x1=0;x1<N;x1++){
 temp1 = 0;
 for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
 temp1 = temp1 + L[x1][y1];
 GTemp[x1] = temp1/ClassPopulation;}

 for(y1=0;y1<N;y1++)
 for(x1=0;x1<N;x1++) V[x1][y1+50] = 0;

 for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++){
 for(z1=0;z1<N;z1++){
 for(x1=0;x1<N;x1++)
 V[x1][z1+50] = V[x1][z1+50] + (L[x1][y1]-GTemp[x1])*(L[z1][y1]-GTemp[x1]); }}

 for(y1=0;y1<N;y1++){
 for(x1=0;x1<N;x1++)
 SS[x1][y1] = SS[x1][y1] + V[x1][y1+50];} }

 TFT_Write_Text("Sw OK", 30, 70);
 TFT_Write_Text("inv(Sw) ?", 30, 90);

 for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]= 0; MTemp[ii] = 0; }
 for(ii=0;ii<N;ii++) BTemp[ii] = 0;
 for(ii=0;ii<N;ii++) RTemp[ii] = ii;

 for(p=0;p<(N-1);p++){

 temp1 = 0;
 for(x1=p;x1<N;x1++){
 if (fabs(SS[x1][p]) > temp1) {
 temp1 = fabs(SS[x1][p]);
 jj=x1;}}

 for(ii=0;ii<N;ii++){
 temp2 = SS[p][ii];
 SS[p][ii] = SS[jj][ii];
 SS[jj][ii] = temp2;}

 mm = RTemp[p];
 RTemp[p] = RTemp[jj];
 RTemp[jj] = mm;

 for (kk=(p+1);kk<N;kk++){
 temp3 = SS[kk][p]/SS[p][p];
 SS[kk][p] = temp3;
 for(ii=(p+1);ii<N;ii++)
 SS[kk][ii] = SS[kk][ii] - temp3*SS[p][ii]; }
 }
 x1 = 0;
 for(jj=0;jj<N;jj++){

 for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]= 0; MTemp[ii] = 0;}

 for(ii=0;ii<N;ii++){
 if (x1 == ii) BTemp[ii] = 1;
 else BTemp[ii] = 0;}


 mm = RTemp[0];
 MTemp[0] = BTemp[mm];
 for (kk=1;kk<N;kk++){
 temp4 = 0;
 for (z1=0;z1<(kk);z1++)
 temp4 = temp4 + SS[kk][z1]*MTemp[z1];
 mm = RTemp[kk];
 MTemp[kk] = BTemp[mm] - temp4;}


 GTemp[N-1] = MTemp[N-1]/SS[N-1][N-1];
 for (kk=0;kk<(N-1);kk++){
 temp5 = 0;
 for (z1=(N-1-kk);z1<N;z1++)
 temp5 = temp5 + SS[N-2-kk][z1]*GTemp[z1];
 GTemp[N-2-kk] = (MTemp[N-2-kk] - temp5)/SS[N-2-kk][N-2-kk];}

 for(kk=0;kk<N;kk++)
 V[kk][jj+50] = GTemp[kk];
 x1 = x1 + 1;
 }

 TFT_Write_Text("inv(Sw) OK",30, 110);
 TFT_Write_Text("Sb ?", 30, 130);

 for(x1=0;x1<N;x1++){
 temp1 = 0;
 for(y1=0;y1<TrainPicture;y1++)
 temp1 = temp1 + L[x1][y1];
 Mtemp[x1] = temp1/TrainPicture;}

 for(x1=0;x1<N;x1++)
 for(y1=0;y1<N;y1++) L[x1+50][y1] = 0;

 for(ii=0;ii<ClassNumber;ii++){

 for(x1=0;x1<N;x1++){
 temp1 = 0;
 for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
 temp1 = temp1 + L[x1][y1];
 GTemp[x1] = temp1/ClassPopulation;}

 for(x1=0;x1<N;x1++){
 for(y1=0;y1<N;y1++)
 L[x1+50][y1] = L[x1+50][y1] + (GTemp[x1]-Mtemp[x1])*(GTemp[y1]-Mtemp[y1]);}
 }
 TFT_Write_Text("Sb OK", 30, 150);

 for(x1=0;x1<N;x1++){
 for(y1=0;y1<N;y1++){
 temp3 = 0;
 for(z1=0;z1<N;z1++)
 temp3 = temp3 + V[x1][z1+50]*L[z1+50][y1];
 SS[x1][y1] = temp3;}}

 TFT_Write_Text("S OK", 30, 170);
 TFT_Write_Text("QR Algorithm Start", 30, 190);
 for(x1=0;x1<N;x1++){
 for(y1=0;y1<N;y1++)
 L[50+x1][y1] = SS[x1][y1];}

 for(y1=0;y1<N;y1++){
 for(x1=0;x1<N;x1++){
 if (x1==y1) V[x1][y1+50] = 1;
 else V[x1][y1+50] = 0;}}

 for(ii=0;ii<QR_iteration;ii++){

 for(x1=0;x1<N;x1++){
 for(y1=0;y1<N;y1++)
 L[50+x1][50+y1] = 0;}

 for(kk=0;kk<N;kk++){
 for(jj=0;jj<kk;jj++){
 temp3 = 0;
 for(x1=0;x1<N;x1++)
 temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];
 L[50+jj][50+kk] = temp3;
 for(x1=0;x1<N;x1++)
 MTemp[x1] = L[50+jj][50+kk]*L[50+x1][jj];
 for(x1=0;x1<N;x1++)
 GTemp[x1] = L[50+x1][kk] - MTemp[x1] ;
 for(x1=0;x1<N;x1++)
 L[50+x1][kk] = GTemp[x1]; }

 temp1 = 0;
 for(x1=0;x1<N;x1++)
 temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
 L[50+kk][50+kk] = sqrt(temp1);

 for(x1=0;x1<N;x1++)
 L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
 }

 for(x1=0;x1<N;x1++){
 for(m1=0;m1<N;m1++)
 GTemp[m1] = V[x1][m1+50];
 for(y1=0;y1<N;y1++){
 temp3 = 0;
 for(z1=0;z1<N;z1++)
 temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
 V[x1][y1+50] = temp3;}}

 for(y1=0;y1<N;y1++){
 for(m1=0;m1<N;m1++)
 GTemp[m1] = L[50+m1][y1];
 for(x1=0;x1<N;x1++){
 temp3 = 0;
 for(z1=0;z1<N;z1++)
 temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
 L[50+x1][y1] = temp3;}}
 }


 for(x1=0;x1<N;x1++)
 KTemp[x1] = L[50+x1][x1];

 TFT_Write_Text("Eigenvalue OK", 30, 210);
 TFT_Write_Text("FISHER Eigenvector ?", 30, 230);
 for(x1=0;x1<N;x1++)
 Fisher[x1][0] = V[x1][0+50];

 for(tt=1;tt<ClassNumber-1;tt++) {

 for(x1=0;x1<N;x1++){
 for(y1=0;y1<N;y1++)
 V[50+x1][y1+50] = SS[x1][y1];}

 for(x1=0;x1<N;x1++)
 V[50+x1][x1+50] = SS[x1][x1] - KTemp[tt];

 for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]= 0; MTemp[ii] = 0; }
 for(ii=0;ii<N;ii++) BTemp[ii] = 0;
 for(ii=0;ii<N;ii++) RTemp[ii] = ii;
 TFT_Write_Text("inverse ?", 30, 250);
 for(p=0;p<(N-1);p++){

 temp1 = 0;
 for(x1=p;x1<N;x1++){
 if (fabs(V[x1+50][p+50]) > temp1) {
 temp1 = fabs(V[x1+50][p+50]);
 jj=x1;}}

 for(ii=0;ii<N;ii++){
 temp2 = V[p+50][ii+50];
 V[p+50][ii+50] = V[jj+50][ii+50];
 V[jj+50][ii+50] = temp2;}

 mm = RTemp[p];
 RTemp[p] = RTemp[jj];
 RTemp[jj] = mm;

 for (kk=(p+1);kk<N;kk++){
 temp3 = V[kk+50][p+50]/V[p+50][p+50];
 V[kk+50][p+50] = temp3;
 for(ii=(p+1);ii<N;ii++)
 V[kk+50][ii+50] = V[kk+50][ii+50] - temp3*V[p+50][ii+50]; }
 }
 x1 = 0;
 for(jj=0;jj<N;jj++){

 for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]= 0; MTemp[ii] = 0;}

 for(ii=0;ii<N;ii++){
 if (x1 == ii) BTemp[ii] = 1;
 else BTemp[ii] = 0;}


 mm = RTemp[0];
 MTemp[0] = BTemp[mm];
 for (kk=1;kk<N;kk++){
 temp4 = 0;
 for (z1=0;z1<(kk);z1++)
 temp4 = temp4 + V[kk+50][z1+50]*MTemp[z1];
 mm = RTemp[kk];
 MTemp[kk] = BTemp[mm] - temp4;}


 GTemp[N-1] = MTemp[N-1]/V[N-1+50][N-1+50];
 for (kk=0;kk<(N-1);kk++){
 temp5 = 0;
 for (z1=(N-1-kk);z1<N;z1++)
 temp5 = temp5 + V[N-2-kk+50][z1+50]*GTemp[z1];
 GTemp[N-2-kk] = (MTemp[N-2-kk] - temp5)/V[N-2-kk+50][N-2-kk+50];}

 for(kk=0;kk<N;kk++)
 L[50+kk][jj] = GTemp[kk];
 x1 = x1 + 1;
 }
 TFT_Write_Text("inverse OK", 30, 270);


 for(y1=0;y1<N;y1++){
 for(x1=0;x1<N;x1++){
 if (x1==y1) V[x1][y1+50] = 1;
 else V[x1][y1+50] = 0;}}

 for(ii=0;ii<QR_iteration;ii++){

 for(x1=0;x1<N;x1++){
 for(y1=0;y1<N;y1++)
 L[50+x1][50+y1] = 0;}

 for(kk=0;kk<N;kk++){
 for(jj=0;jj<kk;jj++){
 temp3 = 0;
 for(x1=0;x1<N;x1++)
 temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];
 L[50+jj][50+kk] = temp3;
 for(x1=0;x1<N;x1++)
 MTemp[x1] = L[50+jj][50+kk]*L[50+x1][jj];
 for(x1=0;x1<N;x1++)
 GTemp[x1] = L[50+x1][kk] - MTemp[x1] ;
 for(x1=0;x1<N;x1++)
 L[50+x1][kk] = GTemp[x1]; }

 temp1 = 0;
 for(x1=0;x1<N;x1++)
 temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
 L[50+kk][50+kk] = sqrt(temp1);

 for(x1=0;x1<N;x1++)
 L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
 }

 for(x1=0;x1<N;x1++){
 for(m1=0;m1<N;m1++)
 GTemp[m1] = V[x1][m1+50];
 for(y1=0;y1<N;y1++){
 temp3 = 0;
 for(z1=0;z1<N;z1++)
 temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
 V[x1][y1+50] = temp3;}}

 for(y1=0;y1<N;y1++){
 for(m1=0;m1<N;m1++)
 GTemp[m1] = L[50+m1][y1];
 for(x1=0;x1<N;x1++){
 temp3 = 0;
 for(z1=0;z1<N;z1++)
 temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
 L[50+x1][y1] = temp3;}}



 }

 for(x1=0;x1<N;x1++)
 Fisher[x1][tt] = V[x1][0+50];
 TFT_Write_Text("FISHER Eigenvector OK", 30, 290);
 }

 for(x1=0;x1<(ClassNumber-1);x1++){
 for(y1=0;y1<TrainPicture;y1++){
 temp3 = 0;
 for(z1=0;z1<N;z1++)
 temp3 = temp3 + Fisher[z1][x1]*L[z1][y1];
 L[x1+50][y1] = temp3;}}

 TFT_Write_Text("QR Algorithm Finish", 30, 310);

 DrawScreen(&Screen17);
}

void FLDA_TEST() {
 DrawScreen(&Screen18);
 test_count = 0;
 accuracy = 0;
 NormFault=0;
 for(jj=100;jj<TestPicture+100;jj++) {

 test_count = test_count + 1;
 IntToStr(test_count,txt1);
 TFT_Write_Text(txt1,30,40);
 TFT_Write_Text("TEST IMAGE", 60, 40);

 ii = 0;
 for(y1=0;y1<col;y1++){
 for(x1=0;x1<row;x1++){
 temp5 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
 TFT_Dot(x1+50, y1+60, temp5);
 ii = ii + 1;}}

 for(x1=0;x1<TrainPicture;x1++){
 temp1 = 0;
 for(ii=0;ii<row*col;ii++)
 temp1 = temp1 + (ear[row*col*x1 + ii] - m_ort[ii])*(ear[row*col*jj + ii] - m_ort[ii]);
 MTemp[x1] = temp1;}

 for(y1=0;y1<N;y1++){
 temp2 = 0;
 for(x1=0;x1<TrainPicture;x1++)
 temp2 = temp2 + V[x1][y1]*MTemp[x1];
 GTemp[y1] = temp2;}

 for(y1=0;y1<(ClassNumber-1);y1++){
 temp3 = 0;
 for(x1=0;x1<N;x1++)
 temp3 = temp3 + Fisher[x1][y1]*GTemp[x1];
 ProjectedTestImage[y1] = temp3;}

 EpsilonK = 1e+5;
 for(y1=0;y1<TrainPicture;y1++){
 temp4 = 0;
 for(x1=0;x1<(ClassNumber-1);x1++)
 temp4 = temp4 + (L[x1+50][y1] - ProjectedTestImage[x1])*(L[x1+50][y1] - ProjectedTestImage[x1]);
 temp4 = sqrt(temp4);
 if (temp4 < EpsilonK) {
 EpsilonK = temp4;
 WhoseEar = y1;}}


 NormFault = NormFault + (EpsilonK - FLDA_ORJ[jj-100])*(EpsilonK - FLDA_ORJ[jj-100]);



 if (EpsilonK < FLDA_TetaC) {
 if (jj<120) accuracy += 2;
 TFT_Write_Text("This picture is ear", 30, 160);
 TFT_Write_Text("The ear is in the database", 30, 180);
 TFT_Write_Text("Epsilon", 30, 200);
 FloatToStr(EpsilonK ,txt2);
 TFT_Write_Text(txt2,100,200);
 ii = 0;
 for(y1=0;y1<col;y1++){
 for(x1=0;x1<row;x1++){
 temp5 = TFT_RGBToColor16bit(Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii]);
 TFT_Dot(x1+130, y1+60, temp5);
 ii = ii + 1;}}
 }
 else {
 if (jj>=120) accuracy += 2;
 TFT_Write_Text("This is not in the database", 30, 180);
 TFT_Write_Text("Epsilon", 30, 200);
 FloatToStr(EpsilonK ,txt2);
 TFT_Write_Text(txt2,100,200);
 }
 Delay_ms(1);
 DrawScreen(&Screen18);
 }
 NormFault = (100*sqrt(NormFault))/(5.844566796674060e+03);
 ProgressBar2.Position = accuracy+1;
 DrawScreen(&Screen19);
 TFT_Write_Text("iteration = >",10,60);
 IntToStr(iteration,txt1);
 TFT_Write_Text(txt1,120,60);
 TFT_Write_Text("Norm Fault = >",10,100);
 FloatToStr(NormFault,txt2);
 TFT_Write_Text(txt2,120,100);

}

void FLDA_RESULTS_MAIN() {
 DrawScreen(&Screen1);
}

void DATABASE_SHOW() {
 DrawScreen(&Screen20);

 for(jj=0;jj<TrainPicture;jj=jj+4){
 Delay_ms(100);
 ii=0;
 for(y1=0;y1<col;y1++){
 for(x1=0;x1<row;x1++){
 temp1 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
 TFT_Dot(x1+50,y1+80,temp1);
 ii=ii+1;}}

 ii=0;
 for(y1=0;y1<col;y1++){
 for(x1=0;x1<row;x1++){
 temp1 = TFT_RGBToColor16bit(Ear[(jj+1)*row*col+ii], Ear[(jj+1)*row*col+ii], Ear[(jj+1)*row*col+ii]);
 TFT_Dot(x1+130,y1+80,temp1);
 ii=ii+1;}}

 ii=0;
 for(y1=0;y1<col;y1++){
 for(x1=0;x1<row;x1++){
 temp1 = TFT_RGBToColor16bit(Ear[(jj+2)*row*col+ii], Ear[(jj+2)*row*col+ii], Ear[(jj+2)*row*col+ii]);
 TFT_Dot(x1+50,y1+200,temp1);
 ii=ii+1;}}

 ii=0;
 for(y1=0;y1<col;y1++){
 for(x1=0;x1<row;x1++){
 temp1 = TFT_RGBToColor16bit(Ear[(jj+3)*row*col+ii], Ear[(jj+3)*row*col+ii], Ear[(jj+3)*row*col+ii]);
 TFT_Dot(x1+130,y1+200,temp1);
 ii=ii+1;}}

 }

 Delay_ms(1000);
 DrawScreen(&Screen1);
}
