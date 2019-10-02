unit UnitPEMBELI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Mask, DBCtrls, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids;

type
  TFormPEMBELI = class(TForm)
    PageControl1: TPageControl;
    TS_Data_Pembeli: TTabSheet;
    TS_Pembeli: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    pnl1: TPanel;
    btambah: TBitBtn;
    bhapus: TBitBtn;
    bedit: TBitBtn;
    bsimpan: TBitBtn;
    bbatal: TBitBtn;
    pnl2: TPanel;
    GroupBox1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dbedt1: TDBEdit;
    dbedt2: TDBEdit;
    dbedt3: TDBEdit;
    dbedt4: TDBEdit;
    dbedt5: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btambahClick(Sender: TObject);
    procedure bhapusClick(Sender: TObject);
    procedure beditClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    procedure normal;
    procedure abnormal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPEMBELI: TFormPEMBELI;

implementation
uses UDM;
{$R *.dfm}

procedure TFormPEMBELI.normal;
begin
  btambah.Enabled:=True;
  bhapus.Enabled:=True;
  bedit.Enabled:=True;
  bsimpan.Enabled:=False;
  bbatal.Enabled:=False;
  pnl2.Enabled:=False;
end;

procedure TFormPEMBELI.abnormal;
begin
  btambah.Enabled:=False;
  bhapus.Enabled:=False;
  bedit.Enabled:=False;
  bsimpan.Enabled:=True;
  bbatal.Enabled:=True;
  pnl2.Enabled:=True;
end;

procedure TFormPEMBELI.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
   DM.TPembeli.Active:=False;
   DM.QPembeli.Active:=False;
   FormPEMBELI := Nil;
   Action := CaFree;
end;

procedure TFormPEMBELI.btambahClick(Sender: TObject);
begin
    abnormal;
   DM.TPembeli.Insert;
end;

procedure TFormPEMBELI.bhapusClick(Sender: TObject);
begin
  if Application.MessageBox ('Yakin Ingin Hapus Data?',
    'Konfirmasi',MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DM.TPembeli.Delete;
   normal;
   end;
end;

procedure TFormPEMBELI.beditClick(Sender: TObject);
begin
  DM.TPembeli.Edit;
   abnormal;
end;

procedure TFormPEMBELI.bsimpanClick(Sender: TObject);
begin
  if Application.MessageBox ('Yakin Ingin Simpan Data?',
    'Konfirmasi',MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DM.TPembeli.Post;
   normal;
   end;
end;

procedure TFormPEMBELI.bbatalClick(Sender: TObject);
begin
   DM.TPembeli.Cancel;
   normal;
end;

procedure TFormPEMBELI.Edit1Change(Sender: TObject);
begin
  With DM.QPembeli Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Pembeli');
        if ComboBox1.ItemIndex = 0 then
           SQL.Add('Where ID_Pembeli Like '''+Edit1.Text+'%''  ');
        If ComboBox1.ItemIndex = 1 then
           SQL.Add('Where Pembeli like '''+Edit1.Text+'%'' ');
        Open;
      End;
end;

procedure TFormPEMBELI.BitBtn1Click(Sender: TObject);
begin
  With DM.QPembeli Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Pembeli');
        if ComboBox1.ItemIndex = 0 then
           SQL.Add('Where ID_Pembeli Like '''+Edit1.Text+'%''  ');
        If ComboBox1.ItemIndex = 1 then
           SQL.Add('Where Pembeli like '''+Edit1.Text+'%'' ');
        Open;
      End;
end;

procedure TFormPEMBELI.DBGrid1CellClick(Column: TColumn);
var
  I : Integer;
begin
  If DM.QPembeli.RecordCount > 0 then
  begin
    DM.TPembeli.First;
    for I:= 1 to DM.TPembeli.RecordCount do
    begin
      if DM.QPembeli['ID_Pembeli'] <> DM.TPembeli['ID_Pembeli'] then
         DM.TPembeli.Next
      else
        Exit;
    end;
  end;
end;

end.
