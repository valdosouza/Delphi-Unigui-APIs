inherited TasTechnicalAssistance: TTasTechnicalAssistance
  ClientHeight = 354
  ClientWidth = 710
  Caption = 'Acompanhamento de Assist'#234'ncia T'#233'cnica'
  ExplicitWidth = 726
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 290
    Width = 710
    ExplicitTop = 290
    ExplicitWidth = 710
  end
  inherited pnl_fundo: TUniPanel
    Width = 710
    Height = 290
    ExplicitWidth = 710
    ExplicitHeight = 290
    object UniPanel1: TUniPanel
      Left = 2
      Top = 2
      Width = 706
      Height = 55
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = ''
      object UniLabel1: TUniLabel
        Left = 4
        Top = 5
        Width = 37
        Height = 13
        Hint = ''
        Caption = 'N'#250'mero'
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
        Left = 4
        Top = 20
        Width = 40
        Height = 13
        Hint = ''
        Caption = '0000/07'
        TabOrder = 2
      end
      object UniLabel3: TUniLabel
        Left = 54
        Top = 5
        Width = 72
        Height = 13
        Hint = ''
        Caption = 'N'#250'mero Pedido'
        TabOrder = 3
      end
      object UniEdit1: TUniEdit
        Left = 54
        Top = 20
        Width = 99
        Hint = ''
        Text = ''
        TabOrder = 4
      end
      object UniLabel4: TUniLabel
        Left = 155
        Top = 5
        Width = 115
        Height = 13
        Hint = ''
        Caption = 'C'#243'digo/Nome do Cliente'
        TabOrder = 5
      end
      object UniEdit2: TUniEdit
        Left = 155
        Top = 20
        Width = 134
        Hint = ''
        Text = ''
        TabOrder = 6
      end
      object Ctn_Entity: TUniContainerPanel
        Left = 292
        Top = 5
        Width = 306
        Height = 38
        Hint = ''
        ParentColor = False
        TabOrder = 7
      end
      object UniLabel5: TUniLabel
        Left = 601
        Top = 5
        Width = 27
        Height = 13
        Hint = ''
        Caption = 'Prazo'
        TabOrder = 8
      end
      object UniDateTimePicker1: TUniDateTimePicker
        Left = 601
        Top = 20
        Width = 97
        Hint = ''
        DateTime = 42998.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 9
      end
    end
    object UniPageControl1: TUniPageControl
      Left = 2
      Top = 57
      Width = 706
      Height = 231
      Hint = ''
      ActivePage = UniTabSheet2
      Align = alClient
      TabOrder = 2
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Rela'#231#227'o das Etapas'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 698
          Height = 203
          Hint = ''
          Align = alClient
          TabOrder = 0
          Caption = ''
          object UniDBGrid1: TUniDBGrid
            Left = 1
            Top = 1
            Width = 696
            Height = 201
            Hint = ''
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 1
          end
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Detalhamento da Assist'#234'ncia'
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 698
          Height = 203
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel6: TUniLabel
            Left = 5
            Top = 5
            Width = 43
            Height = 13
            Hint = ''
            Caption = 'Etapa N'#186
            TabOrder = 1
          end
          object UniEdit3: TUniEdit
            Left = 5
            Top = 20
            Width = 64
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object UniLabel7: TUniLabel
            Left = 71
            Top = 5
            Width = 66
            Height = 13
            Hint = ''
            Caption = 'Data Registro'
            TabOrder = 3
          end
          object UniDateTimePicker2: TUniDateTimePicker
            Left = 71
            Top = 20
            Width = 94
            Hint = ''
            DateTime = 42998.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 4
          end
          object UniLabel8: TUniLabel
            Left = 167
            Top = 5
            Width = 65
            Height = 13
            Hint = ''
            Caption = 'Data Prevista'
            TabOrder = 5
          end
          object UniDateTimePicker3: TUniDateTimePicker
            Left = 167
            Top = 20
            Width = 94
            Hint = ''
            DateTime = 42998.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 6
          end
          object Ctn_Situation: TUniContainerPanel
            Left = 264
            Top = 5
            Width = 256
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 7
          end
          object UniLabel9: TUniLabel
            Left = 524
            Top = 5
            Width = 64
            Height = 13
            Hint = ''
            Caption = 'Custo Cliente'
            TabOrder = 8
          end
          object UniEdit4: TUniEdit
            Left = 524
            Top = 20
            Width = 84
            Hint = ''
            Text = ''
            TabOrder = 9
          end
          object UniLabel10: TUniLabel
            Left = 610
            Top = 5
            Width = 64
            Height = 13
            Hint = ''
            Caption = 'Custo Cliente'
            TabOrder = 10
          end
          object UniEdit5: TUniEdit
            Left = 610
            Top = 20
            Width = 84
            Hint = ''
            Text = ''
            TabOrder = 11
          end
          object UniLabel11: TUniLabel
            Left = 5
            Top = 48
            Width = 225
            Height = 13
            Hint = ''
            Caption = 'Descreva detalhadamente a a'#231#227'o desta etapa '
            TabOrder = 12
          end
          object UniMemo1: TUniMemo
            Left = 5
            Top = 64
            Width = 689
            Height = 95
            Hint = ''
            Lines.Strings = (
              'UniMemo1')
            TabOrder = 13
          end
          object UniLabel12: TUniLabel
            Left = 528
            Top = 160
            Width = 66
            Height = 13
            Hint = ''
            Caption = 'Data Registro'
            TabOrder = 14
          end
          object UniDateTimePicker4: TUniDateTimePicker
            Left = 528
            Top = 175
            Width = 94
            Hint = ''
            DateTime = 42998.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 15
          end
          object UniLabel13: TUniLabel
            Left = 624
            Top = 160
            Width = 23
            Height = 13
            Hint = ''
            Caption = 'Hora'
            TabOrder = 16
          end
          object UniEdit6: TUniEdit
            Left = 624
            Top = 175
            Width = 70
            Hint = ''
            Text = ''
            TabOrder = 17
          end
        end
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 208
  end
end
