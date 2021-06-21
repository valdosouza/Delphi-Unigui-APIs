object SC: TSC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 248
  Width = 444
  object MysqlLink: TFDPhysMySQLDriverLink
    DriverID = 'MySql'
    VendorLib = 'C:\gestaoweb\libmysql.dll'
    Left = 254
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 366
    Top = 16
  end
  object DS_SC_Media: TDSServerClass
    OnGetClass = DS_SC_MediaGetClass
    Server = DSServidor
    LifeCycle = 'Invocation'
    Left = 32
    Top = 89
  end
  object DSServidor: TDSServer
    OnDisconnect = DSServidorDisconnect
    OnError = DSServidorError
    ChannelResponseTimeout = 0
    Left = 24
    Top = 11
  end
  object AppEvent: TApplicationEvents
    Left = 144
    Top = 8
  end
  object TesteDB: TFDConnection
    Params.Strings = (
      'Database=gestao_setes'
      'User_Name=gestao_setes'
      'Server=177.70.22.118'
      'Password=A8&3v8fo'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 272
    Top = 88
  end
  object DS_SC_Financial: TDSServerClass
    OnGetClass = DS_SC_FinancialGetClass
    Server = DSServidor
    LifeCycle = 'Invocation'
    Left = 40
    Top = 153
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServidor
    LifeCycle = 'Invocation'
    Left = 136
    Top = 81
  end
end
