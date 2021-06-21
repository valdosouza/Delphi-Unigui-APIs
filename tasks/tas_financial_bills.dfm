inherited TasFinancialBills: TTasFinancialBills
  Caption = 'Financeiro - Contas '#224' Receber'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pg_Principal: TUniPageControl
    ExplicitHeight = 473
    inherited tbs_valores: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 937
      ExplicitHeight = 445
      inherited pnl_valores: TUniPanel
        inherited dbg_valores: TUniDBGrid
          OnCellClick = dbg_SearchCellClick
        end
      end
      inherited pnl_botao_Valores: TUniPanel
        ExplicitTop = 381
        ExplicitWidth = 937
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 208
    Top = 120
  end
  inherited ds_msg: TDataSource
    Left = 200
    Top = 80
  end
end
