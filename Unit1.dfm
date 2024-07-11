object Form1: TForm1
  Left = 382
  Top = 270
  Width = 1044
  Height = 440
  Caption = 'SATUAN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 80
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object Label2: TLabel
    Left = 104
    Top = 112
    Width = 50
    Height = 13
    Caption = 'DISKRIPSI'
  end
  object Label3: TLabel
    Left = 112
    Top = 328
    Width = 80
    Height = 13
    Caption = 'MASUKAN NAMA'
  end
  object DBGrid1: TDBGrid
    Left = 112
    Top = 184
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 112
    Top = 144
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 144
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 288
    Top = 144
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 376
    Top = 144
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 176
    Top = 72
    Width = 305
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 176
    Top = 104
    Width = 305
    Height = 21
    TabOrder = 6
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 208
    Top = 328
    Width = 297
    Height = 21
    TabOrder = 7
    Text = 'Edit3'
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    AutoCommit = False
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'D:\visual uts2\tugas\libmysql.dll'
    Left = 776
    Top = 112
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from satuan')
    Params = <>
    Left = 776
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 776
    Top = 256
  end
end
