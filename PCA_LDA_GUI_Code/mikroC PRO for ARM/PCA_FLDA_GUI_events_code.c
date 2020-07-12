#include "PCA_FLDA_GUI_objects.h"
#include "PCA_FLDA_GUI_resources.h"

//--------------------- User code ---------------------//

//----------------- End of User code ------------------//

// Event Handlers
#include "PCA_FLDA_GUI_resources.h"

//--------------------- User code ---------------------//

//----------------- End of User code ------------------//

const code char Ear[720000];
data double m_ort[4800]; // row*col=60*80
data double L[100][100];    // picture=100
data double V[100][100];    // özvektör
data double R[100][100];
data double Fisher[50][19]; //Fisher özvektörler (ClassNumber-1)
data double SS[50][50];    // Sw S
//data double QV[50][50];
data double KTemp[50]; //Eigenvalue geçici
data double MTemp[100];
data double GTemp[100];
data double ProjectedTestImage[50];  //PCA=>N=50 FLDA=>(ClassNumber-1)=19
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
  for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]=0;  MTemp[ii]=0; }
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
         // QV[x1][y1] = 0;

  for(y1=0;y1<TrainPicture;y1++){       //V ilk deðer atama eye(n) birim matris
      for(x1=0;x1<TrainPicture;x1++){
          if (x1==y1) V[x1][y1] = 1;
          else        V[x1][y1] = 0;}}

}


void S1_START() {                 //SCREEN-1
  DrawScreen(&Screen2);
  reset_zero();
}

void FLDA_SELECT() {             //SCREEN-2
  DrawScreen(&Screen3);
  convert_pca_flda = 1;
}

void PCA_SELECT() {             //SCREEN-2
  DrawScreen(&Screen3);
  convert_pca_flda = 0;
}


void JACOBI_SELECT() {          //SCREEN-3
   DrawScreen(&Screen5);
}


void J_E_2() {              //SCREEN-5
   jac_coe = 0.01;
   if (convert_pca_flda == 0) DrawScreen(&Screen6);
   else DrawScreen(&Screen11);
}

void J_E_3() {             //SCREEN-5
   jac_coe = 0.001;
   if (convert_pca_flda == 0) DrawScreen(&Screen6);
   else DrawScreen(&Screen11);
}

void J_E_4() {               //SCREEN-5
   jac_coe = 0.0001;
   if (convert_pca_flda == 0) DrawScreen(&Screen6);
   else DrawScreen(&Screen11);
}

void J_E_5() {              //SCREEN-5
    jac_coe = 0.00001;
   if (convert_pca_flda == 0) DrawScreen(&Screen6);
   else DrawScreen(&Screen11);
}

