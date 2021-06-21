inherited SeaFinancialStatement: TSeaFinancialStatement
  ClientHeight = 522
  ClientWidth = 882
  Caption = 'Ficha Financeira'
  ExplicitWidth = 898
  ExplicitHeight = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 882
    Height = 458
    ExplicitWidth = 882
    ExplicitHeight = 458
    inherited pc_search: TUniPageControl
      Width = 878
      Height = 356
      ExplicitWidth = 878
      ExplicitHeight = 356
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 870
        ExplicitHeight = 328
        inherited pnl_param: TUniPanel
          Width = 870
          Height = 328
          ExplicitWidth = 870
          ExplicitHeight = 328
          object ChBx_Periodo: TUniCheckBox
            Left = 4
            Top = 3
            Width = 145
            Height = 13
            Hint = ''
            Checked = True
            Caption = 'Periodo data de cadastro'
            TabOrder = 1
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 4
            Top = 18
            Width = 77
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 83
            Top = 18
            Width = 77
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 3
          end
          object UniLabel1: TUniLabel
            Left = 162
            Top = 3
            Width = 63
            Height = 13
            Hint = ''
            Caption = 'C'#243'd Empresa'
            TabOrder = 4
          end
          object UniEdit1: TUniEdit
            Left = 162
            Top = 18
            Width = 112
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object Ctn_Entity: TUniContainerPanel
            Left = 270
            Top = 7
            Width = 600
            Height = 38
            Hint = ''
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
          end
          object UniRadioGroup1: TUniRadioGroup
            Left = 4
            Top = 46
            Width = 275
            Height = 45
            Hint = ''
            Items.Strings = (
              'A Vencer'
              'Vencidas'
              'Pagas '
              'Todas')
            Caption = 'Situa'#231#227'o'
            TabOrder = 7
            Columns = 4
          end
          object UniRadioGroup2: TUniRadioGroup
            Left = 281
            Top = 46
            Width = 193
            Height = 46
            Hint = ''
            Items.Strings = (
              'Vencimento'
              'Pagamento')
            Caption = 'Tipo de Data'
            TabOrder = 8
            Columns = 2
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 870
        ExplicitHeight = 328
        inherited dbg_Search: TUniDBGrid
          Width = 870
          Height = 212
          Align = alTop
        end
      end
    end
    object UniPanel1: TUniPanel
      Left = 2
      Top = 358
      Width = 878
      Height = 98
      Hint = ''
      Align = alBottom
      TabOrder = 2
      BorderStyle = ubsFrameLowered
      Caption = ''
      DesignSize = (
        878
        98)
      object UniLabel2: TUniLabel
        Left = 4
        Top = 7
        Width = 80
        Height = 13
        Hint = ''
        Caption = 'Limite de Cr'#233'dito'
        TabOrder = 1
      end
      object UniLabel3: TUniLabel
        Left = 4
        Top = 24
        Width = 81
        Height = 13
        Hint = ''
        Caption = 'Compras a Prazo'
        TabOrder = 2
      end
      object UniLabel4: TUniLabel
        Left = 4
        Top = 42
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Pagas'
        TabOrder = 3
      end
      object UniLabel5: TUniLabel
        Left = 4
        Top = 59
        Width = 104
        Height = 13
        Hint = ''
        Caption = 'Cheques Pr'#233' Datados'
        TabOrder = 4
      end
      object UniLabel6: TUniLabel
        Left = 4
        Top = 77
        Width = 97
        Height = 13
        Hint = ''
        Caption = 'Cheques Devolvidos'
        TabOrder = 5
      end
      object UniLabel7: TUniLabel
        Left = 135
        Top = 7
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        TabOrder = 6
      end
      object UniLabel8: TUniLabel
        Left = 135
        Top = 24
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        TabOrder = 7
      end
      object UniLabel9: TUniLabel
        Left = 135
        Top = 42
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        TabOrder = 8
      end
      object UniLabel10: TUniLabel
        Left = 135
        Top = 59
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        TabOrder = 9
      end
      object UniLabel11: TUniLabel
        Left = 135
        Top = 77
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        TabOrder = 10
      end
      object UniLabel12: TUniLabel
        Left = 355
        Top = 3
        Width = 43
        Height = 13
        Hint = ''
        Caption = 'A Vencer'
        TabOrder = 11
      end
      object UniLabel13: TUniLabel
        Left = 355
        Top = 20
        Width = 42
        Height = 13
        Hint = ''
        Caption = 'Vencidas'
        TabOrder = 12
      end
      object UniLabel14: TUniLabel
        Left = 355
        Top = 38
        Width = 70
        Height = 13
        Hint = ''
        Caption = 'Saldo Devedor'
        TabOrder = 13
      end
      object UniLabel15: TUniLabel
        Left = 355
        Top = 55
        Width = 62
        Height = 13
        Hint = ''
        Caption = 'Saldo Credor'
        TabOrder = 14
      end
      object UniLabel16: TUniLabel
        Left = 355
        Top = 74
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Saldo Total'
        TabOrder = 15
      end
      object UniLabel17: TUniLabel
        Left = 441
        Top = 3
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        TabOrder = 16
      end
      object UniLabel18: TUniLabel
        Left = 441
        Top = 20
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        TabOrder = 17
      end
      object UniLabel19: TUniLabel
        Left = 441
        Top = 38
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        TabOrder = 18
      end
      object UniLabel20: TUniLabel
        Left = 441
        Top = 55
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        TabOrder = 19
      end
      object UniLabel21: TUniLabel
        Left = 441
        Top = 73
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        TabOrder = 20
      end
      object UniLabel22: TUniLabel
        Left = 676
        Top = 2
        Width = 69
        Height = 13
        Hint = ''
        Caption = #218'ltima Compra'
        Anchors = [akTop, akRight]
        TabOrder = 21
      end
      object UniLabel23: TUniLabel
        Left = 676
        Top = 19
        Width = 66
        Height = 13
        Hint = ''
        Caption = 'Maior Compra'
        Anchors = [akTop, akRight]
        TabOrder = 22
      end
      object UniLabel24: TUniLabel
        Left = 676
        Top = 37
        Width = 63
        Height = 13
        Hint = ''
        Caption = 'M'#233'dia Atraso'
        Anchors = [akTop, akRight]
        TabOrder = 23
      end
      object UniLabel25: TUniLabel
        Left = 676
        Top = 54
        Width = 85
        Height = 13
        Hint = ''
        Caption = 'Data de Cadastro'
        Anchors = [akTop, akRight]
        TabOrder = 24
      end
      object UniLabel26: TUniLabel
        Left = 791
        Top = 2
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        Anchors = [akTop, akRight]
        TabOrder = 25
      end
      object UniLabel27: TUniLabel
        Left = 791
        Top = 37
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        Anchors = [akTop, akRight]
        TabOrder = 26
      end
      object UniLabel28: TUniLabel
        Left = 791
        Top = 19
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        Anchors = [akTop, akRight]
        TabOrder = 27
      end
      object UniLabel29: TUniLabel
        Left = 791
        Top = 54
        Width = 80
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '09/06/2000'
        Anchors = [akTop, akRight]
        TabOrder = 28
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 458
    Width = 882
    ExplicitTop = 458
    ExplicitWidth = 882
    inherited Sb_Close: TUniSpeedButton
      Left = 186
      ExplicitLeft = 186
    end
    inherited Sb_View: TUniSpeedButton
      Left = 94
      ExplicitLeft = 94
    end
    inherited Sb_Search: TUniSpeedButton
      Left = 2
      ExplicitLeft = 2
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 281
      Visible = False
      ExplicitLeft = 281
    end
  end
end
