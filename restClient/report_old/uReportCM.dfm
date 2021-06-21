object ReportCM: TReportCM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 236
  Width = 363
  object DSRestReport: TDSRestConnection
    Host = 'localhost'
    Port = 8001
    LoginPrompt = False
    PreserveSessionID = False
    Left = 48
    Top = 40
    UniqueId = '{CD6A43F1-F93B-4240-ADA2-287E190915A6}'
  end
end
