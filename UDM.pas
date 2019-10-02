unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    TKaryawan: TADOTable;
    DSKaryawan2: TDataSource;
    QKaryawan: TADOQuery;
    DSKaryawan1: TDataSource;
    TBarang: TADOTable;
    QBarang: TADOQuery;
    DSBarang1: TDataSource;
    DSBarang2: TDataSource;
    TSupplier: TADOTable;
    DSSupplier2: TDataSource;
    QSupplier: TADOQuery;
    DSSupplier1: TDataSource;
    TPembeli: TADOTable;
    QPembeli: TADOQuery;
    DSPembeli1: TDataSource;
    DSPembeli2: TDataSource;
    TPengguna: TADOTable;
    DSPengguna: TDataSource;
    TMJual: TADOTable;
    TDJual: TADOTable;
    DSMJual: TDataSource;
    DSDJual: TDataSource;
    TDJualNota: TWideStringField;
    TDJualKode_Barang: TWideStringField;
    TDJualQty: TIntegerField;
    TDJualJumlah: TBCDField;
    TDJualNama: TStringField;
    TDJualhrg: TCurrencyField;
    QUmum: TADOQuery;
    DSUmum: TDataSource;
    Q1: TADOQuery;
    TDJualMerk: TStringField;
    TMJualNota: TWideStringField;
    TMJualTanggal: TDateTimeField;
    TMJualID_Pembeli: TWideStringField;
    TMJualTotal: TBCDField;
    TDJualStok: TIntegerField;
    DSMBeli: TDataSource;
    DSDBeli: TDataSource;
    TMBeli: TADOTable;
    Q2: TADOQuery;
    TMBeliNota: TWideStringField;
    TMBeliTanggal: TDateTimeField;
    TMBeliID_Supplier: TWideStringField;
    TMBeliTotal: TBCDField;
    TDBeli: TADOTable;
    TDBeliNota: TWideStringField;
    TDBeliKode_Barang: TWideStringField;
    TDBeliQty: TIntegerField;
    TDBeliJumlah: TBCDField;
    TDBeliNama_Barang: TStringField;
    TDBeliStok: TIntegerField;
    TDBelihrg: TCurrencyField;
    TDBeliMerk: TStringField;
    QPublik: TADOQuery;
    DSPublik: TDataSource;
    Q3: TADOQuery;
    TDBelistk: TIntegerField;
    TRBeli: TADOTable;
    TRJual: TADOTable;
    DSRBeli: TDataSource;
    DSRJual: TDataSource;
    TRBeliNomer: TAutoIncField;
    TRBeliTanggal: TDateTimeField;
    TRBeliID_Supplier: TWideStringField;
    TRBeliKode_Barang: TWideStringField;
    TRBeliKeterangan: TWideStringField;
    TRJualNomer: TAutoIncField;
    TRJualTanggal: TDateTimeField;
    TRJualID_Pembeli: TWideStringField;
    TRJualKode_Barang: TWideStringField;
    TRJualKeterangan: TWideStringField;
    TRBeliTindakan: TWideStringField;
    TRJualTindakan: TWideStringField;
    procedure TDJualBeforePost(DataSet: TDataSet);
    procedure TDJualAfterPost(DataSet: TDataSet);
    procedure TDJualAfterDelete(DataSet: TDataSet);
    procedure TDBeliBeforePost(DataSet: TDataSet);
    procedure TDBeliAfterPost(DataSet: TDataSet);
    procedure TDBeliAfterDelete(DataSet: TDataSet);
    procedure TDBeliQtyChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation
uses UnitLOGIN;
{$R *.dfm}

procedure TDM.TDJualBeforePost(DataSet: TDataSet);
begin
  TDJual['JUMLAH'] := TDJUAL['QTY'] * TDJual['HRG'];
end;

procedure TDM.TDJualAfterPost(DataSet: TDataSet);
begin
  With DM.Q1 Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select sum(Jumlah)as JML from Detil_Penjualan');
        SQL.Add('Where Nota = '''+DM.TMJual['Nota']+''' ');
        Open;
      End;
   DM.TMJual.Edit;
   DM.TMJual['Total'] := DM.Q1['JML'];
end;

procedure TDM.TDJualAfterDelete(DataSet: TDataSet);
begin
  With DM.Q1 Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select sum(Jumlah)as JML from Detil_Penjualan');
        SQL.Add('Where Nota = '''+DM.TMJual['Nota']+''' ');
        Open;
      End;
   DM.TMJual.Edit;
   DM.TMJual['Total'] := DM.Q1['JML'];
end;

procedure TDM.TDBeliBeforePost(DataSet: TDataSet);
begin
TDBeli['JUMLAH'] := TDBeli['QTY'] * TDBeli['HRG'];
TDBeli['STK'] := TDBeli['STOK'] + TDBeli['QTY'];
end;

procedure TDM.TDBeliAfterPost(DataSet: TDataSet);
begin
  With DM.Q2 Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select sum(Jumlah)as JML from Detil_Pembelian');
        SQL.Add('Where Nota = '''+DM.TMBeli['Nota']+''' ');
        Open;
      End;
   DM.TMBeli.Edit;
   DM.TMBeli['Total'] := DM.Q2['JML'];
end;

procedure TDM.TDBeliAfterDelete(DataSet: TDataSet);
begin
  With DM.Q2 Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select sum(Jumlah)as JML from Detil_Penjualan');
        SQL.Add('Where Nota = '''+DM.TMBeli['Nota']+''' ');
        Open;
      End;
   DM.TMBeli.Edit;
   DM.TMBeli['Total'] := DM.Q2['JML'];
end;


procedure TDM.TDBeliQtyChange(Sender: TField);
begin
TDBeli['STK'] := TDBeli['STOK'] + TDBeli['QTY'];
end;

End.
