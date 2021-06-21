inherited FmBrand: TFmBrand
  Width = 291
  Height = 37
  ExplicitWidth = 291
  ExplicitHeight = 37
  inherited pnl_lista: TUniPanel
    Width = 291
    Height = 37
    ExplicitWidth = 291
    ExplicitHeight = 37
    inherited Sb_Search: TUniSpeedButton
      Left = 239
      Height = 12
      OnClick = Sb_SearchClick
      ExplicitLeft = 239
      ExplicitHeight = 12
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 268
      Height = 12
      OnClick = Sb_RegisterClick
      ExplicitLeft = 268
      ExplicitHeight = 12
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 230
      Height = 26
      ListField = 'id;description'
      FieldLabel = 'Marcas'
      ExplicitWidth = 230
      ExplicitHeight = 26
    end
  end
end
