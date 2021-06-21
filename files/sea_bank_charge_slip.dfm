inherited SeaBankChargeSlip: TSeaBankChargeSlip
  ClientWidth = 767
  Caption = 'Pesquisa de Boleto de Cobran'#231'a'
  ExplicitWidth = 783
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 767
    ExplicitWidth = 767
    inherited pc_search: TUniPageControl
      Width = 763
      ActivePage = tbs_param
      ExplicitWidth = 763
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 755
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 755
          ExplicitWidth = 755
        end
        inherited pnl_config: TUniPanel
          Width = 755
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 755
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 755
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'bank'
              Title.Caption = 'Banco'
              Width = 122
              ReadOnly = True
            end
            item
              FieldName = 'agency'
              Title.Caption = 'Ag'#234'ncia'
              Width = 52
              ReadOnly = True
            end
            item
              FieldName = 'number'
              Title.Caption = 'Conta Corrente'
              Width = 79
              ReadOnly = True
            end
            item
              FieldName = 'account'
              Title.Caption = 'N'#186' Carteira'
              Width = 111
              ReadOnly = True
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o Carteira'
              Width = 604
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 767
    ExplicitWidth = 767
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchbank: TStringField
      FieldName = 'bank'
      ReadOnly = True
      Size = 100
    end
    object cds_searchagency: TStringField
      FieldName = 'agency'
      ReadOnly = True
      Size = 8
    end
    object cds_searchnumber: TStringField
      FieldName = 'number'
      ReadOnly = True
      Size = 10
    end
    object cds_searchaccount: TStringField
      FieldName = 'account'
      ReadOnly = True
      Size = 50
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      ReadOnly = True
      Size = 100
    end
  end
end
