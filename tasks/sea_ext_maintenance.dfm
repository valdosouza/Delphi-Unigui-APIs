inherited SeaExtMaintenance: TSeaExtMaintenance
  ClientHeight = 519
  ClientWidth = 773
  Caption = 'SeaExtMaintenance'
  ExplicitWidth = 789
  ExplicitHeight = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 773
    Height = 455
    ExplicitWidth = 773
    ExplicitHeight = 455
    inherited pc_search: TUniPageControl
      Width = 769
      Height = 451
      ExplicitWidth = 769
      ExplicitHeight = 451
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 761
        ExplicitHeight = 423
        inherited pnl_param: TUniPanel
          Width = 761
          Height = 423
          ExplicitWidth = 761
          ExplicitHeight = 423
          object UniRadioGroup1: TUniRadioGroup
            Left = 3
            Top = 14
            Width = 193
            Height = 40
            Hint = ''
            Items.Strings = (
              'Abertura'
              'Encerramento')
            Caption = 'Tipo de Data'
            TabOrder = 1
            Columns = 2
          end
          object ChBx_Periodo: TUniCheckBox
            Left = 202
            Top = 13
            Width = 145
            Height = 21
            Hint = ''
            Checked = True
            Caption = 'Periodo data de cadastro'
            TabOrder = 2
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 201
            Top = 32
            Width = 97
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 3
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 300
            Top = 32
            Width = 98
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 4
          end
          object UniEdit1: TUniEdit
            Left = 402
            Top = 32
            Width = 64
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object UniLabel1: TUniLabel
            Left = 402
            Top = 17
            Width = 59
            Height = 13
            Hint = ''
            Caption = 'C'#243'd. Cliente'
            TabOrder = 6
          end
          object Ctn_Entity: TUniContainerPanel
            Left = 472
            Top = 18
            Width = 281
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 7
          end
          object UniRadioGroup2: TUniRadioGroup
            Left = 3
            Top = 54
            Width = 242
            Height = 40
            Hint = ''
            Items.Strings = (
              'Aberta'
              'Encerradas'
              'Todas')
            Caption = 'Situa'#231#227'o do Documento'
            TabOrder = 8
            Columns = 3
          end
          object UniLabel2: TUniLabel
            Left = 251
            Top = 58
            Width = 32
            Height = 13
            Hint = ''
            Caption = 'Pedido'
            TabOrder = 9
          end
          object UniEdit2: TUniEdit
            Left = 251
            Top = 72
            Width = 94
            Hint = ''
            Text = ''
            TabOrder = 10
          end
          object UniEdit3: TUniEdit
            Left = 545
            Top = 72
            Width = 110
            Hint = ''
            Text = 'UniEdit3'
            TabOrder = 11
          end
          object UniLabel3: TUniLabel
            Left = 545
            Top = 58
            Width = 59
            Height = 13
            Hint = ''
            Caption = 'Manuten'#231#227'o'
            TabOrder = 12
          end
          object UniLabel4: TUniLabel
            Left = 446
            Top = 58
            Width = 44
            Height = 13
            Hint = ''
            Caption = 'Inspe'#231#227'o'
            TabOrder = 13
          end
          object UniEdit4: TUniEdit
            Left = 446
            Top = 72
            Width = 97
            Hint = ''
            Text = 'UniEdit4'
            TabOrder = 14
          end
          object UniLabel5: TUniLabel
            Left = 354
            Top = 58
            Width = 85
            Height = 13
            Hint = ''
            Caption = 'Ordem de Servi'#231'o'
            TabOrder = 15
          end
          object UniEdit5: TUniEdit
            Left = 354
            Top = 72
            Width = 90
            Hint = ''
            Text = 'UniEdit5'
            TabOrder = 16
          end
          object UniLabel6: TUniLabel
            Left = 658
            Top = 58
            Width = 31
            Height = 13
            Hint = ''
            Caption = 'Ensaio'
            TabOrder = 17
          end
          object UniEdit6: TUniEdit
            Left = 658
            Top = 72
            Width = 95
            Hint = ''
            Text = 'UniEdit6'
            TabOrder = 18
          end
          object UniLabel7: TUniLabel
            Left = 3
            Top = 95
            Width = 65
            Height = 13
            Hint = ''
            Caption = 'S'#233'rie Extintor'
            TabOrder = 19
          end
          object UniEdit7: TUniEdit
            Left = 3
            Top = 109
            Width = 102
            Hint = ''
            Text = ''
            TabOrder = 20
          end
          object UniLabel8: TUniLabel
            Left = 117
            Top = 95
            Width = 81
            Height = 13
            Hint = ''
            Caption = 'Tipo de Relat'#243'rio'
            TabOrder = 21
          end
          object UniComboBox1: TUniComboBox
            Left = 115
            Top = 109
            Width = 238
            Hint = ''
            Text = 'UniComboBox1'
            TabOrder = 22
            ForceSelection = False
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 761
        ExplicitHeight = 423
        inherited dbg_Search: TUniDBGrid
          Width = 761
          Height = 423
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 455
    Width = 773
    ExplicitTop = 455
    ExplicitWidth = 773
  end
end
