object UMM: TUMM
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  Theme = 'uni_mac_triton'
  TouchTheme = 'ios'
  MonitoredKeys.Keys = <>
  EnableSynchronousOperations = True
  OnSessionTimeout = UniGUIMainModuleSessionTimeout
  Height = 150
  Width = 285
  object DB: TFDConnection
    Params.Strings = (
      'Server='
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object MysqlLink: TFDPhysMySQLDriverLink
    DriverID = 'MySql'
    VendorLib = 'C:\gestaoweb\libmysql.dll'
    Left = 88
    Top = 8
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 152
    Top = 8
  end
end
