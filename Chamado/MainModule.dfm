object UMM: TUMM
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  Theme = 'triton.modified'
  MonitoredKeys.Keys = <>
  ServerMessages.LoadingMessage = 'Carregando...'
  Height = 150
  Width = 215
  object DB: TFDConnection
    Params.Strings = (
      'Database=gestao_setes'
      'User_Name=gestao_setes'
      'Server=177.70.22.118'
      'Password=^nfI1a99'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object MysqlLink: TFDPhysMySQLDriverLink
    DriverID = 'MySql'
    VendorLib = 'libmysql.dll'
    Left = 80
    Top = 8
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 152
    Top = 8
  end
  object Qr_Crud: TFDQuery
    Filtered = True
    Connection = DB
    SQL.Strings = (
      'select *'
      'from tb_iteration_attachment')
    Left = 24
    Top = 72
  end
end
