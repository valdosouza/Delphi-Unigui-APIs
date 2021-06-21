inherited FmProduct: TFmProduct
  Width = 336
  ExplicitWidth = 336
  inherited pnl_lista: TUniPanel
    Width = 336
    ExplicitWidth = 336
    ExplicitHeight = 40
    inherited Sb_Search: TUniSpeedButton
      Left = 284
      OnClick = Sb_SearchClick
      ExplicitLeft = 284
      ExplicitTop = 22
      ExplicitHeight = 25
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 313
      OnClick = Sb_RegisterClick
      ExplicitLeft = 313
      ExplicitTop = 22
      ExplicitHeight = 25
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 275
      ListField = 'id;description'
      FieldLabel = 'Produtos'
      FieldLabelFont.Color = clBlack
      ExplicitWidth = 275
    end
  end
end
