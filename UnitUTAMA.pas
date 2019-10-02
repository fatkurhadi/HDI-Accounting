unit UnitUTAMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus, ComCtrls;

type
  TFormUTAMA = class(TForm)
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    N1: TMenuItem;
    Keluar1: TMenuItem;
    Data1: TMenuItem;
    Transaksi1: TMenuItem;
    Pembelian1: TMenuItem;
    Penjualan1: TMenuItem;
    Barang1: TMenuItem;
    ReturBeli1: TMenuItem;
    Informasi1: TMenuItem;
    CaraPengunaan1: TMenuItem;
    Pembuat1: TMenuItem;
    N2: TMenuItem;
    Toko1: TMenuItem;
    Supplier1: TMenuItem;
    Karyawan1: TMenuItem;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    N3: TMenuItem;
    Pengguna1: TMenuItem;
    ReturJual1: TMenuItem;
    Pembeli1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Keluar1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure Barang1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure Karyawan1Click(Sender: TObject);
    procedure Supplier1Click(Sender: TObject);
    procedure Pengguna1Click(Sender: TObject);
    procedure Pembelian1Click(Sender: TObject);
    procedure Penjualan1Click(Sender: TObject);
    procedure Toko1Click(Sender: TObject);
    procedure Pembeli1Click(Sender: TObject);
    procedure ReturBeli1Click(Sender: TObject);
    procedure ReturJual1Click(Sender: TObject);
    procedure Pembuat1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    The_Path : String;
  end;

var
  FormUTAMA: TFormUTAMA;

implementation

uses UnitLOGIN, UnitBARANG, UnitKARYAWAN, UnitSUPPLIER, UnitPENGGUNA,
  UnitPEMBELIAN, UnitPENJUALAN, UnitTOKO, UnitPEMBELI, UnitRETURBELI,
  UnitRETURJUAL, UDM, UnitPEMBUAT;

{$R *.dfm}

procedure TFormUTAMA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Application.MessageBox ('Anda Yakin Ingin Keluar?',
    'Konfirmasi',MB_YESNO + MB_ICONQUESTION) = IDYES then
     Action:=cafree
   else
     action:=canone;
end;

procedure TFormUTAMA.Keluar1Click(Sender: TObject);
begin
    Close;
end;

procedure TFormUTAMA.Timer1Timer(Sender: TObject);
var
  days: array[1..7] of string;
begin
  days[1] := 'MINGGU';
  days[2] := 'SENIN';
  days[3] := 'SELASA';
  days[4] := 'RABU';
  days[5] := 'KAMIS';
  days[6] := 'JUMAT';
  days[7] := 'SABTU';
    StatusBar1.Panels[1].Text := FormatDateTime('HH:MM AM/PM',Now);
    StatusBar1.Panels[2].Text := days[DayOfWeek(Now)]+' ,  '+FormatDateTime('DD MMMMMMMMMM YYYY',Now);
end;

procedure TFormUTAMA.Login1Click(Sender: TObject);
begin
   FormLOGIN.ShowModal;
end;

procedure TFormUTAMA.Barang1Click(Sender: TObject);
begin
  If FormBARANG = Nil Then
     FormBARANG := TFormBARANG.Create(Self);
  DM.TBarang.Active:=True;
  DM.QBarang.Active:=True;
  FormBARANG.Show;
end;

procedure TFormUTAMA.FormCreate(Sender: TObject);
Var
 I : Integer;
begin
  I := Length(Application.ExeName);
  The_Path := Copy(Application.ExeName,1,I-12);
end;

procedure TFormUTAMA.Logout1Click(Sender: TObject);
begin
   Pengguna1.Visible := False;
   Data1.Visible := False;
   Transaksi1.Visible := False;
   Login1.Enabled := True;
   Logout1.Enabled := False;
end;

procedure TFormUTAMA.Karyawan1Click(Sender: TObject);
begin
  If FormKARYAWAN = Nil Then
     FormKARYAWAN := TFormKARYAWAN.Create(Self);
  DM.TKaryawan.Active:=True;
  DM.QKaryawan.Active:=True;   
  FormKARYAWAN.Show;
end;

procedure TFormUTAMA.Supplier1Click(Sender: TObject);
begin
  If FormSUPPLIER = Nil Then
     FormSUPPLIER := TFormSUPPLIER.Create(Self);
  DM.TSupplier.Active:=True;
  DM.QSupplier.Active:=True;
  FormSUPPLIER.Show;
end;

procedure TFormUTAMA.Pengguna1Click(Sender: TObject);
begin
  If FormPENGGUNA = Nil Then
     FormPENGGUNA := TFormPENGGUNA.Create(Self);
  DM.TPengguna.Active:=True;   
  FormPENGGUNA.Show;
end;

procedure TFormUTAMA.Pembelian1Click(Sender: TObject);
begin
  If FormPEMBELIAN = Nil Then
     FormPEMBELIAN := TFormPEMBELIAN.Create(Self);
  DM.TMBeli.Active:= True;
  DM.TDBeli.Active:= True;
  FormPEMBELIAN.Show;
end;

procedure TFormUTAMA.Penjualan1Click(Sender: TObject);
begin
  If FormPENJUALAN = Nil Then
     FormPENJUALAN := TFormPENJUALAN.Create(Self);
  DM.TMJual.Active:= True;
  DM.TDJual.Active:= True;   
  FormPENJUALAN.Show;
end;

procedure TFormUTAMA.Toko1Click(Sender: TObject);
begin
  FormTOKO.ShowModal;
end;

procedure TFormUTAMA.Pembeli1Click(Sender: TObject);
begin
  If FormPEMBELI = Nil Then
     FormPEMBELI := TFormPEMBELI.Create(Self);
  DM.TPembeli.Active:=True;
  DM.QPembeli.Active:=True;
  FormPEMBELI.Show;
end;

procedure TFormUTAMA.ReturBeli1Click(Sender: TObject);
begin
  If FormRETURBELI = Nil Then
     FormRETURBELI := TFormRETURBELI.Create(Self);
  DM.TRBeli.Active:=True;
  FormRETURBELI.Show;
end;

procedure TFormUTAMA.ReturJual1Click(Sender: TObject);
begin
  If FormRETURJUAL = Nil Then
     FormRETURJUAL := TFormRETURJUAL.Create(Self);
  DM.TRJual.Active:=True;
  FormRETURJUAL.Show;
end;

procedure TFormUTAMA.Pembuat1Click(Sender: TObject);
begin
  FormPEMBUAT.ShowModal;
end;

end.
