object FormPEMBELIAN: TFormPEMBELIAN
  Left = 192
  Top = 124
  Width = 826
  Height = 589
  Caption = 'Pembelian'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 818
    Height = 555
    ActivePage = TS_Penjualan
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TS_Penjualan: TTabSheet
      Caption = 'Pembelian'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 172
        Width = 810
        Height = 355
        Align = alBottom
        DataSource = DM.DSDBeli
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 810
        Height = 49
        Align = alTop
        TabOrder = 1
        object btambah: TBitBtn
          Left = 16
          Top = 8
          Width = 75
          Height = 25
          Caption = 'tambah'
          TabOrder = 0
          OnClick = btambahClick
        end
        object bsimpan: TBitBtn
          Left = 104
          Top = 8
          Width = 75
          Height = 25
          Caption = 'simpan'
          Enabled = False
          TabOrder = 1
          OnClick = bsimpanClick
        end
        object bbatal: TBitBtn
          Left = 192
          Top = 8
          Width = 75
          Height = 25
          Caption = 'batal'
          Enabled = False
          TabOrder = 2
          OnClick = bbatalClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 49
        Width = 810
        Height = 123
        Align = alClient
        Enabled = False
        TabOrder = 2
        object Nota: TLabel
          Left = 8
          Top = 16
          Width = 31
          Height = 19
          Caption = 'Nota'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 8
          Top = 40
          Width = 47
          Height = 19
          Caption = 'Tanggal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 64
          Width = 70
          Height = 19
          Caption = 'ID Supplier'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 88
          Width = 50
          Height = 19
          Caption = 'Supplier'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 216
          Top = 64
          Width = 23
          Height = 22
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000C40E0000C40E00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F37FFFFFFFFF
            FFFF3337FFFFFFFFFFFFBB337FFFFFFFFFFFFBB337FFFFFFFFFFFFBB337FFFFF
            FFFFFFFBB33F7787FFFFFFFFB8778FFF88FFFFFFF888FFFFFF7FFFFFF788FFFF
            FF8FFFFFF888FFFFFF87FFFFF8888FFFFFF7FFFFF88888FFFFF7FFFFF788888F
            FF8FFFFFFF8FF8888F7FFFFFFFF8F88888FFFFFFFFFF7888FFFF}
          OnClick = SpeedButton1Click
        end
        object Edit4: TEdit
          Left = 88
          Top = 88
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit1: TDBEdit
          Left = 88
          Top = 16
          Width = 121
          Height = 21
          DataField = 'Nota'
          DataSource = DM.DSMBeli
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 88
          Top = 40
          Width = 121
          Height = 21
          DataField = 'Tanggal'
          DataSource = DM.DSMBeli
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 88
          Top = 64
          Width = 121
          Height = 21
          DataField = 'ID_Supplier'
          DataSource = DM.DSMBeli
          TabOrder = 3
        end
        object GroupBox1: TGroupBox
          Left = 624
          Top = 8
          Width = 185
          Height = 65
          Caption = 'Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object DBEdit4: TDBEdit
            Left = 8
            Top = 24
            Width = 169
            Height = 30
            DataField = 'Total'
            DataSource = DM.DSMBeli
            TabOrder = 0
          end
        end
      end
    end
  end
end
