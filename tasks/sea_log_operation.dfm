inherited SeaLogOperation: TSeaLogOperation
  Caption = 'Pesquisa de Log de Opera'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    inherited pc_search: TUniPageControl
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          ExplicitTop = -2
          object pnl_param_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 818
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            ExplicitLeft = 4
            ExplicitTop = 0
            object ctn_User: TUniContainerPanel
              Left = 216
              Top = 0
              Width = 273
              Height = 52
              Hint = ''
              Margins.Left = 5
              ParentColor = False
              Align = alLeft
              TabOrder = 1
              ExplicitLeft = 0
            end
            object pnl_data: TUniPanel
              Left = 0
              Top = 0
              Width = 216
              Height = 52
              Hint = ''
              Align = alLeft
              TabOrder = 2
              BorderStyle = ubsNone
              Caption = ''
              ExplicitLeft = 8
              object chbx_periodo: TUniCheckBox
                AlignWithMargins = True
                Left = 3
                Top = 5
                Width = 210
                Height = 17
                Hint = ''
                Margins.Top = 5
                Margins.Bottom = 0
                Checked = True
                Caption = 'Data Inicial            Data Final'
                Align = alTop
                TabOrder = 1
              end
              object pnl_data_campos: TUniPanel
                Left = 0
                Top = 22
                Width = 216
                Height = 30
                Hint = ''
                Align = alClient
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                object DTP_Date_Initial: TUniDateTimePicker
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 100
                  Height = 24
                  Hint = ''
                  DateTime = 42916.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alLeft
                  TabOrder = 1
                end
                object DTP_Date_End: TUniDateTimePicker
                  AlignWithMargins = True
                  Left = 109
                  Top = 3
                  Width = 100
                  Height = 24
                  Hint = ''
                  DateTime = 42916.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alLeft
                  TabOrder = 2
                end
              end
            end
            object E_Interface: TUniEdit
              AlignWithMargins = True
              Left = 492
              Top = 3
              Width = 136
              Height = 46
              Hint = ''
              Text = 'E_Interface'
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'Tela/Interface'
              FieldLabelAlign = laTop
              ExplicitLeft = 495
            end
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Columns = <
            item
              FieldName = 'log_timestamp'
              Title.Caption = 'Data e Hora'
              Width = 112
            end
            item
              FieldName = 'nick_trade'
              Title.Caption = 'Usu'#225'rios'
              Width = 221
              ReadOnly = True
            end
            item
              FieldName = 'log_interface'
              Title.Caption = 'Tela/Interface'
              Width = 292
            end
            item
              FieldName = 'log_operation'
              Title.Caption = 'Opera'#231#245'es'
              Width = 304
            end
            item
              FieldName = 'log_description'
              Title.Caption = 'Descritivo'
              Width = 304
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    inherited Sb_View: TUniSpeedButton
      Visible = False
    end
    inherited Sb_Register: TUniSpeedButton
      Visible = False
    end
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchtb_user_id: TIntegerField
      FieldName = 'tb_user_id'
      Origin = 'tb_user_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchlog_timestamp: TDateTimeField
      DisplayLabel = 'Data e Hora'
      FieldName = 'log_timestamp'
      Origin = 'log_timestamp'
    end
    object cds_searchlog_interface: TStringField
      DisplayLabel = 'Tela/Interface'
      FieldName = 'log_interface'
      Origin = 'log_interface'
      Size = 50
    end
    object cds_searchlog_operation: TStringField
      DisplayLabel = 'Opera'#231#245'es'
      FieldName = 'log_operation'
      Origin = 'log_operation'
      Size = 50
    end
    object cds_searchlog_description: TStringField
      DisplayLabel = 'Descritivo'
      FieldName = 'log_description'
      Origin = 'log_description'
      Size = 50
    end
    object cds_searchnick_trade: TStringField
      DisplayLabel = 'Usu'#225'rios'
      FieldName = 'nick_trade'
      Origin = 'nick_trade'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 24
    Top = 64
  end
end
