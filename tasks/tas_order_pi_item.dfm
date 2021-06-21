inherited TasOrderPiItem: TTasOrderPiItem
  ClientHeight = 431
  ClientWidth = 671
  Caption = 'TasOrderPiItem'
  ExplicitWidth = 687
  ExplicitHeight = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 367
    Width = 671
    TabOrder = 1
    ExplicitTop = 367
    ExplicitWidth = 671
    inherited SB_Insert: TUniSpeedButton
      Left = 382
      Visible = False
      ExplicitLeft = 382
    end
    inherited SB_Change: TUniSpeedButton
      Left = 473
      Visible = False
      ExplicitLeft = 473
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 191
      Visible = False
      ExplicitLeft = 191
    end
    inherited SB_Save: TUniSpeedButton
      Left = 5
      Margins.Left = 3
      ExplicitLeft = 5
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 98
      ExplicitLeft = 98
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 284
      Visible = False
      ExplicitLeft = 284
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 671
    Height = 367
    TabOrder = 0
    ExplicitWidth = 671
    ExplicitHeight = 367
    object pnl_data: TUniPanel
      Left = 419
      Top = 2
      Width = 250
      Height = 363
      Hint = ''
      Align = alRight
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = ''
      object dbg_dt_insertion: TUniDBGrid
        Left = 2
        Top = 86
        Width = 246
        Height = 275
        Hint = ''
        DataSource = ds_data_ins_local
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 1
        TabKeyBehavior = tkNextComponent
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'id'
            Width = 64
            Visible = False
          end
          item
            FieldName = 'tb_med_parts_id'
            Title.Caption = 'tb_med_parts_id'
            Width = 85
            Visible = False
          end
          item
            FieldName = 'dt_insertion'
            Title.Caption = 'Data'
            Width = 70
          end
          item
            FieldName = 'week_day'
            Title.Caption = 'Semana'
            Width = 73
          end
          item
            FieldName = 'qt_insertion'
            Title.Caption = 'Insers'#227'o'
            Width = 65
          end>
      end
      object UniPanel8: TUniPanel
        Left = 2
        Top = 2
        Width = 246
        Height = 53
        Hint = ''
        Align = alTop
        TabOrder = 2
        BorderStyle = ubsFrameLowered
        Caption = ''
        object UniLabel12: TUniLabel
          Left = 4
          Top = 8
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Data'
          TabOrder = 1
        end
        object Dt_dt_insertion: TUniDateTimePicker
          Left = 4
          Top = 23
          Width = 98
          Hint = ''
          DateTime = 42935.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
        object UniLabel19: TUniLabel
          Left = 108
          Top = 8
          Width = 42
          Height = 13
          Hint = ''
          Caption = 'Insers'#227'o'
          TabOrder = 3
        end
        object E_qt_insertion: TUniEdit
          Left = 107
          Top = 23
          Width = 63
          Hint = ''
          Text = ''
          TabOrder = 4
        end
        object UniLabel20: TUniLabel
          Left = 178
          Top = 8
          Width = 48
          Height = 13
          Hint = ''
          Caption = 'Repeti'#231#227'o'
          TabOrder = 5
        end
        object E_nr_repetition: TUniEdit
          Left = 172
          Top = 23
          Width = 67
          Hint = ''
          Text = ''
          TabOrder = 6
        end
      end
      object pnl_botao_data: TUniPanel
        Left = 2
        Top = 55
        Width = 246
        Height = 31
        Hint = ''
        Align = alTop
        TabOrder = 3
        BorderStyle = ubsNone
        Caption = ''
        object Sb_exc_data: TUniSpeedButton
          Left = 114
          Top = 0
          Width = 132
          Height = 31
          Hint = ''
          Caption = 'Excluir Data'
          Align = alClient
          ParentColor = False
          Color = clWindow
          TabOrder = 1
          OnClick = Ub_DeleteDateClick
        end
        object Sb_ins_data: TUniSpeedButton
          Left = 0
          Top = 0
          Width = 114
          Height = 31
          Hint = ''
          Caption = 'Inserir Data'
          Align = alLeft
          ParentColor = False
          Color = clWindow
          TabOrder = 2
          OnClick = Ub_InsertDateClick
        end
      end
    end
    object pnl_pecas: TUniPanel
      Left = 2
      Top = 2
      Width = 417
      Height = 363
      Hint = ''
      Align = alClient
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = 'UniPanel1'
      object pnl_totalizador: TUniPanel
        Left = 0
        Top = 307
        Width = 417
        Height = 56
        Hint = ''
        Align = alBottom
        TabOrder = 1
        BorderStyle = ubsFrameLowered
        Caption = ''
        object E_TableGross: TUniFormattedNumberEdit
          Left = 10
          Top = 25
          Width = 96
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 1
          DecimalUseOSDefault = True
        end
        object E_Discount_Value: TUniFormattedNumberEdit
          Left = 208
          Top = 25
          Width = 100
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 4
          DecimalUseOSDefault = True
        end
        object E_Negotiaded: TUniFormattedNumberEdit
          Left = 109
          Top = 25
          Width = 96
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 2
          DecimalUseOSDefault = True
        end
        object E_total_value: TUniFormattedNumberEdit
          Left = 311
          Top = 25
          Width = 96
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 6
          DecimalUseOSDefault = True
        end
        object UniLabel7: TUniLabel
          Left = 10
          Top = 9
          Width = 61
          Height = 13
          Hint = ''
          Caption = 'Tabela Bruto'
          TabOrder = 3
        end
        object UniLabel8: TUniLabel
          Left = 109
          Top = 9
          Width = 77
          Height = 13
          Hint = ''
          Caption = 'Valor Negociado'
          TabOrder = 5
        end
        object UniLabel9: TUniLabel
          Left = 208
          Top = 9
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Desconto'
          TabOrder = 7
        end
        object UniLabel10: TUniLabel
          Left = 311
          Top = 9
          Width = 51
          Height = 13
          Hint = ''
          Caption = 'Valor Total'
          TabOrder = 8
        end
      end
      object pnl_detalhe: TUniPanel
        Left = 0
        Top = 0
        Width = 417
        Height = 46
        Hint = ''
        Align = alTop
        TabOrder = 2
        BorderStyle = ubsFrameLowered
        Caption = ''
        object E_Ttittle: TUniEdit
          Left = 4
          Top = 19
          Width = 405
          Hint = ''
          Text = ''
          TabOrder = 0
        end
        object UniLabel4: TUniLabel
          Left = 4
          Top = 4
          Width = 26
          Height = 13
          Hint = ''
          Caption = 'T'#237'tulo'
          TabOrder = 2
        end
      end
      object pnl_Custom: TUniPanel
        Left = 0
        Top = 136
        Width = 417
        Height = 171
        Hint = ''
        Align = alClient
        TabOrder = 3
        BorderStyle = ubsFrameLowered
        Caption = ''
      end
      object Ctn_Med_Material: TUniContainerPanel
        AlignWithMargins = True
        Left = 3
        Top = 49
        Width = 411
        Height = 39
        Hint = ''
        RTL = True
        ParentRTL = False
        ParentColor = False
        Align = alTop
        TabOrder = 4
      end
      object Ctn_Med_Pos_Prog: TUniContainerPanel
        AlignWithMargins = True
        Left = 3
        Top = 94
        Width = 411
        Height = 39
        Hint = ''
        RTL = True
        ParentRTL = False
        ParentColor = False
        Align = alTop
        TabOrder = 5
      end
    end
  end
  object cds_data_ins_local: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 170
    object cds_data_ins_localid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_data_ins_localtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
    end
    object cds_data_ins_localtb_med_parts_id: TIntegerField
      FieldName = 'tb_med_parts_id'
      Origin = 'tb_med_parts_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_data_ins_localdt_insertion: TDateField
      FieldName = 'dt_insertion'
      Origin = 'dt_insertion'
    end
    object cds_data_ins_localweek_day: TStringField
      FieldName = 'week_day'
      Origin = 'week_day'
    end
    object cds_data_ins_localqt_insertion: TIntegerField
      FieldName = 'qt_insertion'
      Origin = 'qt_insertion'
    end
    object cds_data_ins_localtb_order_id: TIntegerField
      FieldName = 'tb_order_id'
    end
  end
  object ds_data_ins_local: TDataSource
    DataSet = cds_data_ins_local
    Left = 480
    Top = 226
  end
end
