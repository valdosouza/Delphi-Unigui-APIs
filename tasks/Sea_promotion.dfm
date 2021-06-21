inherited SeaPromotion: TSeaPromotion
  Caption = 'Pesquisa de Promo'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    inherited pc_search: TUniPageControl
      ActivePage = tbs_param
      inherited tbs_param: TUniTabSheet
        inherited pnl_param: TUniPanel
          object ChBx_Active: TUniCheckBox
            AlignWithMargins = True
            Left = 5
            Top = 57
            Width = 812
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Promo'#231#227'o ativa'
            Align = alTop
            TabOrder = 1
            ExplicitTop = 54
            ExplicitWidth = 97
          end
          object pnl_param_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 818
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            Caption = ''
            ExplicitLeft = 16
            ExplicitTop = 112
            ExplicitWidth = 721
            object E_ValorTotal: TUniEdit
              AlignWithMargins = True
              Left = 123
              Top = 4
              Width = 80
              Height = 44
              Hint = ''
              ParentShowHint = False
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'Valor Total'
              FieldLabelAlign = laTop
            end
            object E_Qtde: TUniEdit
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 80
              Height = 44
              Hint = ''
              ParentShowHint = False
              Text = ''
              Align = alLeft
              TabOrder = 0
              FieldLabel = 'Quantidade'
              FieldLabelAlign = laTop
            end
            object UniLabel1: TUniLabel
              AlignWithMargins = True
              Left = 90
              Top = 21
              Width = 27
              Height = 27
              Hint = ''
              Margins.Top = 20
              Alignment = taCenter
              AutoSize = False
              Caption = 'X'
              Align = alLeft
              ParentFont = False
              Font.Height = -21
              TabOrder = 5
              ExplicitLeft = 59
              ExplicitTop = 16
              ExplicitHeight = 32
            end
            object E_BuscaCodBarras: TUniEdit
              AlignWithMargins = True
              Left = 209
              Top = 4
              Width = 147
              Height = 44
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'C'#243'digo de Barras'
              FieldLabelAlign = laTop
              ExplicitLeft = 212
              ExplicitTop = 22
              ExplicitHeight = 22
            end
            object E_BuscaProduto: TUniEdit
              AlignWithMargins = True
              Left = 362
              Top = 4
              Width = 452
              Height = 44
              Hint = ''
              Text = ''
              Align = alClient
              TabOrder = 3
              FieldLabel = 'Produto'
              FieldLabelAlign = laTop
              ExplicitLeft = 269
              ExplicitTop = 22
              ExplicitHeight = 22
            end
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        inherited dbg_Search: TUniDBGrid
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'Codigo'
              Width = 35
            end
            item
              FieldName = 'promocao'
              Title.Caption = 'Promo'#231#227'o'
              Width = 238
            end
            item
              FieldName = 'produto'
              Title.Caption = 'Produto'
              Width = 300
              ReadOnly = True
            end
            item
              FieldName = 'price_tag'
              Title.Caption = 'Pre'#231'o'
              Width = 75
            end
            item
              FieldName = 'quantity'
              Title.Caption = 'Quantidade'
              Width = 90
            end>
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 328
    Top = 161
  end
  inherited ds_msg: TDataSource
    Left = 376
    Top = 160
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchpromocao: TStringField
      FieldName = 'promocao'
      Size = 100
    end
    object cds_searchproduto: TStringField
      FieldName = 'produto'
      ReadOnly = True
      Size = 100
    end
    object cds_searchprice_tag: TFMTBCDField
      FieldName = 'price_tag'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 6
    end
    object cds_searchquantity: TBCDField
      FieldName = 'quantity'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 3
    end
    object cds_searchpro_codigo: TIntegerField
      FieldName = 'pro_codigo'
      ReadOnly = True
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 48
    Top = 192
  end
end
