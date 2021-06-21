inherited SeaOrder: TSeaOrder
  ClientHeight = 415
  ClientWidth = 379
  Caption = 'SeaOrder'
  ExplicitWidth = 395
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 379
    Height = 351
    ExplicitWidth = 379
    ExplicitHeight = 351
    inherited pc_search: TUniPageControl
      Width = 375
      Height = 347
      ExplicitWidth = 375
      ExplicitHeight = 347
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 367
        ExplicitHeight = 319
        inherited pnl_param: TUniPanel
          Width = 367
          Height = 319
          ExplicitWidth = 367
          ExplicitHeight = 319
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 6
            Top = 23
            Width = 120
            Hint = ''
            DateTime = 42916.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 1
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 133
            Top = 23
            Width = 120
            Hint = ''
            DateTime = 42916.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object chbx_periodo: TUniCheckBox
            Left = 7
            Top = 3
            Width = 246
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Data Inicial                   Data Final'
            TabOrder = 3
            OnClick = chbx_periodoClick
          end
          object M_Note: TUniMemo
            Left = -3
            Top = 50
            Width = 370
            Height = 89
            Hint = ''
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 367
        ExplicitHeight = 319
        inherited dbg_Search: TUniDBGrid
          Width = 367
          Height = 319
          Columns = <
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data'
              Width = 88
            end
            item
              FieldName = 'note'
              Title.Caption = 'Observa'#231#227'o'
              Width = 308
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 351
    Width = 379
    ExplicitTop = 351
    ExplicitWidth = 379
  end
  inherited ds_search: TDataSource
    Left = 216
    Top = 274
  end
  inherited cds_search: TClientDataSet
    Left = 224
    Top = 210
    object cds_searchdt_record: TDateField
      DisplayWidth = 14
      FieldName = 'dt_record'
      Origin = 'dt_record'
    end
    object cds_searchnote: TBlobField
      DisplayWidth = 45
      FieldName = 'note'
      Origin = 'note'
    end
    object cds_searchid: TAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  inherited DSP: TDataSetProvider
    Left = 232
    Top = 152
  end
end
