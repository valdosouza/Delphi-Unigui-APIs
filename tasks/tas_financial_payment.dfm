inherited TasFinancialPayment: TTasFinancialPayment
  Caption = 'Financeiro - Contas '#224' Pagar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pg_Principal: TUniPageControl
    inherited tbs_valores: TUniTabSheet
      Caption = 'Valores '#224' pagar'
      inherited pnl_valores: TUniPanel
        inherited dbg_valores: TUniDBGrid
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'NotaFiscal'
              Title.Caption = 'Nota Fiscal'
              Width = 87
            end
            item
              FieldName = 'Duplicata'
              Title.Caption = 'Duplicata'
              Width = 97
              ReadOnly = True
            end
            item
              FieldName = 'dt_expiration'
              Title.Caption = 'Data Vencimento'
              Width = 85
              ReadOnly = True
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome/Raz'#227'o Social'
              Width = 588
              ReadOnly = True
            end
            item
              FieldName = 'tag_value'
              Title.Caption = 'Valor'
              Width = 102
              ReadOnly = True
            end>
        end
      end
      inherited pnl_botao_Valores: TUniPanel
        inherited SB_Insert: TUniSpeedButton
          OnClick = SB_InsertClick
        end
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 40
    Top = 144
  end
end
