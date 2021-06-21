inherited TasOrderPiJr: TTasOrderPiJr
  ClientHeight = 424
  Caption = 'Tarefa de Inser'#231#227'o Jornal/Revista'
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 360
    ExplicitTop = 360
    inherited SB_Insert: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited Sb_Close: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Height = 360
    ExplicitHeight = 360
    inherited pnl_data: TUniPanel
      Height = 356
      ExplicitHeight = 356
      inherited dbg_dt_insertion: TUniDBGrid
        Height = 268
      end
      inherited UniPanel8: TUniPanel
        inherited E_qt_insertion: TUniEdit
          Alignment = taCenter
        end
        inherited E_nr_repetition: TUniEdit
          Width = 68
          Alignment = taCenter
          ExplicitWidth = 68
        end
      end
    end
    inherited pnl_pecas: TUniPanel
      Height = 356
      ExplicitHeight = 356
      inherited pnl_totalizador: TUniPanel
        Top = 300
        ExplicitTop = 300
        inherited E_TableGross: TUniFormattedNumberEdit
          TabStop = False
          ReadOnly = True
        end
        inherited E_Discount_Value: TUniFormattedNumberEdit
          TabStop = False
          ReadOnly = True
        end
        inherited E_Negotiaded: TUniFormattedNumberEdit
          TabStop = False
          ReadOnly = True
        end
        inherited E_total_value: TUniFormattedNumberEdit
          OnExit = E_total_valueExit
        end
      end
      inherited pnl_detalhe: TUniPanel
        BorderStyle = ubsNone
        inherited E_Ttittle: TUniEdit
          Width = 404
          ExplicitWidth = 404
        end
      end
      inherited pnl_Custom: TUniPanel
        Top = 162
        Height = 138
        ExplicitHeight = 164
        object UniLabel11: TUniLabel
          Left = 227
          Top = 3
          Width = 61
          Height = 13
          Hint = ''
          Caption = '%Impress'#227'o'
          TabOrder = 11
        end
        object E_insertion: TUniEdit
          Left = 344
          Top = 61
          Width = 58
          Hint = ''
          Alignment = taCenter
          Text = ''
          TabOrder = 9
          ReadOnly = True
          OnExit = E_insertionExit
        end
        object UniLabel18: TUniLabel
          Left = 344
          Top = 47
          Width = 47
          Height = 13
          Hint = ''
          Caption = 'Inser'#231#245'es'
          TabOrder = 12
        end
        object E_total_cm_col: TUniEdit
          Left = 268
          Top = 61
          Width = 73
          Hint = ''
          Alignment = taRightJustify
          Text = ''
          TabOrder = 8
          TabStop = False
        end
        object UniLabel17: TUniLabel
          Left = 268
          Top = 46
          Width = 63
          Height = 13
          Hint = ''
          Caption = 'Total CM/COl'
          TabOrder = 13
        end
        object E_nr_height: TUniEdit
          Left = 216
          Top = 61
          Width = 49
          Hint = ''
          Alignment = taCenter
          Text = ''
          TabOrder = 7
          OnExit = E_nr_heightExit
        end
        object UniLabel16: TUniLabel
          Left = 216
          Top = 46
          Width = 29
          Height = 13
          Hint = ''
          Caption = 'Altura'
          TabOrder = 14
        end
        object E_nr_column: TUniEdit
          Left = 164
          Top = 61
          Width = 49
          Hint = ''
          Alignment = taCenter
          Text = ''
          TabOrder = 6
          OnExit = E_nr_columnExit
        end
        object UniLabel15: TUniLabel
          Left = 164
          Top = 46
          Width = 33
          Height = 13
          Hint = ''
          Caption = 'Coluna'
          TabOrder = 15
        end
        object E_unit_value_neg: TUniFormattedNumberEdit
          Left = 71
          Top = 61
          Width = 90
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 5
          TabStop = False
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel14: TUniLabel
          Left = 71
          Top = 46
          Width = 76
          Height = 13
          Hint = ''
          Caption = 'CM/COL Negoc.'
          TabOrder = 16
        end
        object E_Discount_Aliq: TUniFormattedNumberEdit
          Left = 5
          Top = 61
          Width = 63
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 4
          TabStop = False
          DecimalUseOSDefault = True
        end
        object UniLabel13: TUniLabel
          Left = 5
          Top = 46
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Desconto'
          TabOrder = 17
        end
        object E_table_value: TUniFormattedNumberEdit
          Left = 306
          Top = 19
          Width = 96
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 3
          TabStop = False
          DecimalUseOSDefault = True
        end
        object l_table_value: TUniLabel
          Left = 306
          Top = 3
          Width = 74
          Height = 13
          Hint = ''
          Caption = 'Valor da Tabela'
          TabOrder = 18
        end
        object E_Aliq_Print: TUniFormattedNumberEdit
          Left = 227
          Top = 19
          Width = 76
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 2
          TabStop = False
          DecimalUseOSDefault = True
        end
        object Cb_Color: TUniComboBox
          Left = 116
          Top = 19
          Width = 108
          Hint = ''
          Style = csDropDownList
          Text = 'N'#195'O'
          Items.Strings = (
            'SIM'
            'N'#195'O')
          ItemIndex = 1
          TabOrder = 1
          IconItems = <>
          OnChange = Cb_ColorChange
        end
        object UniLabel5: TUniLabel
          Left = 116
          Top = 3
          Width = 92
          Height = 13
          Hint = ''
          Caption = 'Impress'#227'o Colorida'
          TabOrder = 19
        end
        object UniLabel6: TUniLabel
          Left = 5
          Top = 3
          Width = 72
          Height = 13
          Hint = ''
          Caption = 'Selecione o Dia'
          TabOrder = 20
        end
        object Cb_Day: TUniComboBox
          Left = 5
          Top = 19
          Width = 108
          Hint = ''
          Style = csDropDownList
          Text = 'UTIL'
          Items.Strings = (
            'UTIL'
            'DOM')
          ItemIndex = 0
          TabOrder = 0
          IconItems = <>
          OnChange = Cb_DayChange
        end
      end
      inherited Ctn_Med_Material: TUniContainerPanel
        Height = 52
        ExplicitHeight = 52
      end
      inherited Ctn_Med_Pos_Prog: TUniContainerPanel
        Top = 107
        Height = 52
        ExplicitTop = 107
        ExplicitHeight = 52
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    inherited MnuTarefas: TUniMenuItem
      object abeladePreo1: TUniMenuItem
        Caption = 'Tabela de Pre'#231'o'
        OnClick = abeladePreo1Click
      end
    end
  end
end
