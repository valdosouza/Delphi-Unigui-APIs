object UMM: TUMM
  OldCreateOrder = False
  Height = 213
  Width = 498
  object Qr_Crud: TFDQuery
    Filtered = True
    Connection = DB
    SQL.Strings = (
      '       Select distinct sl.id, sl.description, sl.kind'
      '       from tb_stock_list sl ')
    Left = 16
    Top = 80
  end
  object MysqlLink: TFDPhysMySQLDriverLink
    DriverID = 'MySql'
    VendorLib = 'C:\gestaoweb\libmysql.dll'
    Left = 80
    Top = 16
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 152
    Top = 16
  end
  object DB: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 16
    Top = 16
  end
end
