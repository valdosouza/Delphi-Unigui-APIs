inherited FmOrderItemsPacking: TFmOrderItemsPacking
  inherited Pnl_Items: TUniPanel
    inherited dbg_List_items: TUniDBGrid
      Columns = <
        item
          FieldName = 'codepro'
          Title.Caption = 'C'#243'digo'
          Width = 68
          Visible = False
        end
        item
          FieldName = 'identifier'
          Title.Caption = 'Interno'
          Width = 82
          Visible = False
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 439
        end
        item
          FieldName = 'id'
          Title.Caption = 'id'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'tb_institution_id'
          Title.Caption = 'tb_institution_id'
          Width = 81
          Visible = False
        end
        item
          FieldName = 'tb_order_id'
          Title.Caption = 'tb_order_id'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'tb_product_id'
          Title.Caption = 'tb_product_id'
          Width = 71
          Visible = False
        end
        item
          FieldName = 'update_stock'
          Title.Caption = 'update_stock'
          Width = 69
          Visible = False
        end
        item
          FieldName = 'quantity'
          Title.Caption = 'Quantidade'
          Width = 70
        end
        item
          FieldName = 'unit_value'
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 70
        end
        item
          FieldName = 'total_value'
          Title.Caption = 'Valor Total'
          Width = 75
        end
        item
          FieldName = 'discount_aliquot'
          Title.Caption = 'Aliq desc'
          Width = 70
        end
        item
          FieldName = 'discount_value'
          Title.Caption = 'Valor Desc'
          Width = 70
        end>
    end
  end
  inherited cds_items: TClientDataSet
    object cds_itemstb_order_to_deliver_id: TIntegerField
      FieldName = 'tb_order_to_deliver_id'
    end
  end
end
