object DataCM: TDataCM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 139
  Width = 217
  object DSRC_Data: TDSRestConnection
    Host = 'localhost'
    Port = 223
    Context = 'api/'
    RESTContext = 'gestao/'
    LoginPrompt = False
    PreserveSessionID = False
    Left = 72
    Top = 32
    UniqueId = '{1C79D6CA-3563-452B-AA46-407F614FD370}'
  end
end
