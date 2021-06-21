object UMM: TUMM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 326
  Width = 385
  object Qr_Crud: TFDQuery
    Active = True
    Filtered = True
    Connection = DB
    SQL.Strings = (
      'SELECT *'
      'FROM tb_check_out_items')
    Left = 16
    Top = 80
  end
  object DB: TFDConnection
    Params.Strings = (
      'Password=masterkey'
      'User_Name=sysdba'
      'Port=3050'
      'Database=D:\Modelos\DoceCenter\Database\IBGCOM.FDB'
      'CharacterSet=WIN1252'
      'OSAuthent=No'
      'DriverID=FB')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    Connected = True
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
    Left = 200
    Top = 24
  end
  object FDScript1: TFDScript
    SQLScripts = <>
    Connection = DB
    Params = <>
    Macros = <>
    Left = 200
    Top = 120
  end
  object FDCommand1: TFDCommand
    Connection = DB
    Left = 56
    Top = 200
  end
end
