inherited SeaOrderBudgAdvertise: TSeaOrderBudgAdvertise
  Caption = 'Pesquisa de Or'#231'amento ON-Line de M'#237'dia'
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
          object pnl_param_row_4_1: TUniPanel
            Left = 2
            Top = 2
            Width = 818
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object pnl_data: TUniPanel
              Left = 0
              Top = 0
              Width = 216
              Height = 52
              Hint = ''
              Align = alLeft
              TabOrder = 3
              BorderStyle = ubsNone
              Caption = ''
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
            object E_Number: TUniEdit
              AlignWithMargins = True
              Left = 219
              Top = 3
              Width = 126
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'N'#250'mero'
              FieldLabelAlign = laTop
            end
            object E_Email: TUniEdit
              AlignWithMargins = True
              Left = 351
              Top = 3
              Width = 282
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'e-mail'
              FieldLabelAlign = laTop
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
              FieldName = 'dt_record'
              Title.Caption = 'Data'
              Width = 95
            end
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 106
            end
            item
              FieldName = 'email'
              Title.Caption = 'e-mail'
              Width = 472
            end>
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 232
    Top = 105
  end
  inherited ds_msg: TDataSource
    Left = 296
    Top = 104
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
    object cds_searchdt_record: TDateField
      FieldName = 'dt_record'
      Origin = 'dt_record'
    end
    object cds_searchnumber: TIntegerField
      FieldName = 'number'
      Origin = '`number`'
    end
    object cds_searchemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 48
    Top = 65528
  end
end
