#include "DCVA_GUI_objects.h"
#include "DCVA_GUI_resources.h"

//--------------------- User code ---------------------//

//----------------- End of User code ------------------//

// Event Handlers
#include "Ear_database.h"
typedef struct divstruct {
             int quot;
             int rem;
 } div_t;
 
data double DCVA_ORJ[50]={
114.357611873685,
107.201856297394,
91.5319684130097,
367.753484962028,
294.798381806336,
86.2136248727765,
168.051816393865,
121.594590256680,
72.7363380718682,
318.782339857449,
158.342583503426,
136.425328382849,
98.9056411565479,
94.1098760204346,
221.351947310988,
112.006388435835,
142.736541352358,
167.834033060469,
271.042153846061,
200.627290414036,
613.642724035012,
673.402616018175,
500.732435104509,
513.548860941358,
439.664447323004,
629.954706183277,
679.012344093103,
612.663604714197,
694.718350499133,
546.260161002012,
835.173128552694,
658.508689283077,
725.378227610973,
600.532352252335,
665.608840724793,
694.380006021776,
631.514577615233,
734.792528981682,
658.559594404932,
597.023334842975,
2257.90343176960,
1611.39989771695,
1122.06214563405,
1552.83009366687,
1484.51557179464,
920.542089094853,
1656.67338530725,
1306.15674338950,
751.527517365645,
1242.89196920398};
data double L[100][100];
data double V[100][100];
data double R[100][100];
ccm  double D[100][100];
data double SL[20][20];
data double SV[20][20];
data double MTemp[100];
data double GTemp[100];
data double ProjectedTestImage[19];
unsigned char txt1[15],txt2[15],tempk1,tempk2,tempk3;
unsigned long int ii,jj,kk,mm,x1,y1,z1,p,q,row,col,k1,q1,q2,a1,ff,N,m1,tt;
unsigned long int WhoseEar;
unsigned long int TrainPicture,TestPicture,ClassNumber,ClassPopulation;
data unsigned int histogram[256];
double temp1,temp2,temp3,temp4,temp5,NormFault;
double t,c,s;
double diag_toplam,DCVA_TetaC,EpsilonK,jac_coe;
unsigned int iteration1,iteration2,iteration3,ite_total,basla,test_count,accuracy;
div_t dd;

ValueZero(){

  ClassNumber=20;ClassPopulation=5;
  N=99;
  TrainPicture=ClassNumber*ClassPopulation;
  ii=0;jj=0;kk=0;mm=0;x1=0;y1=0;z1=0;
  p=0;q=0;row=60;col=80;k1=0;q1=50;q2=60;a1=0;
  ff=0; m1=0;tt=0;
  tempk1=0;tempk2=0;tempk3=0;
  temp1=0;temp2=0;temp3=0;temp4=0;temp5=0;NormFault=0;t=0;c=0;s=0;diag_toplam=0;
  WhoseEar=0;  basla=0;test_count=0;accuracy=0;
  TestPicture=50;DCVA_TetaC=400;EpsilonK=0;
  iteration1=0;iteration2=0;iteration3=0;ite_total=0;
  for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]=0; MTemp[ii]=0;}

  for(ii=0;ii<(ClassNumber-1);ii++) ProjectedTestImage[ii]=0;

  for(y1=0;y1<TrainPicture;y1++){       //V ilk deðer atama eye(n) birim matris
      for(x1=0;x1<TrainPicture;x1++){
          if (x1==y1) V[x1][y1] = 1;
          else        V[x1][y1] = 0;}}

  for(y1=0;y1<TrainPicture;y1++){
      for(x1=0;x1<TrainPicture;x1++){
          D[x1][y1] = 0;  R[x1][y1] = 0; L[x1][y1] = 0;}}

  for(y1=0;y1<ClassNumber;y1++){
      for(x1=0;x1<ClassNumber;x1++){
          SL[x1][y1] = 0; SV[x1][y1] = 0;}}   
          
  for(x1=0;x1<256;x1++) histogram[x1]=0;
              
}

void DCVA_START() {
   DrawScreen(&Screen5);
}

void J_E_2() {
     jac_coe=0.01;
     DrawScreen(&Screen6);
}

void J_E_3() {
     jac_coe=0.001;
     DrawScreen(&Screen6);
}