void J_E_6() {              //SCREEN-5
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

    for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1
        temp1 = 0;
        for(x1=0;(x1<TrainPicture);x1++)
            temp1 =  temp1 + Ear[row*col*x1+ii];
        m_ort[ii] = temp1/TrainPicture;}

   TFT_Write_Text("MEAN OK", 30, 30);
   TFT_Write_Text("L=A'*A ?", 30, 50);

   for(x1=0;x1<TrainPicture;x1++){        // L = A'*A;
       for(y1=0;y1<TrainPicture;y1++){
           temp1 = 0;
           for(ii=0;ii<row*col;ii++)
               temp1 = temp1 + (ear[row*col*x1 + ii] - m_ort[ii])*(ear[row*col*y1 + ii] - m_ort[ii]);
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

      iteration = 0;
      basla = 1;                              // jacobi iteration döngü baþangýcý
      while (basla==1){

            //IntToStr(iteration,txt1);
           // TFT_Write_Text(txt1,120,60);

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

         //  for(y1=60;y1<80;y1++){
           //    for(x1=120;x1<150;x1++)
             //      TFT_Dot(x1, y1, CL_WHITE);}
          iteration = iteration + 1;
      }

      TFT_Write_Text("JACOBI ITERATION OK", 30, 110);
      TFT_Write_Text("EIGENVECTOR ?", 30, 130);

      // L[x1][x1]  = > EigenValue  100 adet

      temp1 = -1e-10;
      for(y1=0;y1<TrainPicture;y1++){
          for(x1=y1;x1<TrainPicture;x1++){
              if (L[x1][x1] > temp1) {
                  temp1 =  L[x1][x1];
                  ii = x1;}}
          L[ii][ii] =  L[y1][y1];
          L[y1][y1] = temp1;
          temp1 = -1e-10;
          for(x1=0;x1<TrainPicture;x1++){
              GTemp[x1] = V[x1][ii];
              V[x1][ii] = V[x1][y1];
              V[x1][y1] = GTemp[x1];}}  // Özdeðerler büyükten küçüðe numarasý tutuluyor (özvektörler için)
                  // V[100][50] artýk 50 çöpe attýk
      TFT_Write_Text("EIGENVECTOR OK", 30, 150);

     TFT_Write_Text("L=> ProjectedImages", 30, 170);

     for(y1=0;y1<TrainPicture;y1++){
         for(x1=0;x1<TrainPicture;x1++) L[x1][y1] = 0;}

     TFT_Write_Text("ProjectedImages ?", 30, 190);

     for(y1=0;y1<N;y1++){   // V[100][50]
         for(ii=0;ii<row*col;ii++){        //(row*col x picture)(picture x picture - ClassNumber)
             temp1 = 0;                    // KTemp => norm tutucu
             for(x1=0;x1<TrainPicture;x1++)
                  temp1 = temp1 + (Ear[x1*row*col + ii] - m_ort[ii])*V[x1][y1]; //A*V
              KTemp[y1] =  KTemp[y1] + temp1*temp1;}}

      TFT_Write_Text("NORM KEEP OK", 30, 210);

      for(y1=0;y1<N;y1++){        // V=V/norm_tutucu       100x50
         for(x1=0;x1<TrainPicture;x1++)
             V[x1][y1] = (V[x1][y1])/(sqrt(KTemp[y1]));}

     TFT_Write_Text("V=V/NORM KEEP OK", 30, 230);

     for(ii=0;ii<TrainPicture;ii++) GTemp[ii]=0;   // GTemp sýfýrlandý

      for(y1=0;y1<TrainPicture;y1++){
          for(x1=0;x1<TrainPicture;x1++){        //(picture x row*col)(row*col x 1)
              temp1 = 0;
              for(ii=0;ii<row*col;ii++)     // Gtemp = A' * (EarNumber-m_ort)
                  temp1 = temp1 + (Ear[y1*row*col+ii] - m_ort[ii])*(Ear[x1*row*col+ii] - m_ort[ii]);
              GTemp[x1] =  temp1;}
         for(x1=0;x1<N;x1++){   // ProjectedImages = V' *  GTemp = V' * A' * (EarNumber-m_ort)
             temp2 = 0;
             for(z1=0;z1<TrainPicture;z1++)
                 temp2 = temp2 + V[z1][x1]*GTemp[z1]; // L'=L[y1][x1]; L= L[x1][y1]
             L[x1][y1] = temp2;}} //L[x1][y1] => ProjectedImages[x1][y1]

    TFT_Write_Text("ProjectedImages OK",30, 250);
}
void PCA_TRAINING_START() {    //SCREEN-6
     DrawScreen(&Screen7);
     projected_images_find ();
     DrawScreen(&Screen8);
}

void PCA_TEST_START() {      //SCREEN-8
     DrawScreen(&Screen9);
     test_count = 0;
     accuracy = 0;
     NormFault=0;
 for(jj=100;jj<TestPicture+100;jj++) {      //TestPicture  = jj

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
        for(ii=0;ii<row*col;ii++)
             temp1 = temp1 + (Ear[row*col*x1 + ii] - m_ort[ii])*(Ear[row*col*jj + ii] - m_ort[ii]);
        MTemp[x1] = temp1;}   //100x1

    for(y1=0;y1<N;y1++){      // ProjectedTestImage (50x1) = (V)' * MTemp
         temp2 = 0;
         for(x1=0;x1<TrainPicture;x1++)
             temp2 = temp2 + V[x1][y1]*MTemp[x1];
         ProjectedTestImage[y1] = temp2;}

    EpsilonK = 1e+5;             //ClassNorm bulunmasý
    for(y1=0;y1<TrainPicture;y1++){
       temp4 = 0;
       for(x1=0;x1<N;x1++)
           temp4 = temp4 + (L[x1][y1] - ProjectedTestImage[x1])*(L[x1][y1] - ProjectedTestImage[x1]);
       temp4 = sqrt(temp4);
       if (temp4 < EpsilonK) {
           EpsilonK = temp4;
           WhoseEar = y1;}}
     
  //--------------finding norm fault----------------------
         NormFault = NormFault + (EpsilonK - PCA_ORJ[jj-100])*(EpsilonK - PCA_ORJ[jj-100]);
  //-------------------------------------------------------------------

    if (EpsilonK < PCA_TetaC) {
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

void PCA_RESULTS_MAIN() {    //SCREEN-10
   DrawScreen(&Screen1);
}

void FLDA_PART_1_START() {   //SCREEN-11
   DrawScreen(&Screen12);
   projected_images_find ();
   DrawScreen(&Screen13);
}

void FLDA_PART_2_START() {    //SCREEN-13
   DrawScreen(&Screen14);
}
void QR2_10() {           //SCREEN-14
  QR_iteration = 10;
  DrawScreen(&Screen15);
}

void QR2_15() {           //SCREEN-14
   QR_iteration = 15;
   DrawScreen(&Screen15);
}

void QR2_25() {          //SCREEN-14
   QR_iteration = 25;
   DrawScreen(&Screen15);
}

void QR2_50() {           //SCREEN-14
   QR_iteration = 50;
   DrawScreen(&Screen15);
}

void QR2_75() {          //SCREEN-14
   QR_iteration = 75;
   DrawScreen(&Screen15);
}

void QR2_100() {        //SCREEN-14
   QR_iteration = 100;
   DrawScreen(&Screen15);
}

void FLDA_CONTINUE() {    //SCREEN-15
  DrawScreen(&Screen16);
  TFT_Write_Text("Sw ?", 30, 50);

   for(ii=0;ii<ClassNumber;ii++){ // m_ort = row*col x 1

       for(x1=0;x1<N;x1++){
           temp1 = 0;
           for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
               temp1 = temp1 + L[x1][y1];
           GTemp[x1] = temp1/ClassPopulation;}

      for(y1=0;y1<N;y1++)      //  V[x1][y1+50] sýfýrlandý
          for(x1=0;x1<N;x1++) V[x1][y1+50] = 0;

           for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++){
               for(z1=0;z1<N;z1++){
                   for(x1=0;x1<N;x1++)
                       V[x1][z1+50] =  V[x1][z1+50]  + (L[x1][y1]-GTemp[x1])*(L[z1][y1]-GTemp[x1]); }}

     for(y1=0;y1<N;y1++){
          for(x1=0;x1<N;x1++)
              SS[x1][y1] = SS[x1][y1] + V[x1][y1+50];}  }     // Sw 50x50

     TFT_Write_Text("Sw OK", 30, 70);
     TFT_Write_Text("inv(Sw) ?", 30, 90);

  for(ii=0;ii<TrainPicture;ii++)   {GTemp[ii]= 0;  MTemp[ii] = 0; }
  for(ii=0;ii<N;ii++) BTemp[ii] = 0;
  for(ii=0;ii<N;ii++) RTemp[ii] = ii;

  for(p=0;p<(N-1);p++){

      temp1 = 0;      //en büyük deðer bulma pivot
      for(x1=p;x1<N;x1++){
          if (fabs(SS[x1][p]) > temp1) {
               temp1 = fabs(SS[x1][p]);
               jj=x1;}}

     for(ii=0;ii<N;ii++){   //row changing
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

      for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]= 0;  MTemp[ii] = 0;}

      for(ii=0;ii<N;ii++){
          if (x1 == ii) BTemp[ii] = 1;
          else  BTemp[ii] = 0;}

      // Ax=B  Y'nin çözümü    Mtemp = Y
      mm = RTemp[0];
      MTemp[0] =  BTemp[mm];
      for (kk=1;kk<N;kk++){
          temp4 = 0;
          for (z1=0;z1<(kk);z1++)
               temp4 = temp4 + SS[kk][z1]*MTemp[z1];
               mm = RTemp[kk];
          MTemp[kk] =  BTemp[mm] - temp4;}

      // Ax=B  X'in çözümü           GTemp = X
      GTemp[N-1] = MTemp[N-1]/SS[N-1][N-1];
      for (kk=0;kk<(N-1);kk++){
          temp5 = 0;
          for (z1=(N-1-kk);z1<N;z1++)
               temp5 = temp5 + SS[N-2-kk][z1]*GTemp[z1];
          GTemp[N-2-kk] =  (MTemp[N-2-kk] - temp5)/SS[N-2-kk][N-2-kk];}

      for(kk=0;kk<N;kk++)
          V[kk][jj+50] = GTemp[kk]; // inv(Sw) = V[50][50] ;
      x1 = x1 + 1;
    }

      TFT_Write_Text("inv(Sw) OK",30, 110);
      TFT_Write_Text("Sb ?",  30, 130);

     for(x1=0;x1<N;x1++){
         temp1 = 0;
         for(y1=0;y1<TrainPicture;y1++)
             temp1 =  temp1 + L[x1][y1];    //L => projectedimages 50x100
         Mtemp[x1] = temp1/TrainPicture;}  //Mtemp toplam ortalama 50x1

    for(x1=0;x1<N;x1++)      //  L[50-99][0-49]   50x50 => Sb
        for(y1=0;y1<N;y1++) L[x1+50][y1] = 0;

    for(ii=0;ii<ClassNumber;ii++){

       for(x1=0;x1<N;x1++){
           temp1 = 0;
           for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
               temp1 = temp1 + L[x1][y1];
           GTemp[x1] = temp1/ClassPopulation;}     // GTemp = sýnýf ortalamasý

       for(x1=0;x1<N;x1++){       // Sb = Sb + (m_sýnýf - m_ort_toplam)*(m_sýnýf - m_ort_toplam)';
           for(y1=0;y1<N;y1++)
               L[x1+50][y1] = L[x1+50][y1] + (GTemp[x1]-Mtemp[x1])*(GTemp[y1]-Mtemp[y1]);}
      }
      TFT_Write_Text("Sb OK",  30, 150);

      for(x1=0;x1<N;x1++){       // S =inv(Sw)*Sb 50x50
           for(y1=0;y1<N;y1++){
               temp3 = 0;
               for(z1=0;z1<N;z1++)
                   temp3 = temp3 + V[x1][z1+50]*L[z1+50][y1];
               SS[x1][y1] = temp3;}}

  TFT_Write_Text("S OK",  30, 170);
  TFT_Write_Text("QR Algorithm Start",  30, 190);
  for(x1=0;x1<N;x1++){        // Q matrisi  Q=SS;
        for(y1=0;y1<N;y1++)
            L[50+x1][y1] = SS[x1][y1];}
   // QR-1--------------------------------------------------------------------------------
   for(y1=0;y1<N;y1++){       //V birim matris 50x50
      for(x1=0;x1<N;x1++){
          if (x1==y1) V[x1][y1+50] = 1;
          else        V[x1][y1+50] = 0;}}

 for(ii=0;ii<QR_iteration;ii++){  //QR büyük dongu-1

    for(x1=0;x1<N;x1++){                   // R matrisi
       for(y1=0;y1<N;y1++)
           L[50+x1][50+y1] = 0;}

    for(kk=0;kk<N;kk++){
        for(jj=0;jj<kk;jj++){
            temp3 = 0;
            for(x1=0;x1<N;x1++)
                temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];  //R = Q'*Q
            L[50+jj][50+kk] = temp3;
            for(x1=0;x1<N;x1++)      // R*Q =  MTemp[x1]
                MTemp[x1] =  L[50+jj][50+kk]*L[50+x1][jj];
            for(x1=0;x1<N;x1++)   //Q=Q-RQ
                GTemp[x1]   = L[50+x1][kk] - MTemp[x1] ;
            for(x1=0;x1<N;x1++)
               L[50+x1][kk] = GTemp[x1];  }

    temp1 = 0;
    for(x1=0;x1<N;x1++)
        temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
    L[50+kk][50+kk] = sqrt(temp1);  //norm (Q)

     for(x1=0;x1<N;x1++)  // Q =Q/R
         L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
    }

    for(x1=0;x1<N;x1++){        // V[50][50] =V[50][50]*Q[50][50]
        for(m1=0;m1<N;m1++)
            GTemp[m1] = V[x1][m1+50];
        for(y1=0;y1<N;y1++){
            temp3 = 0;
            for(z1=0;z1<N;z1++)
                temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
            V[x1][y1+50] = temp3;}}

    for(y1=0;y1<N;y1++){
        for(m1=0;m1<N;m1++)            // Q atanýyor
            GTemp[m1] = L[50+m1][y1];
        for(x1=0;x1<N;x1++){       // Q[50][50]= R[50][50]*Q[50][50]
            temp3 = 0;
            for(z1=0;z1<N;z1++)
                temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
            L[50+x1][y1] = temp3;}}
  }

  // QR-1----son----------------------------------------------------------------------------
  for(x1=0;x1<N;x1++)              //eigenvalue => KTemp
      KTemp[x1] = L[50+x1][x1];
      
  TFT_Write_Text("Eigenvalue OK",  30, 210);
  TFT_Write_Text("FISHER Eigenvector ?",  30, 230);
  for(x1=0;x1<N;x1++)   // (ClassNumber-1) özvektor V_Fisher ilk özvektor
      Fisher[x1][0] = V[x1][0+50];

  for(tt=1;tt<ClassNumber-1;tt++) {

     for(x1=0;x1<N;x1++){        // V[50+x1][y1]=SS;
        for(y1=0;y1<N;y1++)
            V[50+x1][y1+50] = SS[x1][y1];}

     for(x1=0;x1<N;x1++)                            // cc   tersi alýnacak eigenvalue çýkartýlmýþ vektor
         V[50+x1][x1+50] = SS[x1][x1] - KTemp[tt];
   //----------------------------------------------------------
     for(ii=0;ii<TrainPicture;ii++)   {GTemp[ii]= 0;  MTemp[ii] = 0; }
     for(ii=0;ii<N;ii++) BTemp[ii] = 0;
     for(ii=0;ii<N;ii++) RTemp[ii] = ii;
  TFT_Write_Text("inverse ?",  30, 250);
  for(p=0;p<(N-1);p++){

      temp1 = 0;      //en büyük deðer bulma pivot
      for(x1=p;x1<N;x1++){
          if (fabs(V[x1+50][p+50]) > temp1) {
               temp1 = fabs(V[x1+50][p+50]);
               jj=x1;}}

     for(ii=0;ii<N;ii++){   //row changing
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

      for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]= 0;  MTemp[ii] = 0;}

      for(ii=0;ii<N;ii++){
          if (x1 == ii) BTemp[ii] = 1;
          else  BTemp[ii] = 0;}

      // Ax=B  Y'nin çözümü    Mtemp = Y
      mm = RTemp[0];
      MTemp[0] =  BTemp[mm];
      for (kk=1;kk<N;kk++){
          temp4 = 0;
          for (z1=0;z1<(kk);z1++)
               temp4 = temp4 + V[kk+50][z1+50]*MTemp[z1];
               mm = RTemp[kk];
          MTemp[kk] =  BTemp[mm] - temp4;}

      // Ax=B  X'in çözümü           GTemp = X
      GTemp[N-1] = MTemp[N-1]/V[N-1+50][N-1+50];
      for (kk=0;kk<(N-1);kk++){
          temp5 = 0;
          for (z1=(N-1-kk);z1<N;z1++)
               temp5 = temp5 + V[N-2-kk+50][z1+50]*GTemp[z1];
          GTemp[N-2-kk] =  (MTemp[N-2-kk] - temp5)/V[N-2-kk+50][N-2-kk+50];}

      for(kk=0;kk<N;kk++)
          L[50+kk][jj] = GTemp[kk];
      x1 = x1 + 1;
    }
    TFT_Write_Text("inverse OK",  30, 270);
    //-------------------------------------------------------------
     // QR-full-----------------------------------------------------
     for(y1=0;y1<N;y1++){       //V birim matris 50x50
      for(x1=0;x1<N;x1++){
          if (x1==y1) V[x1][y1+50] = 1;
          else        V[x1][y1+50] = 0;}}

 for(ii=0;ii<QR_iteration;ii++){  //QR büyük dongu-1

    for(x1=0;x1<N;x1++){                   // R matrisi
       for(y1=0;y1<N;y1++)
           L[50+x1][50+y1] = 0;}

    for(kk=0;kk<N;kk++){
        for(jj=0;jj<kk;jj++){
            temp3 = 0;
            for(x1=0;x1<N;x1++)
                temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];  //R = Q'*Q
            L[50+jj][50+kk] = temp3;
            for(x1=0;x1<N;x1++)      // R*Q =  MTemp[x1]
                MTemp[x1] =  L[50+jj][50+kk]*L[50+x1][jj];
            for(x1=0;x1<N;x1++)   //Q=Q-RQ
                GTemp[x1]   = L[50+x1][kk] - MTemp[x1] ;
            for(x1=0;x1<N;x1++)
               L[50+x1][kk] = GTemp[x1];  }

    temp1 = 0;
    for(x1=0;x1<N;x1++)
        temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
    L[50+kk][50+kk] = sqrt(temp1);  //norm (Q)

     for(x1=0;x1<N;x1++)  // Q =Q/R
         L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
    }

    for(x1=0;x1<N;x1++){        // V[50][50] =V[50][50]*Q[50][50]
        for(m1=0;m1<N;m1++)
            GTemp[m1] = V[x1][m1+50];
        for(y1=0;y1<N;y1++){
            temp3 = 0;
            for(z1=0;z1<N;z1++)
                temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
            V[x1][y1+50] = temp3;}}

    for(y1=0;y1<N;y1++){
        for(m1=0;m1<N;m1++)            // Q atanýyor
            GTemp[m1] = L[50+m1][y1];
        for(x1=0;x1<N;x1++){       // Q[50][50]= R[50][50]*Q[50][50]
            temp3 = 0;
            for(z1=0;z1<N;z1++)
                temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
            L[50+x1][y1] = temp3;}}

   // QR-full---son--------------------------------------------------

   }
  // 2.itibaren toplam 18 özvektor  V_Fisher
   for(x1=0;x1<N;x1++)
       Fisher[x1][tt] = V[x1][0+50];
   TFT_Write_Text("FISHER Eigenvector OK",  30, 290);
 }

 for(x1=0;x1<(ClassNumber-1);x1++){       // ProjectedImages_Fisher(:,i)=V_Fisher'*ProjectedImages(:,i)
     for(y1=0;y1<TrainPicture;y1++){
         temp3 = 0;
         for(z1=0;z1<N;z1++)
             temp3 = temp3 + Fisher[z1][x1]*L[z1][y1];
         L[x1+50][y1] = temp3;}}
         
   TFT_Write_Text("QR Algorithm Finish",  30, 310);
  
  DrawScreen(&Screen17);
}

