unit UnitPEMBELIAN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Grids,
  DBGrids;

type
  TFormPEMBELIAN = class(TForm)
    PageControl1: TPageControl;
    TS_Penjualan: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btambah: TBitBtn;
    bsimpan: TBitBtn;
    bbatal: TBitBtn;
    Panel2: TPanel;
    Nota: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Edit4: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox1: TGroupBox;
    DBEdit4: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btambahClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure normal;
    procedure abnormal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPEMBELIAN: TFormPEMBELIAN;

implementation
uses UDM, UnitSEARCH;
{$R *.dfm}

procedure TFormPEMBELIAN.normal;
begin
  btambah.Enabled:=True;
  bsimpan.Enabled:=False;
  bbatal.Enabled:=False;
  panel2.Enabled:=False;
  DBGrid1.ReadOnly:=True;
end;

procedure TFormPEMBELIAN.abnormal;
begin
  btambah.Enabled:=False;
  bsimpan.Enabled:=True;
  bbatal.Enabled:=True;
  panel2.Enabled:=True;
  DBGrid1.ReadOnly:=False;
end;

procedure TFormPEMBELIAN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.TMBeli.Active:= False;
  DM.TDBeli.Active:= False;
  FormPEMBELIAN := Nil;
  Action := CaFree;
end;

procedure TFormPEMBELIAN.btambahClick(Sender: TObject);
begin
   abnormal;
   DM.TMBeli.Insert;
   DM.TDBeli.Insert;
end;

procedure TFormPEMBELIAN.bsimpanClick(Sender: TObject);
begin
   normal;
   DM.TMBeli.Post;
   DM.TDBeli.Post;
end;

procedure TFormPEMBELIAN.bbatalClick(Sender: TObject);
begin
   normal;
   DM.TMBeli.Cancel;
   DM.TDBeli.Cancel;
end;

procedure TFormPEMBELIAN.SpeedButton1Click(Sender: TObject);
begin
  If FormSEARCH.ShowModal = mrOK Then
  Begin
    DM.QPublik.Active := True;
    DBEdit3.Text := DM.QPublik['ID_Supplier'];
    edit4.Text := DM.QPublik['Supplier']
  End;
end;

end.