void J_E_4() {
     jac_coe=0.0001;
     DrawScreen(&Screen6);
}

void J_E_5() {
    jac_coe=0.00001;
    DrawScreen(&Screen6);
}

void J_E_6() {
    jac_coe=0.000001;
    DrawScreen(&Screen6);
}

void J_E_7() {
     jac_coe=0.0000001;
     DrawScreen(&Screen6);
     
}

void J_E_8() {
     jac_coe=0.00000001;
    DrawScreen(&Screen6);
}

void J_E_9() {
     jac_coe=0.000000001;
    DrawScreen(&Screen6);
}

void DCVA_TRAINING() {

  ValueZero();
  DrawScreen(&Screen2);

  for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1
        dd = div(ii,100);
        temp1 = 0;
        for(z1=0;(z1<TrainPicture);z1++)
            temp1 =  temp1 + Ear[row*col*z1+ii];
        R[dd.quot][dd.rem] = temp1/TrainPicture;}

   TFT_Write_Text("MEAN OK", 30, 30);
   TFT_Write_Text("L=A'*A ?", 30, 50);

   for(x1=0;x1<TrainPicture;x1++){        // L = A'*A;
       for(y1=0;y1<TrainPicture;y1++){
           temp1 = 0;
           for(ii=0;ii<row*col;ii++){
               dd = div(ii,100);
               temp1 = temp1 + (ear[row*col*x1 + ii] - R[dd.quot][dd.rem])*(ear[row*col*y1 + ii] - R[dd.quot][dd.rem]);}
           L[x1][y1] = temp1;}}

   TFT_Write_Text("L=A'*A OK", 30, 70);
   TFT_Write_Text("JACOBI ITERATION ?", 30, 90);

    temp1 = 0;      //en büyük deðer bulma
    for(y1=0;y1<TrainPicture;y1++){
        for(x1=0;x1<TrainPicture;x1++){
            if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
                temp1 = fabs(L[x1][y1]);
                p=x1;
                q=y1;}}}

      iteration1 = 0;
      basla = 1;                              // jacobi iteration döngü baþangýcý
      while (basla==1){

            IntToStr(iteration1,txt1);
            TFT_Write_Text(txt1,120,60);

            t = (L[p][q])/((L[q][q])-(L[p][p]));
            c = 1/(sqrt(t*t+1));
            s = t*c;

            for(y1=0;y1<TrainPicture;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
               temp1 = L[p][y1];
               temp2 = L[q][y1];
               temp3 = temp1*c + temp2*(-s);
               temp4 = temp1*s + temp2*c;
               L[p][y1] = temp3;
               L[q][y1] = temp4;}

            for(x1=0;x1<TrainPicture;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
               temp1 = L[x1][p];
               temp2 = L[x1][q];
               temp3 = temp1*c + temp2*(-s);
               temp4 = temp1*s + temp2*c;
               L[x1][p] = temp3;
               L[x1][q] = temp4;}

            for(x1=0;x1<TrainPicture;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
                temp1 = V[x1][p];
                temp2 = V[x1][q];
                temp3 = temp1*c + temp2*(-s);
                temp4 = temp1*s + temp2*c;
                V[x1][p] = temp3;
                V[x1][q] = temp4;}

           temp1 = 0;      //en büyük deðer bulma
           for(y1=0;y1<TrainPicture;y1++){
               for(x1=0;x1<TrainPicture;x1++){
                   if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
                       temp1 = fabs(L[x1][y1]);
                       p=x1;
                       q=y1;}}}

           diag_toplam=0;            // döngüden çýkma eþik deðeri
           for(x1=0;x1<TrainPicture;x1++)  diag_toplam = diag_toplam + L[x1][x1]*L[x1][x1];
           if (fabs(L[p][q]) < jac_coe*sqrt(diag_toplam/TrainPicture)) basla = 0; //e-5 yaptý e-7 yapmadý

          for(y1=60;y1<80;y1++){
              for(x1=120;x1<160;x1++)
                  TFT_Dot(x1, y1, CL_BLUE);}
          iteration1 = iteration1 + 1;
      }

      TFT_Write_Text("JACOBI ITERATION OK", 30, 110);
      TFT_Write_Text("EIGENVECTOR ?", 30, 130);

      // L[x1][x1]  = > EigenValue  100 adet

      temp1 = -1e+20;
      for(y1=0;y1<TrainPicture;y1++){
          for(x1=y1;x1<TrainPicture;x1++){
              if (L[x1][x1] > temp1) {
                  temp1 =  L[x1][x1];
                  ii = x1;}}
          L[ii][ii] =  L[y1][y1];
          L[y1][y1] = temp1;
          temp1 = -1e+20;
          for(x1=0;x1<TrainPicture;x1++){
              temp2 = V[x1][ii];
              V[x1][ii] = V[x1][y1];
              V[x1][y1] = temp2;}}   // V[100][100]  but V[100][99]  only 1 eigenvector is rubbish

     TFT_Write_Text("EIGENVECTOR OK", 30, 150);


     TFT_Write_Text("L=> ProjectedImages", 30, 170);

     for(y1=0;y1<TrainPicture;y1++){
         for(x1=0;x1<TrainPicture;x1++)
             L[x1][y1] = 0;}

     TFT_Write_Text("ProjectedImages ?", 30, 190);

     for(y1=0;y1<N;y1++){   // V[100][99]       N=99;
         for(ii=0;ii<row*col;ii++){        //(row*col x picture)(picture x picture - ClassNumber)
             dd = div(ii,100);
             temp1 = 0;                    // MTemp => norm tutucu
             for(x1=0;x1<TrainPicture;x1++)
                  temp1 = temp1 + (Ear[x1*row*col + ii] - R[dd.quot][dd.rem])*V[x1][y1]; //A*V
              MTemp[y1] =  MTemp[y1] + temp1*temp1;}}

    TFT_Write_Text("NORM KEEP OK", 30, 210);

      for(y1=0;y1<N;y1++){        // V=V/norm_tutucu       100x99
         for(x1=0;x1<TrainPicture;x1++)
             V[x1][y1] = (V[x1][y1])/(sqrt(MTemp[y1]));}

     TFT_Write_Text("V=V/NORM KEEP OK", 30, 230);

    for(x1=0;x1<TrainPicture;x1++){        // D = V
          for(y1=0;y1<TrainPicture;y1++)
              D[x1][y1] = V[x1][y1];}

      for(y1=0;y1<TrainPicture;y1++){
          for(x1=0;x1<TrainPicture;x1++){        //(picture x row*col)(row*col x 1)
              temp1 = 0;
              for(ii=0;ii<row*col;ii++){     // Gtemp = A' * (EarNumber-m_ort)
                  dd = div(ii,100);
                  temp1 = temp1 + (Ear[y1*row*col+ii] - R[dd.quot][dd.rem])*(Ear[x1*row*col+ii] - R[dd.quot][dd.rem]);}
              GTemp[x1] =  temp1;}
         for(x1=0;x1<N;x1++){   // ProjectedImages = V' *  GTemp = V' * A' * (EarNumber-m_ort)
             temp2 = 0;
             for(z1=0;z1<TrainPicture;z1++)
                 temp2 = temp2 + V[z1][x1]*GTemp[z1]; // L'=L[y1][x1]; L= L[x1][y1]
             L[x1][y1] = temp2;}} //L[x1][y1] => ProjectedImages[x1][y1]

    TFT_Write_Text("ProjectedImages OK",30, 250);
    TFT_Write_Text("Sw=Aw*Aw' ?", 30, 270);

    for(ii=0;ii<ClassNumber;ii++){
        for(x1=0;x1<N;x1++){
            temp1 = 0;
            for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
                temp1 = temp1 + L[x1][y1];         //  ProjectedImages[99][100]
            temp2 = temp1/ClassPopulation;
            for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
                V[x1][y1] = L[x1][y1] - temp2;  }}    // V[99][100] geçiçi => A matris Sw=A*A'

    for(x1=0;x1<N;x1++){        // Sw=A*A'   A[99][100] * A'[100][99]
        for(y1=0;y1<N;y1++){
            temp1 = 0;
            for(z1=0;z1<TrainPicture;z1++)
                temp1 = temp1 + V[x1][z1] * V[y1][z1];
            R[x1][y1] = temp1;}}   // R[99][99] => Sw=A*A'

    TFT_Write_Text("Sw=Aw*Aw' OK", 30, 290);

    for(y1=0;y1<TrainPicture;y1++){       //V   birim matris
        for(x1=0;x1<TrainPicture;x1++){
            if (x1==y1) V[x1][y1] = 1;
            else        V[x1][y1] = 0;}}

   TFT_Fill_Screen(CL_BLUE);
   TFT_Write_Text("JACOBI ITERATION-2 ?", 30, 30);     //[V D] = eig(Sw);  R[99][99]

    temp1 = 0;      //en büyük deðer bulma
    for(y1=0;y1<N;y1++){
        for(x1=0;x1<N;x1++){
            if ((fabs(R[x1][y1]) > temp1) && (x1 != y1)) {
                temp1 = fabs(R[x1][y1]);
                p=x1;
                q=y1;}}}

      iteration2 = 0;
      basla = 1;                              // jacobi iteration döngü baþangýcý
      while (basla==1){

            IntToStr(iteration2,txt1);
            TFT_Write_Text(txt1,120,60);

            t = (R[p][q])/((R[q][q])-(R[p][p]));
            c = 1/(sqrt(t*t+1));
            s = t*c;

            for(y1=0;y1<N;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
               temp1 = R[p][y1];
               temp2 = R[q][y1];
               temp3 = temp1*c + temp2*(-s);
               temp4 = temp1*s + temp2*c;
               R[p][y1] = temp3;
               R[q][y1] = temp4;}

            for(x1=0;x1<N;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
               temp1 = R[x1][p];
               temp2 = R[x1][q];
               temp3 = temp1*c + temp2*(-s);
               temp4 = temp1*s + temp2*c;
               R[x1][p] = temp3;
               R[x1][q] = temp4;}

            for(x1=0;x1<N;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
                temp1 = V[x1][p];
                temp2 = V[x1][q];
                temp3 = temp1*c + temp2*(-s);
                temp4 = temp1*s + temp2*c;
                V[x1][p] = temp3;
                V[x1][q] = temp4;}

           temp1 = 0;      //en büyük deðer bulma
           for(y1=0;y1<N;y1++){
               for(x1=0;x1<N;x1++){
                   if ((fabs(R[x1][y1]) > temp1) && (x1 != y1)) {
                       temp1 = fabs(R[x1][y1]);
                       p=x1;
                       q=y1;}}}

           diag_toplam=0;            // döngüden çýkma eþik deðeri
           for(x1=0;x1<N;x1++)  diag_toplam = diag_toplam + R[x1][x1]*R[x1][x1];
           if (fabs(R[p][q]) < jac_coe*sqrt(diag_toplam/N)) basla = 0;

            for(y1=60;y1<80;y1++){
                for(x1=120;x1<160;x1++)
                   TFT_Dot(x1, y1, CL_BLUE);}
          iteration2 = iteration2 + 1;
      }

      TFT_Write_Text("JACOBI ITERATION-2 OK", 30, 50);
      TFT_Write_Text("V_Sw ?", 30, 70);

      // R[x1][x1]  = > EigenValue  99 adet

      temp1 = -1e+20;
      for(y1=0;y1<N;y1++){
          for(x1=y1;x1<N;x1++){
              if (R[x1][x1] > temp1) {
                  temp1 =  R[x1][x1];
                  ii = x1;}}
          R[ii][ii] =  R[y1][y1];
          R[y1][y1] = temp1;
          temp1 = -1e+20;
          for(x1=0;x1<N;x1++){
              temp2 = V[x1][ii];
              V[x1][ii] = V[x1][y1];
              V[x1][y1] = temp2;}}  // V[99][99]  but V_Sw[99][80]  19 eigenvectors are rubbish

     TFT_Write_Text("V_Sw OK", 30, 90);

     for(x1=0;x1<N;x1++){        // R[99][99]=V_Sw[99][80] * V_Sw'[80][99]=
         for(y1=0;y1<N;y1++){
             temp1 = 0;
             for(z1=0;z1<N-(ClassNumber-1);z1++)
                 temp1 = temp1 + V[x1][z1]* V[y1][z1];
             R[x1][y1] = temp1; }}

     for(ii=0;ii<ClassNumber;ii++){
         for(x1=0;x1<N;x1++){
             temp1 = 0;
             for(z1=0;z1<N;z1++)
                 temp1 = temp1 + R[x1][z1]*L[z1][ClassPopulation*ii];
             V[x1][ii] = L[x1][ClassPopulation*ii] - temp1;}}      // V[99][20] => Xcom

    TFT_Write_Text("Xcom OK", 30, 110);

    for(x1=0;x1<N;x1++){
        temp1 = 0;
        for(y1=0;y1<ClassNumber;y1++)
            temp1 = temp1 + V[x1][y1];
        temp2 = temp1/ClassNumber;
        for(y1=0;y1<ClassNumber;y1++)
            V[x1][y1] = V[x1][y1] - temp2;}     // V[99][20] => Xcom => convert => Acom

    TFT_Write_Text("Acom OK", 30, 130);

    for(x1=0;x1<ClassNumber;x1++){        // SL[20][20] = SLcom = Acom'[20][99] * Acom[99][20]=
        for(y1=0;y1<ClassNumber;y1++){
            temp1 = 0;
            for(z1=0;z1<N;z1++)
                temp1 = temp1 + V[z1][x1]* V[z1][y1];
            SL[x1][y1] = temp1; }}

    TFT_Write_Text("SLcom OK", 30, 150);

    for(y1=0;y1<ClassNumber;y1++){       //SV   birim matris
        for(x1=0;x1<ClassNumber;x1++){
            if (x1==y1) SV[x1][y1] = 1;
            else        SV[x1][y1] = 0;}}

    TFT_Write_Text("JACOBI ITERATION-3 ?", 30, 170);

    temp1 = 0;      //en büyük deðer bulma
    for(y1=0;y1<ClassNumber;y1++){
        for(x1=0;x1<ClassNumber;x1++){
            if ((fabs(SL[x1][y1]) > temp1) && (x1 != y1)) {
                temp1 = fabs(SL[x1][y1]);
                p=x1;
                q=y1;}}}

      iteration3 = 0;
      basla = 1;                              // jacobi iteration döngü baþangýcý
      while (basla==1){

            IntToStr(iteration3,txt1);
            TFT_Write_Text(txt1,120,60);

            t = (SL[p][q])/((SL[q][q])-(SL[p][p]));
            c = 1/(sqrt(t*t+1));
            s = t*c;

            for(y1=0;y1<ClassNumber;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
               temp1 = SL[p][y1];
               temp2 = SL[q][y1];
               temp3 = temp1*c + temp2*(-s);
               temp4 = temp1*s + temp2*c;
               SL[p][y1] = temp3;
               SL[q][y1] = temp4;}

            for(x1=0;x1<ClassNumber;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
               temp1 = SL[x1][p];
               temp2 = SL[x1][q];
               temp3 = temp1*c + temp2*(-s);
               temp4 = temp1*s + temp2*c;
               SL[x1][p] = temp3;
               SL[x1][q] = temp4;}

            for(x1=0;x1<ClassNumber;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
                temp1 = SV[x1][p];
                temp2 = SV[x1][q];
                temp3 = temp1*c + temp2*(-s);
                temp4 = temp1*s + temp2*c;
                SV[x1][p] = temp3;
                SV[x1][q] = temp4;}

           temp1 = 0;      //en büyük deðer bulma
           for(y1=0;y1<ClassNumber;y1++){
               for(x1=0;x1<ClassNumber;x1++){
                   if ((fabs(SL[x1][y1]) > temp1) && (x1 != y1)) {
                       temp1 = fabs(SL[x1][y1]);
                       p=x1;
                       q=y1;}}}

           diag_toplam=0;            // döngüden çýkma eþik deðeri
           for(x1=0;x1<ClassNumber;x1++)  diag_toplam = diag_toplam + SL[x1][x1]*SL[x1][x1];
           if (fabs(SL[p][q]) < jac_coe*sqrt(diag_toplam/ClassNumber)) basla = 0;

          for(y1=60;y1<80;y1++){
             for(x1=120;x1<160;x1++)
                TFT_Dot(x1, y1, CL_BLUE);}
          iteration3 = iteration3 + 1;
      }

      TFT_Write_Text("JACOBI ITERATION-3 OK", 30, 190);
      TFT_Write_Text("V_SL ?", 30, 210);

      // SL[x1][x1]  = > EigenValue  100 adet

      temp1 = -1e+20;
      for(y1=0;y1<ClassNumber;y1++){
          for(x1=y1;x1<ClassNumber;x1++){
              if (SL[x1][x1] > temp1) {
                  temp1 =  SL[x1][x1];
                  ii = x1;}}
          SL[ii][ii] =  SL[y1][y1];
          SL[y1][y1] = temp1;
          temp1 = -1e+20;
          for(x1=0;x1<ClassNumber;x1++){
              temp2 = SV[x1][ii];
              SV[x1][ii] = SV[x1][y1];
              SV[x1][y1] = temp2;}}   // SV[20][20]  but SV[20][19]  only 1 eigenvector is rubbish

     TFT_Write_Text("V_SL OK", 30, 230);

     for(x1=0;x1<N;x1++){                    // V_Scom[99][19] = Acom[99][20] * SV[20][19]
         for(y1=0;y1<(ClassNumber-1);y1++){  // R[99][19]      = V[99][20]    * SV[20][19]
             temp1 = 0;
             for(z1=0;z1<ClassNumber;z1++)
                 temp1 = temp1 + V[x1][z1]* SV[z1][y1];
             R[x1][y1] = temp1; }}

     for(y1=0;y1<(ClassNumber-1);y1++){
         temp1 = 0;
         for(x1=0;x1<N;x1++)
             temp1 = temp1 + R[x1][y1]*R[x1][y1];
         temp2 = sqrt(temp1);
         for(x1=0;x1<N;x1++)
             V[x1][y1] = R[x1][y1]/temp2;}    // V_Scom[99][19] = normc( R[99][19] );

     TFT_Write_Text("V_Scom OK", 30, 250);
     TFT_Write_Text("ProjectedImages_DCVA ?", 30, 270);

     for(x1=0;x1<(ClassNumber-1);x1++){       // ProjectedImages_DCVA[19][20] = V_Scom'[19][99] * ProjectedImages[99][20 every class]
         for(y1=0;y1<ClassNumber;y1++){       // SL[19][20]                   = V'[19][99]    * SV[20][19]
             temp1 = 0;
             for(z1=0;z1<N;z1++)
                 temp1 = temp1 + V[z1][x1]* L[z1][y1*ClassPopulation];
             SL[x1][y1] = temp1; }}          // ProjectedImages_DCVA[19][20]

    TFT_Write_Text("ProjectedImages_DCVA OK", 30, 290);
    DrawScreen(&Screen3);
}

