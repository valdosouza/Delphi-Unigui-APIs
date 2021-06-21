object UMM: TUMM
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  MonitoredKeys.Keys = <>
  OnSessionTimeout = UniGUIMainModuleSessionTimeout
  Height = 150
  Width = 215
  object DB: TFDConnection
    Params.Strings = (
      'Database=gestao_setes'
      'User_Name=gestao_setes'
      'Server=177.70.22.118'
      'Password=A8&3v8fo'
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
  object Qr_Crud: TFDQuery
    Filtered = True
    Connection = DB
    SQL.Strings = (
      'Select  '
      'tb_project_id,  '
      'id,  '
      'dt_record,  '
      'desc_interface,  '
      'note '
      'from tb_proj_log_changes  '
      'where (tb_project_id =44) ')
    Left = 24
    Top = 72
  end
  object DSP: TDataSetProvider
    DataSet = Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 80
    Top = 72
  end
end
