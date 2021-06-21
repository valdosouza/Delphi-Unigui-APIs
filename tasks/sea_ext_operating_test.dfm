inherited SeaExtOperatingTest: TSeaExtOperatingTest
  ClientWidth = 774
  Caption = 'SeaExtOperatingTest'
  ExplicitWidth = 790
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 774
    ExplicitWidth = 774
    inherited pc_search: TUniPageControl
      Width = 770
      ExplicitWidth = 770
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 762
        inherited pnl_param: TUniPanel
          Width = 762
          ExplicitWidth = 762
          object UniEdit1: TUniEdit
            Left = 4
            Top = 31
            Width = 69
            Hint = ''
            Text = ''
            TabOrder = 1
          end
          object UniLabel1: TUniLabel
            Left = 4
            Top = 17
            Width = 37
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero'
            TabOrder = 2
          end
          object UniCheckBox1: TUniCheckBox
            Left = 75
            Top = 13
            Width = 97
            Height = 17
            Hint = ''
            Caption = 'Data Inicial'
            TabOrder = 3
          end
          object UniDateTimePicker1: TUniDateTimePicker
            Left = 75
            Top = 31
            Width = 97
            Hint = ''
            DateTime = 43004.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 4
          end
          object UniLabel2: TUniLabel
            Left = 174
            Top = 17
            Width = 48
            Height = 13
            Hint = ''
            Caption = 'Data Final'
            TabOrder = 5
          end
          object UniDateTimePicker2: TUniDateTimePicker
            Left = 174
            Top = 31
            Width = 104
            Hint = ''
            DateTime = 43004.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 6
          end
          object UniLabel3: TUniLabel
            Left = 280
            Top = 17
            Width = 76
            Height = 13
            Hint = ''
            Caption = 'Tipo do Extintor'
            TabOrder = 7
          end
          object UniEdit2: TUniEdit
            Left = 280
            Top = 31
            Width = 249
            Hint = ''
            Text = ''
            TabOrder = 8
          end
          object Ctn_Collaborator: TUniContainerPanel
            Left = 530
            Top = 20
            Width = 223
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 9
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 762
        inherited dbg_Search: TUniDBGrid
          Width = 762
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 774
    ExplicitWidth = 774
  end
end
