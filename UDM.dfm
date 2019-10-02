object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 656
  Width = 296
  object TKaryawan: TADOTable
    Connection = FormLOGIN.ADOConnection1
    CursorType = ctStatic
    TableName = 'Karyawan'
    Left = 16
    Top = 8
  end
  object DSKaryawan2: TDataSource
    DataSet = TKaryawan
    Left = 80
    Top = 9
  end
  object QKaryawan: TADOQuery
    Connection = FormLOGIN.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from Karyawan')
    Left = 152
    Top = 8
  end
  object DSKaryawan1: TDataSource
    DataSet = QKaryawan
    Left = 216
    Top = 9
  end
  object TBarang: TADOTable
    Connection = FormLOGIN.ADOConnection1
    CursorType = ctStatic
    TableName = 'Barang_Jasa'
    Left = 16
    Top = 56
  end
  object QBarang: TADOQuery
    Connection = FormLOGIN.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Barang_Jasa')
    Left = 152
    Top = 56
  end
  object DSBarang1: TDataSource
    DataSet = QBarang
    Left = 216
    Top = 56
  end
  object DSBarang2: TDataSource
    DataSet = TBarang
    Left = 80
    Top = 56
  end
  object TSupplier: TADOTable
    Connection = FormLOGIN.ADOConnection1
    CursorType = ctStatic
    TableName = 'Supplier'
    Left = 16
    Top = 104
  end
  object DSSupplier2: TDataSource
    DataSet = TSupplier
    Left = 80
    Top = 106
  end
  object QSupplier: TADOQuery
    Connection = FormLOGIN.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from Supplier')
    Left = 152
    Top = 104
  end
  object DSSupplier1: TDataSource
    DataSet = QSupplier
    Left = 216
    Top = 105
  end
  object TPembeli: TADOTable
    Connection = FormLOGIN.ADOConnection1
    CursorType = ctStatic
    TableName = 'Pembeli'
    Left = 16
    Top = 151
  end
  object QPembeli: TADOQuery
    Connection = FormLOGIN.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from Pembeli')
    Left = 152
    Top = 152
  end
  object DSPembeli1: TDataSource
    DataSet = QPembeli
    Left = 216
    Top = 153
  end
  object DSPembeli2: TDataSource
    DataSet = TPembeli
    Left = 80
    Top = 152
  end
  object TPengguna: TADOTable
    Connection = FormLOGIN.ADOConnection1
    TableName = 'Pengguna'
    Left = 16
    Top = 200
  end
  object DSPengguna: TDataSource
    DataSet = TPengguna
    Left = 80
    Top = 201
  end
  object TMJual: TADOTable
    Connection = FormLOGIN.ADOConnection1
    CursorType = ctStatic
    TableName = 'Master_Penjualan'
    Left = 16
    Top = 248
    object TMJualNota: TWideStringField
      FieldName = 'Nota'
      Size = 6
    end
    object TMJualTanggal: TDateTimeField
      FieldName = 'Tanggal'
    end
    object TMJualID_Pembeli: TWideStringField
      FieldName = 'ID_Pembeli'
      Size = 6
    end
    object TMJualTotal: TBCDField
      FieldName = 'Total'
      DisplayFormat = '###,##0'
      Precision = 19
    end
  end
  object TDJual: TADOTable
    Connection = FormLOGIN.ADOConnection1
    CursorType = ctStatic
    BeforePost = TDJualBeforePost
    AfterPost = TDJualAfterPost
    AfterDelete = TDJualAfterDelete
    IndexFieldNames = 'Nota'
    MasterFields = 'Nota'
    MasterSource = DSMJual
    TableName = 'Detil_Penjualan'
    Left = 16
    Top = 296
    object TDJualNota: TWideStringField
      FieldName = 'Nota'
      Size = 6
    end
    object TDJualKode_Barang: TWideStringField
      DisplayLabel = 'Kode'
      FieldName = 'Kode_Barang'
      LookupDataSet = TBarang
      LookupKeyFields = 'Kode'
      LookupResultField = 'Kode'
      Size = 6
    end
    object TDJualNama: TStringField
      FieldKind = fkLookup
      FieldName = 'Nama'
      LookupDataSet = TBarang
      LookupKeyFields = 'Kode'
      LookupResultField = 'Nama'
      KeyFields = 'Kode_Barang'
      Size = 30
      Lookup = True
    end
    object TDJualMerk: TStringField
      FieldKind = fkLookup
      FieldName = 'Merk'
      LookupDataSet = TBarang
      LookupKeyFields = 'Kode'
      LookupResultField = 'Merk'
      KeyFields = 'Kode_Barang'
      Size = 10
      Lookup = True
    end
    object TDJualStok: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Stok'
      LookupDataSet = TBarang
      LookupKeyFields = 'Kode'
      LookupResultField = 'Stok'
      KeyFields = 'Kode_Barang'
      ReadOnly = True
      Lookup = True
    end
    object TDJualQty: TIntegerField
      FieldName = 'Qty'
    end
    object TDJualhrg: TCurrencyField
      DisplayLabel = 'Harga'
      FieldKind = fkLookup
      FieldName = 'hrg'
      LookupDataSet = TBarang
      LookupKeyFields = 'Kode'
      LookupResultField = 'Harga'
      KeyFields = 'Kode_Barang'
      ReadOnly = True
      EditFormat = '###,##0'
      Lookup = True
    end
    object TDJualJumlah: TBCDField
      FieldName = 'Jumlah'
      DisplayFormat = '###,##0'
      currency = True
      Precision = 19
    end
  end
  object DSMJual: TDataSource
    DataSet = TMJual
    Left = 80
    Top = 248
  end
  object DSDJual: TDataSource
    DataSet = TDJual
    Left = 80
    Top = 296
  end
  object QUmum: TADOQuery
    Connection = FormLOGIN.ADOConnection1
    Parameters = <>
    Left = 16
    Top = 344
  end
  object DSUmum: TDataSource
    DataSet = QUmum
    Left = 80
    Top = 345
  end
  object Q1: TADOQuery
    Connection = FormLOGIN.ADOConnection1
    Parameters = <>
    Left = 16
    Top = 392
  end
  object DSMBeli: TDataSource
    DataSet = TMBeli
    Left = 216
    Top = 200
  end
  object DSDBeli: TDataSource
    DataSet = TDBeli
    Left = 216
    Top = 248
  end
  object TMBeli: TADOTable
    Connection = FormLOGIN.ADOConnection1
    CursorType = ctStatic
    TableName = 'Master_Pembelian'
    Left = 152
    Top = 204
    object TMBeliNota: TWideStringField
      FieldName = 'Nota'
      Size = 6
    end
    object TMBeliTanggal: TDateTimeField
      FieldName = 'Tanggal'
    end
    object TMBeliID_Supplier: TWideStringField
      FieldName = 'ID_Supplier'
      Size = 6
    end
    object TMBeliTotal: TBCDField
      FieldName = 'Total'
      DisplayFormat = '###,##0'
      Precision = 19
    end
  end
  object Q2: TADOQuery
    Connection = FormLOGIN.ADOConnection1
    Parameters = <>
    Left = 80
    Top = 392
  end
  object TDBeli: TADOTable
    Connection = FormLOGIN.ADOConnection1
    CursorType = ctStatic
    BeforePost = TDBeliBeforePost
    AfterPost = TDBeliAfterPost
    AfterDelete = TDBeliAfterDelete
    IndexFieldNames = 'Nota'
    MasterFields = 'Nota'
    MasterSource = DSMBeli
    TableName = 'Detil_Pembelian'
    Left = 152
    Top = 251
    object TDBeliNota: TWideStringField
      FieldName = 'Nota'
      Size = 6
    end
    object TDBeliKode_Barang: TWideStringField
      FieldName = 'Kode_Barang'
      LookupDataSet = QBarang
      LookupKeyFields = 'Kode'
      LookupResultField = 'Kode'
      Size = 6
    end
    object TDBeliNama_Barang: TStringField
      FieldKind = fkLookup
      FieldName = 'Nama_Barang'
      LookupDataSet = QBarang
      LookupKeyFields = 'Kode'
      LookupResultField = 'Nama'
      KeyFields = 'Kode_Barang'
      Lookup = True
    end
    object TDBeliMerk: TStringField
      FieldKind = fkLookup
      FieldName = 'Merk'
      LookupDataSet = TBarang
      LookupKeyFields = 'Kode'
      LookupResultField = 'Merk'
      KeyFields = 'Kode_Barang'
      Lookup = True
    end
    object TDBeliStok: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Stok'
      LookupDataSet = TBarang
      LookupKeyFields = 'Kode'
      LookupResultField = 'Stok'
      KeyFields = 'Kode_Barang'
      ReadOnly = True
      Visible = False
      Lookup = True
    end
    object TDBeliQty: TIntegerField
      FieldName = 'Qty'
      OnChange = TDBeliQtyChange
    end
    object TDBelihrg: TCurrencyField
      DisplayLabel = 'Harga'
      FieldKind = fkLookup
      FieldName = 'hrg'
      LookupDataSet = TBarang
      LookupKeyFields = 'Kode'
      LookupResultField = 'Harga_Pokok'
      KeyFields = 'Kode_Barang'
      ReadOnly = True
      Lookup = True
    end
    object TDBeliJumlah: TBCDField
      FieldName = 'Jumlah'
      DisplayFormat = '###,##0'
      Precision = 19
    end
    object TDBelistk: TIntegerField
      DisplayLabel = 'Stok Akhir'
      FieldKind = fkCalculated
      FieldName = 'stk'
      Calculated = True
    end
  end
  object QPublik: TADOQuery
    Connection = FormLOGIN.ADOConnection1
    Parameters = <>
    Left = 152
    Top = 297
  end
  object DSPublik: TDataSource
    DataSet = QPublik
    Left = 216
    Top = 297
  end
  object Q3: TADOQuery
    Connection = FormLOGIN.ADOConnection1
    Parameters = <>
    Left = 16
    Top = 441
  end
  object TRBeli: TADOTable
    Connection = FormLOGIN.ADOConnection1
    TableName = 'Retur_Beli'
    Left = 152
    Top = 347
    object TRBeliNomer: TAutoIncField
      FieldName = 'Nomer'
      ReadOnly = True
    end
    object TRBeliTanggal: TDateTimeField
      FieldName = 'Tanggal'
    end
    object TRBeliID_Supplier: TWideStringField
      FieldName = 'ID_Supplier'
      LookupDataSet = TMBeli
      LookupKeyFields = 'ID_Supplier'
      LookupResultField = 'ID_Supplier'
      Size = 6
    end
    object TRBeliKode_Barang: TWideStringField
      FieldName = 'Kode_Barang'
      LookupDataSet = TDBeli
      LookupKeyFields = 'Kode_Barang'
      LookupResultField = 'Kode_Barang'
      Size = 6
    end
    object TRBeliKeterangan: TWideStringField
      FieldName = 'Keterangan'
      Size = 75
    end
    object TRBeliTindakan: TWideStringField
      FieldName = 'Tindakan'
      Visible = False
      Size = 15
    end
  end
  object TRJual: TADOTable
    Connection = FormLOGIN.ADOConnection1
    TableName = 'Retur_Jual'
    Left = 152
    Top = 392
    object TRJualNomer: TAutoIncField
      FieldName = 'Nomer'
      ReadOnly = True
    end
    object TRJualTanggal: TDateTimeField
      FieldName = 'Tanggal'
    end
    object TRJualID_Pembeli: TWideStringField
      FieldName = 'ID_Pembeli'
      Size = 6
    end
    object TRJualKode_Barang: TWideStringField
      FieldName = 'Kode_Barang'
      Size = 6
    end
    object TRJualKeterangan: TWideStringField
      FieldName = 'Keterangan'
      Size = 75
    end
    object TRJualTindakan: TWideStringField
      FieldName = 'Tindakan'
      Visible = False
      Size = 15
    end
  end
  object DSRBeli: TDataSource
    DataSet = TRBeli
    Left = 216
    Top = 348
  end
  object DSRJual: TDataSource
    DataSet = TRJual
    Left = 216
    Top = 392
  end
end