void FLDA_TEST() {       //SCREEN-17
     DrawScreen(&Screen18);
     test_count = 0;
     accuracy = 0;
     NormFault=0;
 for(jj=100;jj<TestPicture+100;jj++) {      //TestPicture  = jj

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
        for(ii=0;ii<row*col;ii++)
             temp1 = temp1 + (ear[row*col*x1 + ii] - m_ort[ii])*(ear[row*col*jj + ii] - m_ort[ii]);
        MTemp[x1] = temp1;}   //100x1

    for(y1=0;y1<N;y1++){      // GTemp (50x1) = (V)' * MTemp
         temp2 = 0;
         for(x1=0;x1<TrainPicture;x1++)
             temp2 = temp2 + V[x1][y1]*MTemp[x1];
         GTemp[y1] = temp2;}

    for(y1=0;y1<(ClassNumber-1);y1++){      // ProjectedTestImage (19x1) = (Fisher)' * GTemp
         temp3 = 0;
         for(x1=0;x1<N;x1++)
             temp3 = temp3 + Fisher[x1][y1]*GTemp[x1];
         ProjectedTestImage[y1] = temp3;}

    EpsilonK = 1e+5;              //ClassNorm bulunmasý
    for(y1=0;y1<TrainPicture;y1++){
       temp4 = 0;
       for(x1=0;x1<(ClassNumber-1);x1++)
           temp4 = temp4 + (L[x1+50][y1] - ProjectedTestImage[x1])*(L[x1+50][y1] - ProjectedTestImage[x1]);
       temp4 = sqrt(temp4);
       if (temp4 < EpsilonK) {
           EpsilonK = temp4;
           WhoseEar = y1;}}
           
    //--------------finding norm fault----------------------
         NormFault = NormFault + (EpsilonK - FLDA_ORJ[jj-100])*(EpsilonK - FLDA_ORJ[jj-100]);
  //-------------------------------------------------------------------
           

    if (EpsilonK < FLDA_TetaC) {
        if (jj<120) accuracy += 2;
        TFT_Write_Text("This picture is ear", 30, 160);
        TFT_Write_Text("The ear is in the database", 30, 180);
        TFT_Write_Text("Epsilon", 30, 200);
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

void FLDA_RESULTS_MAIN() {  //SCREEN-19
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
