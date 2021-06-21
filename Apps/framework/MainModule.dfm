object UMM: TUMM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 212
  Width = 385
  object SQLite: TFDPhysSQLiteDriverLink
    Left = 72
    Top = 16
  end
  object DB: TFDConnection
    Params.Strings = (
      'Database=D:\Bin\gestaoweb\gestaomob.db'
      'DriverID=SQLite'
      'SharedCache=False'
      'LockingMode=Normal')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 17
    Top = 16
  end
  object Cursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    ScreenCursor = gcrDefault
    Left = 120
    Top = 16
  end
  object DevicePrint: TBluetooth
    Enabled = False
    Left = 208
    Top = 16
  end
end
