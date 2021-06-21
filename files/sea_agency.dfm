inherited SeaAgency: TSeaAgency
  ClientHeight = 443
  ClientWidth = 869
  Caption = 'Pesquisa de Ag'#234'ncia de Publicidade'
  ExplicitWidth = 885
  ExplicitHeight = 502
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 869
    Height = 379
    ExplicitWidth = 869
    ExplicitHeight = 370
    inherited pc_search: TUniPageControl
      Width = 865
      Height = 375
      ExplicitWidth = 865
      ExplicitHeight = 366
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 857
        ExplicitHeight = 338
        inherited pnl_param: TUniPanel
          Width = 857
          Height = 347
          ExplicitWidth = 857
          ExplicitHeight = 338
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 857
        ExplicitHeight = 338
        inherited dbg_Search: TUniDBGrid
          Width = 857
          Height = 338
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 379
    Width = 869
    ExplicitTop = 370
    ExplicitWidth = 869
  end
end
