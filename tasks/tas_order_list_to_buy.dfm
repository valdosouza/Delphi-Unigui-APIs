inherited TasOrderListToBuy: TTasOrderListToBuy
  ClientWidth = 764
  Caption = 'Lista de Itens Para Comprar'
  ExplicitWidth = 780
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Width = 764
    ExplicitWidth = 764
    inherited SB_Insert: TUniSpeedButton
      Left = 193
      Visible = False
      ExplicitLeft = 193
    end
    inherited SB_Change: TUniSpeedButton
      Left = 470
      Visible = False
      ExplicitLeft = 470
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 284
      Visible = False
      ExplicitLeft = 284
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      Caption = 'Continue'
      ExplicitLeft = 2
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 377
      Visible = False
      ExplicitLeft = 377
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 95
      ExplicitLeft = 95
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 764
    ExplicitWidth = 716
    inherited UniPanel1: TUniPanel
      Width = 760
      Height = 7
      ExplicitWidth = 760
      ExplicitHeight = 7
    end
    inherited dbg_list: TUniDBGrid
      Top = 9
      Width = 760
      Height = 310
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
      LoadMask.Message = 'Carregando dados...'
      OnSetCellValue = dbg_listSetCellValue
      Columns = <
        item
          FieldName = 'selected'
          Title.Caption = '...'
          Width = 16
          Font.Color = clWhite
          Alignment = taLeftJustify
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'S;N'
          CheckBoxField.DisplayValues = 'S;N'
        end
        item
          FieldName = 'ProductId'
          Title.Caption = 'C'#243'digo'
          Width = 64
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 345
        end
        item
          FieldName = 'tb_stock_list_id'
          Title.Caption = 'tb_stock_list_id'
          Width = 78
          Visible = False
        end
        item
          FieldName = 'stock_name'
          Title.Caption = 'Estoque'
          Width = 220
          Editor = DBLCB_Lista
        end
        item
          FieldName = 'quantity'
          Title.Caption = 'Quantidade'
          Width = 70
        end
        item
          FieldName = 'tb_order_id'
          Title.Caption = 'tb_order_id'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'tb_order_item_id'
          Title.Caption = 'tb_order_item_id'
          Width = 86
          Visible = False
        end>
    end
    object UniHiddenPanel1: TUniHiddenPanel
      Left = 375
      Top = 80
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
        KeyField = 'description'
        ListFieldIndex = 0
        AnyMatch = True
        TabOrder = 1
        Color = clWindow
      end
    end
  end
  inherited cds_Items: TClientDataSet
    IndexFieldNames = 'tb_order_item_id'
    ProviderName = ''
    Left = 88
    Top = 234
    object cds_ItemsProductId: TIntegerField
      FieldName = 'ProductId'
    end
    object cds_Itemsdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
    object cds_Itemstb_stock_list_id: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'tb_stock_list_id'
      Calculated = True
    end
    object cds_Itemsquantity: TFloatField
      FieldName = 'quantity'
    end
    object cds_Itemstb_order_id: TIntegerField
      FieldName = 'tb_order_id'
    end
    object cds_Itemstb_order_item_id: TIntegerField
      FieldName = 'tb_order_item_id'
    end
    object cds_Itemsstock_name: TStringField
      FieldName = 'stock_name'
      Size = 45
    end
    object cds_Itemsselected: TStringField
      FieldName = 'selected'
      Size = 1
    end
    object cds_Itemsorder_to_buy_id: TIntegerField
      FieldName = 'order_to_buy_id'
    end
    object cds_Itemsunit_value: TFloatField
      FieldName = 'unit_value'
    end
  end
end
