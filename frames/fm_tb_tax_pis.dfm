inherited FmTbTaxPis: TFmTbTaxPis
  Width = 373
  Height = 105
  ExplicitWidth = 373
  ExplicitHeight = 105
  inherited pnl_lista: TUniPanel
    Width = 373
    Height = 105
    inherited Sb_Search: TUniSpeedButton
      Left = 321
      Height = 80
      OnClick = Sb_SearchClick
      ExplicitLeft = 248
      ExplicitTop = 13
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 350
      Height = 80
      OnClick = Sb_RegisterClick
      ExplicitLeft = 225
      ExplicitTop = 13
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 312
      Height = 94
      ListField = 'id;description'
      ExplicitWidth = 218
    end
  end
end