void DCVA_TEST() {
    DrawScreen(&Screen4);
    test_count = 0;
    accuracy = 0;
    NormFault=0;

    for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1        //M_ORT TEKRAR HESAPLANIYOR
        dd = div(ii,100);
        temp1 = 0;
        for(z1=0;(z1<TrainPicture);z1++)
            temp1 =  temp1 + Ear[row*col*z1+ii];
        R[dd.quot][dd.rem] = temp1/TrainPicture;}

 for(jj=100;jj<TestPicture+100;jj++) {      //TestPicture  = jj

    Delay_ms(2000);
    TFT_Fill_Screen(CL_BLUE);
    test_count = test_count + 1;
    IntToStr(test_count,txt1);
    TFT_Write_Text(txt1,30,40);
    TFT_Write_Text("TEST IMAGE", 60, 40);

    ii = 0;
    for(y1=0;y1<col;y1++){  // "TestPicture" siyah beyaz yazdýrma
        for(x1=0;x1<row;x1++){
            temp5 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
            TFT_Dot(x1+50, y1+60, temp5);
            ii = ii + 1;}}

    for(x1=0;x1<TrainPicture;x1++){    //  MTemp (100x1) = (A)'*(TestPicture - m_ort)
        temp1 = 0;
        for(ii=0;ii<row*col;ii++){
            dd = div(ii,100);
            temp1 = temp1 + (Ear[row*col*x1 + ii] - R[dd.quot][dd.rem])*(Ear[row*col*jj + ii] - R[dd.quot][dd.rem]);}
        MTemp[x1] = temp1;}   //100x1

    for(y1=0;y1<N;y1++){      // GTemp (99x1) = (V)' * MTemp
         temp2 = 0;
         for(x1=0;x1<TrainPicture;x1++)
             temp2 = temp2 + D[x1][y1]*MTemp[x1];     //D=V  => L' * A' *  (TestPicture - m_ort)
         GTemp[y1] = temp2;}

    for(y1=0;y1<(ClassNumber-1);y1++){      // ProjectedTestImage (19x1) = (V_Scom)' * GTemp
         temp3 = 0;                         // ProjectedTestImage (19x1) = V'[19][99] *  GTemp[99]
         for(x1=0;x1<N;x1++)
             temp3 = temp3 + V[x1][y1]*GTemp[x1];
         ProjectedTestImage[y1] = temp3;}

    EpsilonK = 1e+15;              //ClassNorm bulunmasý
    for(y1=0;y1<ClassNumber;y1++){
       temp4 = 0;
       for(x1=0;x1<(ClassNumber-1);x1++)
           temp4 = temp4 + (SL[x1][y1] - ProjectedTestImage[x1])*(SL[x1][y1] - ProjectedTestImage[x1]);
       temp4 = sqrt(temp4);
       if (temp4 < EpsilonK) {
           EpsilonK = temp4;
           WhoseEar = ClassPopulation*y1;}}
           
    //--------------finding norm fault----------------------
         NormFault = NormFault + (EpsilonK - DCVA_ORJ[jj-100])*(EpsilonK - DCVA_ORJ[jj-100]);
    //-------------------------------------------------------------------
           
    if (EpsilonK < DCVA_TetaC) {
        if (jj<120) accuracy += 2;
        TFT_Write_Text("This picture is ear", 30, 160);
        TFT_Write_Text("The ear is in the database", 30, 180);
        TFT_Write_Text("EpsilonK", 30, 200);
        FloatToStr(EpsilonK ,txt2);
        TFT_Write_Text(txt2,100,200);
        ii = 0;
        for(y1=0;y1<col;y1++){  // "WhoseEar" siyah beyaz yazdýrma
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
 }
    ite_total = iteration1 + iteration2 + iteration3;
    NormFault = (100*sqrt(NormFault))/(5.468008919752826e+03);
    ProgressBar1.Position = accuracy;
    DrawScreen(&Screen7);
    
    TFT_Write_Text("iteration1 = >",10,60);
    IntToStr(iteration1,txt1);
    TFT_Write_Text(txt1,120,60);
    
    TFT_Write_Text("iteration2 = >",10,80);
    IntToStr(iteration2,txt1);
    TFT_Write_Text(txt1,120,80);
    
    TFT_Write_Text("iteration3 = >",10,100);
    IntToStr(iteration3,txt1);
    TFT_Write_Text(txt1,120,100);
    
    TFT_Write_Text("total = >",10,120);
    IntToStr(ite_total,txt1);
    TFT_Write_Text(txt1,120,120);
    
    TFT_Write_Text("Norm Fault = >",10,140);
    FloatToStr(NormFault,txt2);
    TFT_Write_Text(txt2,120,140);

    while(1);
}

void Show_database() {
     DrawScreen(&Screen8);
     ValueZero();
     ii = 0;
     for(jj=0;jj<20;jj++){

        for(z1=0;z1<5;z1++){
            Delay_ms(100);
            for(x1=0;x1<256;x1++) histogram[x1]=0;
            
            for(y1=0;y1<col;y1++){  // "Training set"
                for(x1=0;x1<row;x1++){
                    tempk1=Ear[ii];
                    temp1 = TFT_RGBToColor16bit(tempk1, tempk1, tempk1);
                    TFT_Dot(x1+10+z1*60, y1+25, temp1);
                    histogram[tempk1] = histogram[tempk1] + 1;
                    ii = ii + 1;}}
            
           for(y1=105;y1<240;y1++){
               for(x1=0;x1<320;x1++)
                   TFT_Dot(x1, y1, CL_WHITE);}
           
           if (z1==0)DrawLabel(&Diagram8_S2L4);
           if (z1==1)DrawLabel(&Diagram8_S2L5);
           if (z1==2)DrawLabel(&Diagram8_S2L6);
           if (z1==3)DrawLabel(&Diagram8_S2L7);
           if (z1==4)DrawLabel(&Diagram8_S2L8);
                   
           TFT_Line(32,235,32+256,235);
           
           for(x1=0;x1<256;x1++){
               kk = histogram[x1];
               TFT_V_Line(235,235-kk,32+x1);}
                    
         }}
                    
     Delay_ms(500);
     DrawScreen(&Screen1);

}