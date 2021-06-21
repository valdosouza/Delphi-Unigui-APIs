inherited SeaInstitution: TSeaInstitution
  ClientHeight = 454
  Caption = 'Pesquisa de Estabelecimento'
  ExplicitHeight = 513
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Height = 390
    ExplicitHeight = 390
    inherited pc_search: TUniPageControl
      Height = 386
      ExplicitHeight = 386
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 292
        ExplicitHeight = 358
        inherited pnl_param: TUniPanel
          Height = 358
          ExplicitHeight = 358
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 292
        ExplicitHeight = 358
        inherited dbg_Search: TUniDBGrid
          Height = 358
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 390
    ExplicitTop = 390
  end
end
