unit UnitKARYAWAN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids,
  DBGrids;

type
  TFormKARYAWAN = class(TForm)
    PageControl1: TPageControl;
    TS_Data_Karyawan: TTabSheet;
    TS_Karyawan: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    btambah: TBitBtn;
    bhapus: TBitBtn;
    bedit: TBitBtn;
    bsimpan: TBitBtn;
    bbatal: TBitBtn;
    GroupBox1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    dbedt1: TDBEdit;
    dbedt2: TDBEdit;
    dbedt3: TDBEdit;
    dbedt4: TDBEdit;
    dbedt5: TDBEdit;
    dbedt7: TDBEdit;
    dbedt8: TDBEdit;
    DBComboBox1: TDBComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btambahClick(Sender: TObject);
    procedure bhapusClick(Sender: TObject);
    procedure beditClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    procedure normal;
    procedure abnormal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormKARYAWAN: TFormKARYAWAN;

implementation
uses UDM, Math;
{$R *.dfm}

procedure TFormKARYAWAN.normal;
begin
  btambah.Enabled:=True;
  bhapus.Enabled:=True;
  bedit.Enabled:=True;
  bsimpan.Enabled:=False;
  bbatal.Enabled:=False;
  pnl2.Enabled:=False;
end;

procedure TFormKARYAWAN.abnormal;
begin
  btambah.Enabled:=False;
  bhapus.Enabled:=False;
  bedit.Enabled:=False;
  bsimpan.Enabled:=True;
  bbatal.Enabled:=True;
  pnl2.Enabled:=True;
end;

procedure TFormKARYAWAN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.TKaryawan.Active:=False;
  DM.QKaryawan.Active:=False;
   FormKARYAWAN := Nil;
   Action := CaFree;
end;

procedure TFormKARYAWAN.btambahClick(Sender: TObject);
begin
   abnormal;
   DM.TKaryawan.Insert;
end;

procedure TFormKARYAWAN.bhapusClick(Sender: TObject);
begin
  if Application.MessageBox ('Yakin Ingin Hapus Data?',
    'Konfirmasi',MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DM.TKaryawan.Delete;
   normal;
   end;
end;

procedure TFormKARYAWAN.beditClick(Sender: TObject);
begin
  DM.TKaryawan.Edit;
   abnormal;
end;

procedure TFormKARYAWAN.bsimpanClick(Sender: TObject);
begin
  if Application.MessageBox ('Yakin Ingin Simpan Data?',
    'Konfirmasi',MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DM.TKaryawan.Post;
   normal;
   end;
end;

procedure TFormKARYAWAN.bbatalClick(Sender: TObject);
begin
   DM.TKaryawan.Cancel;
   normal;
end;

procedure TFormKARYAWAN.DateTimePicker1Change(Sender: TObject);
begin
   dbedt5.Text:=FormatDateTime('DD/MM/YYYY',DateTimePicker1.Date);
end;

procedure TFormKARYAWAN.DateTimePicker2Change(Sender: TObject);
begin
   dbedt8.Text:=FormatDateTime('DD/MM/YYYY',DateTimePicker2.Date);
end;

procedure TFormKARYAWAN.BitBtn1Click(Sender: TObject);
begin
  With DM.QKaryawan Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Karyawan');
        if ComboBox1.ItemIndex = 0 then
           SQL.Add('Where NIP Like '''+Edit1.Text+'%''  ');
        If ComboBox1.ItemIndex = 1 then
           SQL.Add('Where Nama like '''+Edit1.Text+'%'' ');
        Open;
      End;
end;

procedure TFormKARYAWAN.Edit1Change(Sender: TObject);
begin
  With DM.QKaryawan Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Karyawan');
        if ComboBox1.ItemIndex = 0 then
           SQL.Add('Where NIP Like '''+Edit1.Text+'%''  ');
        If ComboBox1.ItemIndex = 1 then
           SQL.Add('Where Nama like '''+Edit1.Text+'%'' ');
        Open;
      End;
end;

procedure TFormKARYAWAN.DBGrid1CellClick(Column: TColumn);
var
  I : Integer;
begin
  If DM.QKaryawan.RecordCount > 0 then
  begin
    DM.TKaryawan.First;
    for I:= 1 to DM.TKaryawan.RecordCount do
    begin
      if DM.QKaryawan['NIP'] <> DM.TKaryawan['NIP'] then
         DM.TKaryawan.Next
      else
        Exit;
    end;
  end;
end;

end.
