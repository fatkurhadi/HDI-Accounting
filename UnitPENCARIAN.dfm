object FormPENCARIAN: TFormPENCARIAN
  Left = 364
  Top = 178
  Width = 632
  Height = 374
  Caption = 'Customer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 164
      Height = 16
      Caption = 'Pencarian Berdasarkan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 136
      Top = 56
      Width = 59
      Height = 16
      Caption = 'Karakter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 216
      Top = 24
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'ID'
        'Pembeli')
    end
    object Edit1: TEdit
      Left = 216
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 624
    Height = 189
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 622
      Height = 187
      Align = alClient
      DataSource = DM.DSUmum
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 286
    Width = 624
    Height = 54
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 536
      Top = 16
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
  end
end
