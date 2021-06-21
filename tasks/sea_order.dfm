inherited SeaOrder: TSeaOrder
  ClientHeight = 415
  ClientWidth = 611
  Caption = 'SeaOrder'
  ExplicitWidth = 627
  ExplicitHeight = 454
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Top = 145
    Width = 611
    Height = 197
    ExplicitTop = 145
    ExplicitWidth = 611
    ExplicitHeight = 197
    inherited dbg_Search: TUniDBGrid
      Width = 607
      Height = 193
      Columns = <
        item
          FieldName = 'dt_record'
          Title.Caption = 'Data'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'note'
          Title.Caption = 'Observa'#231#227'o'
          Width = 289
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  inherited Pnl_Parametros: TUniPanel
    Width = 611
    Height = 145
    ExplicitWidth = 611
    ExplicitHeight = 145
    object DTP_Date_Initial: TUniDateTimePicker
      Left = 2
      Top = 23
      Width = 120
      Hint = ''
      DateTime = 42916.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object DTP_Date_End: TUniDateTimePicker
      Left = 129
      Top = 23
      Width = 120
      Hint = ''
      DateTime = 42916.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
    end
    object chbx_periodo: TUniCheckBox
      Left = 3
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
      Left = 2
      Top = 50
      Width = 371
      Height = 89
      Hint = ''
      TabOrder = 4
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 342
    Width = 611
    ExplicitTop = 342
    ExplicitWidth = 611
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
