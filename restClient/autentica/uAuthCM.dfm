object AuthCM: TAuthCM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 152
  Width = 171
  object DSRestAuth: TDSRestConnection
    Port = 224
    LoginPrompt = False
    Left = 48
    Top = 24
    UniqueId = '{9430BC48-01DB-416B-8CB8-E582808C2DCB}'
  end
end
