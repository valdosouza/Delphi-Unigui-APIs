object SC: TSC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 309
  Width = 638
  object DSServer1: TDSServer
    OnDisconnect = DSServer1Disconnect
    OnError = DSServer1Error
    Left = 32
    Top = 27
  end
  object DS_SC_Auth: TDSServerClass
    OnGetClass = DS_SC_AuthGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 40
    Top = 99
  end
  object MysqlLink: TFDPhysMySQLDriverLink
    DriverID = 'MySql'
    VendorLib = 'libmysql.dll'
    Left = 433
    Top = 8
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 525
    Top = 16
  end
  object AppEvent: TApplicationEvents
    OnException = AppEventException
    Left = 352
    Top = 16
  end
end
