unit UnitPENJUALAN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrls;

type
  TFormPENJUALAN = class(TForm)
    PageControl1: TPageControl;
    TS_Penjualan: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Nota: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit4: TEdit;
    btambah: TBitBtn;
    bsimpan: TBitBtn;
    bbatal: TBitBtn;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox1: TGroupBox;
    DBEdit4: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btambahClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
  private
    procedure normal;
    procedure abnormal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPENJUALAN: TFormPENJUALAN;

implementation
 uses UDM, UnitPENCARIAN;
{$R *.dfm}

procedure TFormPENJUALAN.normal;
begin
  btambah.Enabled:=True;
  bsimpan.Enabled:=False;
  bbatal.Enabled:=False;
  panel2.Enabled:=False;
  DBGrid1.ReadOnly:=True;
end;

procedure TFormPENJUALAN.abnormal;
begin
  btambah.Enabled:=False;
  bsimpan.Enabled:=True;
  bbatal.Enabled:=True;
  panel2.Enabled:=True;
  DBGrid1.ReadOnly:=False;
end;

procedure TFormPENJUALAN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.TMJual.Active:= False;
  DM.TDJual.Active:= False;
  FormPENJUALAN := Nil;
  Action := CaFree;
end;

procedure TFormPENJUALAN.SpeedButton1Click(Sender: TObject);
begin
  If FormPencarian.ShowModal = mrOK Then
  Begin
    DM.QUmum.Active := True;
    DBEdit3.Text := DM.QUmum['ID_PEMBELI'];
    edit4.Text := DM.QUmum['Pembeli']
  End;
end;

procedure TFormPENJUALAN.btambahClick(Sender: TObject);
begin
   abnormal;
   DM.TMJual.Insert;
   DM.TDJual.Insert;
end;

procedure TFormPENJUALAN.bsimpanClick(Sender: TObject);
begin
   normal;
   DM.TMJual.Post;
   DM.TDJual.Post;
end;

procedure TFormPENJUALAN.bbatalClick(Sender: TObject);
begin
   normal;
   DM.TMJual.Cancel;
   DM.TDJual.Cancel;
end;

end.
