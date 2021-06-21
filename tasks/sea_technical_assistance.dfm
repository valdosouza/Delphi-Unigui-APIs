inherited SeaTechnicalAssistance: TSeaTechnicalAssistance
  ClientWidth = 682
  Caption = 'Assist'#234'ncia T'#233'cnico'
  ExplicitWidth = 698
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 682
    ExplicitWidth = 682
    inherited pc_search: TUniPageControl
      Width = 678
      ExplicitWidth = 678
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 670
        inherited pnl_param: TUniPanel
          Width = 670
          ExplicitWidth = 670
          object UniLabel1: TUniLabel
            Left = 2
            Top = 19
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero Pedido'
            TabOrder = 1
          end
          object UniEdit1: TUniEdit
            Left = 2
            Top = 34
            Width = 109
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object Ctn_Situation: TUniContainerPanel
            Left = 122
            Top = 21
            Width = 268
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 3
          end
          object Ctn_Entity: TUniContainerPanel
            Left = 393
            Top = 21
            Width = 273
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 670
        inherited dbg_Search: TUniDBGrid
          Width = 670
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 682
    ExplicitWidth = 682
  end
end
