object ServiceCM: TServiceCM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 415
  object DSRC_Service: TDSRestConnection
    Host = 'localhost'
    Port = 225
    Context = 'api/'
    RESTContext = 'gestao/'
    LoginPrompt = False
    Left = 48
    Top = 40
    UniqueId = '{B7D05E53-5048-4845-B22C-41860D027F5E}'
  end
end
