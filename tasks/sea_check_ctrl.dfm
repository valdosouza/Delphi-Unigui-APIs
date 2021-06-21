inherited SeaCheckCtrl: TSeaCheckCtrl
  ClientWidth = 617
  Caption = 'SeaCheckCtrl'
  ExplicitWidth = 633
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 617
    ExplicitWidth = 617
    ExplicitHeight = 346
    inherited pc_search: TUniPageControl
      Width = 613
      ActivePage = tbs_search
      ExplicitWidth = 613
      ExplicitHeight = 342
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 605
        ExplicitHeight = 314
        inherited pnl_param: TUniPanel
          Width = 605
          ExplicitWidth = 605
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 605
        ExplicitHeight = 314
        inherited dbg_Search: TUniDBGrid
          Width = 605
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'bank_number'
              Title.Caption = 'Banco'
              Width = 67
            end
            item
              FieldName = 'issuer'
              Title.Caption = 'Emitente'
              Width = 331
            end
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 102
            end
            item
              FieldName = 'check_value'
              Title.Caption = 'Valor'
              Width = 95
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 617
    ExplicitWidth = 617
  end
  inherited ds_search: TDataSource
    Left = 160
    Top = 354
  end
  inherited cds_search: TClientDataSet
    Left = 160
    Top = 298
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchnumber: TStringField
      FieldName = 'number'
    end
    object cds_searchbank_number: TStringField
      FieldName = 'bank_number'
      Size = 3
    end
    object cds_searchissuer: TStringField
      FieldName = 'issuer'
      Size = 100
    end
    object cds_searchcheck_value: TBCDField
      FieldName = 'check_value'
      Precision = 10
      Size = 2
    end
  end
  inherited DSP: TDataSetProvider
    Left = 160
    Top = 240
  end
end
