inherited TasOrderPiRt: TTasOrderPiRt
  ClientHeight = 344
  Caption = 'Tarefa de Inser'#231#227'o Radio/Tv'#39's'
  Menu = nil
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 280
    ExplicitTop = 280
  end
  inherited pnl_fundo: TUniPanel
    Height = 280
    BorderStyle = ubsNone
    ExplicitHeight = 280
    inherited pnl_data: TUniPanel
      Left = 421
      Top = 0
      Height = 280
      ExplicitLeft = 421
      ExplicitTop = 0
      ExplicitHeight = 280
      inherited dbg_dt_insertion: TUniDBGrid
        Height = 192
      end
    end
    inherited pnl_pecas: TUniPanel
      Left = 0
      Top = 0
      Width = 421
      Height = 280
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 421
      ExplicitHeight = 280
      inherited pnl_totalizador: TUniPanel
        Top = 224
        Width = 421
        ExplicitTop = 224
        ExplicitWidth = 421
        inherited E_total_value: TUniFormattedNumberEdit
          OnExit = E_total_valueExit
        end
      end
      inherited pnl_detalhe: TUniPanel
        Width = 421
        Height = 49
        ExplicitWidth = 421
        ExplicitHeight = 49
      end
      inherited pnl_Custom: TUniPanel
        Top = 139
        Width = 421
        Height = 85
        ExplicitTop = 139
        ExplicitWidth = 421
        ExplicitHeight = 85
        object UniLabel6: TUniLabel
          Left = 6
          Top = 4
          Width = 89
          Height = 13
          Hint = ''
          Caption = 'Selecione o Tempo'
          TabOrder = 1
        end
        object Cb_tm_duration: TUniComboBox
          Left = 6
          Top = 20
          Width = 108
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'SPOT 15'#39
            'SPOT 30'#39
            'SPOT 45'#39
            'SPOT 60'#39)
          TabOrder = 2
          IconItems = <>
          OnChange = Cb_tm_durationChange
        end
        object Cb_testimonial: TUniComboBox
          Left = 117
          Top = 20
          Width = 108
          Hint = ''
          Style = csDropDownList
          Text = 'N'#195'O'
          Items.Strings = (
            'SIM'
            'N'#195'O')
          ItemIndex = 1
          TabOrder = 3
          IconItems = <>
          OnChange = Cb_testimonialChange
        end
        object UniLabel5: TUniLabel
          Left = 117
          Top = 4
          Width = 61
          Height = 13
          Hint = ''
          Caption = 'Testemunhal'
          TabOrder = 4
        end
        object UniLabel11: TUniLabel
          Left = 228
          Top = 4
          Width = 66
          Height = 13
          Hint = ''
          Caption = '%Testmunhal'
          TabOrder = 5
        end
        object E_increase_testemonial: TUniFormattedNumberEdit
          Left = 228
          Top = 20
          Width = 81
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 6
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object E_table_value: TUniFormattedNumberEdit
          Left = 312
          Top = 20
          Width = 98
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 7
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object l_table_value: TUniLabel
          Left = 312
          Top = 4
          Width = 74
          Height = 13
          Hint = ''
          Caption = 'Valor da Tabela'
          TabOrder = 8
        end
        object UniLabel13: TUniLabel
          Left = 6
          Top = 46
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Desconto'
          TabOrder = 9
        end
        object E_Discount_Aliq: TUniFormattedNumberEdit
          Left = 5
          Top = 61
          Width = 63
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 10
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel14: TUniLabel
          Left = 73
          Top = 46
          Width = 65
          Height = 13
          Hint = ''
          Caption = 'Vl.Unit.Negoc'
          TabOrder = 11
        end
        object E_unit_value_neg: TUniFormattedNumberEdit
          Left = 71
          Top = 61
          Width = 85
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 12
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel18: TUniLabel
          Left = 162
          Top = 46
          Width = 47
          Height = 13
          Hint = ''
          Caption = 'Inser'#231#245'es'
          TabOrder = 13
        end
        object E_insertion: TUniEdit
          Left = 158
          Top = 61
          Width = 68
          Hint = ''
          Alignment = taCenter
          Text = ''
          TabOrder = 14
          ReadOnly = True
          OnExit = E_insertionExit
        end
      end
      inherited Ctn_Med_Material: TUniContainerPanel
        Top = 52
        Width = 415
        ExplicitTop = 52
        ExplicitWidth = 415
      end
      inherited Ctn_Med_Pos_Prog: TUniContainerPanel
        Top = 97
        Width = 415
        ExplicitTop = 97
        ExplicitWidth = 415
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
