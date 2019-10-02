unit UnitBARANG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, Mask, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids;

type
  TFormBARANG = class(TForm)
    PageControl1: TPageControl;
    TS_Data_Barang: TTabSheet;
    TS_Barang: TTabSheet;
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
    GroupBox3: TGroupBox;
    DBComboBox1: TDBComboBox;
    GroupBox4: TGroupBox;
    ComboBox2: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btambahClick(Sender: TObject);
    procedure bhapusClick(Sender: TObject);
    procedure beditClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ComboBox2Change(Sender: TObject);

  private
        procedure normal;
        procedure abnormal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBARANG: TFormBARANG;

implementation
uses UDM;
{$R *.dfm}

procedure TFormBARANG.normal;
begin
  btambah.Enabled:=True;
  bhapus.Enabled:=True;
  bedit.Enabled:=True;
  bsimpan.Enabled:=False;
  bbatal.Enabled:=False;
  pnl2.Enabled:=False;
end;

procedure TFormBARANG.abnormal;
begin
  btambah.Enabled:=False;
  bhapus.Enabled:=False;
  bedit.Enabled:=False;
  bsimpan.Enabled:=True;
  bbatal.Enabled:=True;
  pnl2.Enabled:=True;
end;

procedure TFormBARANG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.TBarang.Active:=False;
  DM.QBarang.Active:=False;
  FormBARANG := Nil;
  Action := CaFree;
end;

procedure TFormBARANG.btambahClick(Sender: TObject);
begin
   abnormal;
   DM.TBarang.Insert;
end;

procedure TFormBARANG.bhapusClick(Sender: TObject);
begin
  if Application.MessageBox ('Yakin Ingin Hapus Data?',
    'Konfirmasi',MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DM.TBarang.Delete;
   normal;
   end;
end;

procedure TFormBARANG.beditClick(Sender: TObject);
begin
  DM.TBarang.Edit;
   abnormal;
end;

procedure TFormBARANG.bsimpanClick(Sender: TObject);
begin
  if Application.MessageBox ('Yakin Ingin Simpan Data?',
    'Konfirmasi',MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DM.TBarang.Post;
   normal;
   end;
end;

procedure TFormBARANG.bbatalClick(Sender: TObject);
begin
   DM.TBarang.Cancel;
   normal;
end;

procedure TFormBARANG.Edit1Change(Sender: TObject);
begin
  With DM.QBarang Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Barang_Jasa');
        if ComboBox1.ItemIndex = 0 then
           SQL.Add('Where Kode Like '''+Edit1.Text+'%''  ');
        If ComboBox1.ItemIndex = 1 then
           SQL.Add('Where Nama like '''+Edit1.Text+'%'' ');
        If ComboBox1.ItemIndex = 2 then
           SQL.Add('Where Merk like '''+Edit1.Text+'%'' ');
        Open;
      End;
end;

procedure TFormBARANG.BitBtn1Click(Sender: TObject);
begin
  With DM.QBarang Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Barang_Jasa');
        if ComboBox1.ItemIndex = 0 then
           SQL.Add('Where Kode Like '''+Edit1.Text+'%''  ');
        If ComboBox1.ItemIndex = 1 then
           SQL.Add('Where Nama like '''+Edit1.Text+'%'' ');
        If ComboBox1.ItemIndex = 2 then
           SQL.Add('Where Merk like '''+Edit1.Text+'%'' ');
        Open;
      End;
end;

procedure TFormBARANG.DBGrid1CellClick(Column: TColumn);
var
  I : Integer;
begin
  If DM.QBarang.RecordCount > 0 then
  begin
    DM.TBarang.First;
    for I:= 1 to DM.TBarang.RecordCount do
    begin
      if DM.QBarang['Kode'] <> DM.TBarang['Kode'] then
         DM.TBarang.Next
      else
        Exit;
    end;
  end;
end;

procedure TFormBARANG.ComboBox2Change(Sender: TObject);
begin
  if ComboBox2.ItemIndex = 0 then
  begin
    With DM.QBarang Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Barang_Jasa');
        SQL.Add('Where Kategori = '''+ComboBox2.Text+''' ');
        Open;
      End;
  end;
  if ComboBox2.ItemIndex = 1 then
  begin
    With DM.QBarang Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select Kode,Nama,Kategori,Harga from Barang_Jasa');
        SQL.Add('Where Kategori = '''+ComboBox2.Text+''' ');
        Open;
      End;
  end;
end;

end.
