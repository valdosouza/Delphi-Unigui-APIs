inherited FmSalesman: TFmSalesman
  Width = 271
  ExplicitWidth = 271
  inherited pnl_lista: TUniPanel
    Width = 271
    ExplicitWidth = 263
    inherited Sb_Search: TUniSpeedButton
      Left = 248
      Margins.Right = 0
      OnClick = Sb_SearchClick
      ExplicitLeft = 237
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 219
      Margins.Right = 3
      OnClick = Sb_RegisterClick
      ExplicitLeft = 208
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 210
      ListField = 'id;name_company'
      FieldLabel = 'Nome do Vendedor'
      ExplicitWidth = 199
    end
  end
end
