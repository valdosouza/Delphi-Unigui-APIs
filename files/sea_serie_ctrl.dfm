inherited SeaSerieCtrl: TSeaSerieCtrl
  ClientWidth = 758
  Caption = 'SeaSerieCtrl'
  ExplicitWidth = 774
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 758
    ExplicitWidth = 758
    inherited pc_search: TUniPageControl
      Width = 754
      ExplicitWidth = 754
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 746
        inherited pnl_param: TUniPanel
          Width = 746
          ExplicitWidth = 746
          object UniCheckBox1: TUniCheckBox
            Left = 4
            Top = 19
            Width = 97
            Height = 17
            Hint = ''
            Caption = 'Data Inicial'
            TabOrder = 1
          end
          object UniDateTimePicker1: TUniDateTimePicker
            Left = 4
            Top = 36
            Width = 97
            Hint = ''
            DateTime = 43005.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object UniLabel1: TUniLabel
            Left = 104
            Top = 23
            Width = 48
            Height = 13
            Hint = ''
            Caption = 'Data Final'
            TabOrder = 3
          end
          object UniDateTimePicker2: TUniDateTimePicker
            Left = 104
            Top = 36
            Width = 97
            Hint = ''
            DateTime = 43005.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 4
          end
          object Ctn_Entity: TUniContainerPanel
            Left = 203
            Top = 27
            Width = 286
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 5
          end
          object UniLabel2: TUniLabel
            Left = 3
            Top = 71
            Width = 71
            Height = 13
            Hint = ''
            Caption = 'Ordem/Pedido '
            TabOrder = 6
          end
          object UniEdit1: TUniEdit
            Left = 3
            Top = 85
            Width = 79
            Hint = ''
            Text = ''
            TabOrder = 7
          end
          object UniLabel3: TUniLabel
            Left = 84
            Top = 71
            Width = 52
            Height = 13
            Hint = ''
            Caption = 'Nota Fiscal'
            TabOrder = 8
          end
          object UniEdit2: TUniEdit
            Left = 84
            Top = 85
            Width = 79
            Hint = ''
            Text = ''
            TabOrder = 9
          end
          object UniLabel4: TUniLabel
            Left = 165
            Top = 71
            Width = 74
            Height = 13
            Hint = ''
            Caption = 'C'#243'digo Produto'
            TabOrder = 10
          end
          object UniEdit3: TUniEdit
            Left = 165
            Top = 85
            Width = 140
            Hint = ''
            Text = ''
            TabOrder = 11
          end
          object Ctn_Product: TUniContainerPanel
            Left = 307
            Top = 71
            Width = 286
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 12
          end
          object UniLabel5: TUniLabel
            Left = 596
            Top = 71
            Width = 79
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero de S'#233'rie'
            TabOrder = 13
          end
          object UniEdit4: TUniEdit
            Left = 596
            Top = 85
            Width = 140
            Hint = ''
            Text = ''
            TabOrder = 14
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 746
        inherited dbg_Search: TUniDBGrid
          Width = 746
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 758
    ExplicitWidth = 758
  end
end
