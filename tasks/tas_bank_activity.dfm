inherited TasBankActivity: TTasBankActivity
  ClientHeight = 491
  ClientWidth = 812
  Caption = 'Contas Corrente'
  ExplicitWidth = 828
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 812
    Height = 427
    ExplicitTop = -1
    ExplicitWidth = 769
    ExplicitHeight = 280
    inherited pc_search: TUniPageControl
      Width = 808
      Height = 423
      ExplicitLeft = 1
      ExplicitTop = 3
      ExplicitWidth = 808
      ExplicitHeight = 423
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 894
        ExplicitHeight = 179
        inherited pnl_param: TUniPanel
          Width = 800
          Height = 364
          ExplicitTop = -2
          ExplicitWidth = 757
          ExplicitHeight = 364
          object pnl_param_row_1: TUniPanel
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 790
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            ExplicitLeft = 3
            ExplicitTop = 3
            ExplicitWidth = 747
            object UniComboBox1: TUniComboBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 103
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'Ordena'#231#227'o'
              FieldLabelAlign = laTop
              IconItems = <>
              ExplicitLeft = -2
              ExplicitTop = 30
              ExplicitHeight = 22
            end
            object Ctn_Bank_Account: TUniContainerPanel
              Left = 109
              Top = 0
              Width = 483
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alClient
              TabOrder = 2
              ExplicitLeft = 106
              ExplicitWidth = 459
            end
            object UniPanel2: TUniPanel
              Left = 683
              Top = 0
              Width = 107
              Height = 52
              Hint = ''
              Align = alRight
              TabOrder = 3
              BorderStyle = ubsNone
              Caption = ''
              ExplicitLeft = 640
              object UniCheckBox3: TUniCheckBox
                AlignWithMargins = True
                Left = 3
                Top = 5
                Width = 101
                Height = 17
                Hint = ''
                Margins.Top = 5
                Margins.Bottom = 0
                Checked = True
                Caption = 'Data Original'
                Align = alTop
                TabOrder = 1
                ExplicitWidth = 210
              end
              object UniDateTimePicker1: TUniDateTimePicker
                AlignWithMargins = True
                Left = 3
                Top = 25
                Width = 100
                Height = 24
                Hint = ''
                DateTime = 42916.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Align = alLeft
                TabOrder = 2
                ExplicitTop = 3
              end
            end
            object UniEdit1: TUniEdit
              AlignWithMargins = True
              Left = 595
              Top = 3
              Width = 85
              Height = 46
              Hint = ''
              Text = ''
              Align = alRight
              TabOrder = 4
              FieldLabel = 'N'#250'mero Doc'
              FieldLabelAlign = laTop
              ExplicitLeft = 552
              ExplicitTop = 0
              ExplicitHeight = 52
            end
          end
          object pnl_param_row_3: TUniPanel
            Left = 2
            Top = 112
            Width = 796
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            ExplicitTop = 234
            ExplicitWidth = 753
            object Ctn_Payment_Type: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 342
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alClient
              TabOrder = 1
              ExplicitWidth = 299
            end
            object UniRadioGroup1: TUniRadioGroup
              Left = 342
              Top = 0
              Width = 246
              Height = 52
              Hint = ''
              Items.Strings = (
                'Conferidos'
                'Pendentes'
                'Todos')
              Align = alRight
              Caption = 'Concilia'#231#227'o'
              TabOrder = 2
              Columns = 3
              ExplicitLeft = 293
            end
            object UniRadioGroup2: TUniRadioGroup
              Left = 588
              Top = 0
              Width = 208
              Height = 52
              Hint = ''
              Items.Strings = (
                'Autom'#225'tico'
                'Manual'
                'Todos')
              Align = alRight
              Caption = 'Tipo de Lan'#231'amento'
              TabOrder = 3
              Columns = 3
              ExplicitLeft = 507
              ExplicitTop = 9
              ExplicitWidth = 246
              ExplicitHeight = 43
            end
          end
          object pnl_param_row_2: TUniPanel
            Left = 2
            Top = 60
            Width = 796
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 3
            BorderStyle = ubsNone
            Caption = ''
            ExplicitLeft = 3
            ExplicitTop = 256
            ExplicitWidth = 753
            object pnl_data: TUniPanel
              Left = 0
              Top = 0
              Width = 216
              Height = 52
              Hint = ''
              Align = alLeft
              TabOrder = 1
              BorderStyle = ubsNone
              Caption = ''
              ExplicitLeft = 8
              object ChBx_Periodo: TUniCheckBox
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
            object UniEdit2: TUniEdit
              AlignWithMargins = True
              Left = 219
              Top = 3
              Width = 200
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Hist'#243'rico Banc'#225'rio'
              FieldLabelAlign = laTop
              ExplicitLeft = 271
              ExplicitTop = 29
            end
            object UniEdit3: TUniEdit
              AlignWithMargins = True
              Left = 425
              Top = 3
              Width = 273
              Height = 46
              Hint = ''
              Text = ''
              Align = alClient
              TabOrder = 3
              FieldLabel = 'Hist'#243'rico'
              FieldLabelAlign = laTop
              ExplicitLeft = 416
              ExplicitTop = 0
              ExplicitWidth = 242
              ExplicitHeight = 52
            end
            object UniEdit4: TUniEdit
              AlignWithMargins = True
              Left = 704
              Top = 3
              Width = 89
              Height = 46
              Hint = ''
              Text = ''
              Align = alRight
              TabOrder = 4
              FieldLabel = 'Valor'
              FieldLabelAlign = laTop
              ExplicitLeft = 661
            end
          end
        end
        inherited pnl_config: TUniPanel
          Top = 364
          Width = 800
          ExplicitTop = 147
          ExplicitWidth = 894
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 894
        ExplicitHeight = 179
        inherited dbg_Search: TUniDBGrid
          Width = 800
          Height = 312
        end
        object pnl_search_row_1: TUniPanel
          Left = 0
          Top = 312
          Width = 800
          Height = 83
          Hint = ''
          Align = alBottom
          TabOrder = 1
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniGroupBox2: TUniGroupBox
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 388
            Height = 69
            Hint = ''
            Margins.Bottom = 7
            Caption = 'Totalizador Saldo Atual'
            Align = alLeft
            TabOrder = 1
            ExplicitTop = 6
            object E_VL_Saldo: TUniEdit
              AlignWithMargins = True
              Left = 259
              Top = 15
              Width = 121
              Height = 45
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 7
              Alignment = taRightJustify
              Text = '0,00'
              Align = alLeft
              TabOrder = 1
              ReadOnly = True
              FieldLabel = 'Saldo '
              FieldLabelAlign = laTop
              ExplicitTop = 17
              ExplicitHeight = 43
            end
            object E_VL_Debito: TUniEdit
              AlignWithMargins = True
              Left = 132
              Top = 15
              Width = 121
              Height = 45
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 7
              Alignment = taRightJustify
              Text = '0,00'
              Align = alLeft
              TabOrder = 2
              ReadOnly = True
              FieldLabel = 'Total D'#233'bitos'
              FieldLabelAlign = laTop
              ExplicitTop = 17
              ExplicitHeight = 43
            end
            object E_VL_Credito: TUniEdit
              AlignWithMargins = True
              Left = 5
              Top = 15
              Width = 121
              Height = 45
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 7
              Alignment = taRightJustify
              Text = '0,00'
              Align = alLeft
              TabOrder = 3
              ReadOnly = True
              FieldLabel = 'Total Cr'#233'ditos'
              FieldLabelAlign = laTop
              ExplicitTop = 17
            end
          end
          object UniGroupBox3: TUniGroupBox
            AlignWithMargins = True
            Left = 399
            Top = 5
            Width = 396
            Height = 69
            Hint = ''
            Margins.Bottom = 7
            Caption = 'Totalizador Saldo Futuro'
            Align = alLeft
            TabOrder = 2
            ExplicitTop = 6
            ExplicitHeight = 73
            object E_VL_Fut_Debito: TUniEdit
              AlignWithMargins = True
              Left = 132
              Top = 15
              Width = 121
              Height = 45
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 7
              Alignment = taRightJustify
              Text = '0,00'
              Align = alLeft
              TabOrder = 1
              ReadOnly = True
              FieldLabel = 'Total D'#233'bitos'
              FieldLabelAlign = laTop
              ExplicitTop = 20
              ExplicitHeight = 40
            end
            object E_VL_Fut_Saldo: TUniEdit
              AlignWithMargins = True
              Left = 259
              Top = 15
              Width = 121
              Height = 45
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 7
              Alignment = taRightJustify
              Text = '0,00'
              Align = alLeft
              TabOrder = 2
              ReadOnly = True
              FieldLabel = 'Saldo'
              FieldLabelAlign = laTop
              ExplicitLeft = 131
              ExplicitTop = 17
              ExplicitHeight = 46
            end
            object E_VL_Fut_Credito: TUniEdit
              AlignWithMargins = True
              Left = 5
              Top = 15
              Width = 121
              Height = 45
              Hint = ''
              Margins.Top = 0
              Margins.Bottom = 7
              Alignment = taRightJustify
              Text = '0,00'
              Align = alLeft
              TabOrder = 3
              ReadOnly = True
              FieldLabel = 'Total Cr'#233'ditos'
              FieldLabelAlign = laTop
              ExplicitTop = 20
              ExplicitHeight = 40
            end
          end
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 427
    Width = 812
    ExplicitTop = 520
    ExplicitWidth = 769
  end
  inherited ds_search: TDataSource
    Left = 72
    Top = 202
  end
  inherited cds_search: TClientDataSet
    Left = 160
    Top = 186
  end
  inherited DSP: TDataSetProvider
    Top = 128
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 216
  end
end
