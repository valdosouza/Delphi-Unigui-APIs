inherited TasOrderListToDelivery: TTasOrderListToDelivery
  ClientWidth = 894
  Caption = 'Lista de Itens para Entregar'
  ExplicitWidth = 910
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Width = 894
    ExplicitWidth = 894
    inherited SB_Insert: TUniSpeedButton
      Left = 377
      Visible = False
      ExplicitLeft = 377
    end
    inherited SB_Change: TUniSpeedButton
      Left = 95
      Caption = 'Atualizar'
      ExplicitLeft = 95
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 281
      Visible = False
      ExplicitLeft = 281
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      Caption = 'Continuar'
      ExplicitLeft = 2
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 468
      Visible = False
      ExplicitLeft = 468
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 186
      ExplicitLeft = 186
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 894
    ExplicitWidth = 894
    inherited UniPanel1: TUniPanel
      Width = 890
      Height = 7
      ExplicitWidth = 890
      ExplicitHeight = 7
    end
    inherited dbg_list: TUniDBGrid
      Top = 9
      Width = 890
      Height = 310
      LoadMask.Message = 'Carregando dados....'
      OnSetCellValue = dbg_listSetCellValue
      Columns = <
        item
          FieldName = 'Selected'
          Title.Caption = '...'
          Width = 124
          Alignment = taLeftJustify
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'S;N'
          CheckBoxField.DisplayValues = 'S;N'
        end
        item
          FieldName = 'ProductId'
          Title.Caption = 'C'#243'digo'
          Width = 64
          Visible = False
          ReadOnly = True
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 345
          ReadOnly = True
        end
        item
          FieldName = 'tb_stock_list_id'
          Title.Caption = 'Estoque'
          Width = 220
          Visible = False
          Editor = DBLCB_Lista
        end
        item
          FieldName = 'stock_name'
          Title.Caption = 'Estoque'
          Width = 205
          Editor = DBLCB_Lista
        end
        item
          FieldName = 'quantity'
          Title.Caption = 'Quantidade'
          Width = 70
          ReadOnly = True
        end
        item
          FieldName = 'tb_order_id'
          Title.Caption = 'C'#243'digo'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'tb_order_item_id'
          Title.Caption = 'tb_order_item'
          Width = 72
          Visible = False
        end
        item
          FieldName = 'refer_doc'
          Title.Caption = 'Nota Fiscal/Doc Refer'#234'ncia'
          Width = 154
          Editor = e_refer_doc
        end>
    end
    object UniHiddenPanel1: TUniHiddenPanel
      Left = 380
      Top = 70
      Width = 201
      Height = 256
      Hint = ''
      Visible = True
      object DBLCB_Lista: TUniDBLookupComboBox
        Left = 32
        Top = 72
        Width = 145
        Hint = ''
        ListField = 'id;description'
        ListSource = UMM.ds_StockList
        KeyField = 'id'
        ListFieldIndex = 0
        AnyMatch = True
        TabOrder = 1
        Color = clWindow
      end
      object e_refer_doc: TUniEdit
        Left = 32
        Top = 144
        Width = 121
        Hint = ''
        Text = ''
        TabOrder = 2
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 112
    Top = 88
  end
  inherited cds_Items: TClientDataSet
    IndexFieldNames = 'tb_order_item_id'
    Left = 120
    Top = 154
    object cds_ItemsSelected: TStringField
      FieldName = 'Selected'
    end
    object cds_Itemstb_product_id: TIntegerField
      FieldName = 'tb_product_id'
    end
    object cds_Itemsdescription: TStringField
      FieldName = 'description'
    end
    object cds_Itemsorder_to_deliver_id: TIntegerField
      FieldName = 'order_to_deliver_id'
    end
    object cds_Itemstb_stock_list_id: TIntegerField
      FieldName = 'tb_stock_list_id'
    end
    object cds_Itemsstock_name: TStringField
      FieldName = 'stock_name'
      Size = 45
    end
    object cds_Itemsquantity: TFloatField
      FieldName = 'quantity'
    end
    object cds_Itemsid: TIntegerField
      FieldName = 'id'
    end
    object cds_Itemstb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
    end
    object cds_Itemstb_order_id: TIntegerField
      FieldName = 'tb_order_id'
    end
    object cds_Itemstb_order_item_id: TIntegerField
      FieldName = 'tb_order_item_id'
    end
    object cds_Itemsdt_record: TDateField
      FieldName = 'dt_record'
    end
    object cds_Itemsrefer_doc: TStringField
      FieldName = 'refer_doc'
      Size = 25
    end
    object cds_Itemsstatus: TStringField
      FieldName = 'status'
      Size = 1
    end
    object cds_Itemsunit_value: TFloatField
      FieldName = 'unit_value'
    end
  end
  inherited ds_search: TDataSource
    Left = 128
    Top = 234
  end
end
