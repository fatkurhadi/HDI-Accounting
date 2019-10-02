program HDI_Accounting;

uses
  Forms,
  UnitUTAMA in 'UnitUTAMA.pas' {FormUTAMA},
  UnitLOGIN in 'UnitLOGIN.pas' {FormLOGIN},
  UnitBARANG in 'UnitBARANG.pas' {FormBARANG},
  UnitKARYAWAN in 'UnitKARYAWAN.pas' {FormKARYAWAN},
  UnitSUPPLIER in 'UnitSUPPLIER.pas' {FormSUPPLIER},
  UnitPENGGUNA in 'UnitPENGGUNA.pas' {FormPENGGUNA},
  UnitPEMBELIAN in 'UnitPEMBELIAN.pas' {FormPEMBELIAN},
  UnitPENJUALAN in 'UnitPENJUALAN.pas' {FormPENJUALAN},
  UnitTOKO in 'UnitTOKO.pas' {FormTOKO},
  UnitEDITTOKO in 'UnitEDITTOKO.pas' {FormEDITTOKO},
  UnitPEMBELI in 'UnitPEMBELI.pas' {FormPEMBELI},
  UnitRETURBELI in 'UnitRETURBELI.pas' {FormRETURBELI},
  UnitRETURJUAL in 'UnitRETURJUAL.pas' {FormRETURJUAL},
  UDM in 'UDM.pas' {DM: TDataModule},
  UnitPENCARIAN in 'UnitPENCARIAN.pas' {FormPENCARIAN},
  UnitSEARCH in 'UnitSEARCH.pas' {FormSEARCH},
  UnitPEMBUAT in 'UnitPEMBUAT.pas' {FormPEMBUAT};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormUTAMA, FormUTAMA);
  Application.CreateForm(TFormLOGIN, FormLOGIN);
  Application.CreateForm(TFormTOKO, FormTOKO);
  Application.CreateForm(TFormEDITTOKO, FormEDITTOKO);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormPENCARIAN, FormPENCARIAN);
  Application.CreateForm(TFormSEARCH, FormSEARCH);
  Application.CreateForm(TFormPEMBUAT, FormPEMBUAT);
  Application.Run;
end.
